using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Movies.Data;
using Movies.Models;

namespace Movies.Controllers
{
    public class HomeController : Controller
    {
        private readonly MovieHubContext _context;

        public HomeController(MovieHubContext context)
        {
            _context = context;
        }

        private int? CurrentUserId()
        {
            return HttpContext.Session.GetInt32("id");
        }

        private bool IsLoggedIn()
        {
            return CurrentUserId() != null;
        }

        private User? CurrentUser()
        {
            var id = CurrentUserId();
            if (id == null) return null;
            return _context.Users.FirstOrDefault(x => x.UserId == id.Value);
        }

        private bool IsAdmin()
        {
            var u = CurrentUser();
            return u != null && u.isAdmin;
        }

        private IActionResult RequireLogin()
        {
            if (!IsLoggedIn())
                return RedirectToAction("Login");
            return null!;
        }

        private IActionResult RequireAdmin()
        {
            var red = RequireLogin();
            if (red != null) return red;
            if (!IsAdmin())
                return RedirectToAction("Index");
            return null!;
        }

        public IActionResult Index()
        {
            var red = RequireLogin();
            if (red != null) return red;

            var u = CurrentUser();
            bool isAdmin = u?.isAdmin ?? false;

            ViewBag.UserName = u?.userName ?? "User";
            ViewBag.IsAdmin = isAdmin;

            ViewBag.TotalMovies = _context.Movies.Count();
            ViewBag.TotalDirectors = _context.Directors.Count();

            if (isAdmin)
            {
                ViewBag.Users = _context.Users
                    .OrderBy(x => x.UserId)
                    .ToList();
            }

            return View();
        }


        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Register(User u)
        {
            if (!ModelState.IsValid)
                return View(u);

            bool exists = _context.Users.Any(x => x.userName == u.userName);
            if (exists)
            {
                ViewBag.msg = "Username already exists";
                return View(u);
            }

            u.isAdmin = false;
            _context.Users.Add(u);
            _context.SaveChanges();

            return RedirectToAction("Login");
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(string userName, string userPass)
        {
            var u = _context.Users.FirstOrDefault(x => x.userName == userName && x.userPass == userPass);
            if (u == null)
            {
                ViewBag.msg = "Invalid username or password";
                return View();
            }

            HttpContext.Session.SetInt32("id", u.UserId);
            HttpContext.Session.SetString("name", u.userName);

            return RedirectToAction("Index");
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Login");
        }

        [HttpGet]
        public IActionResult ChangePass()
        {
            var red = RequireLogin();
            if (red != null) return red;
            return View();
        }

        [HttpPost]
        public IActionResult ChangePass(string oldPass, string newPass)
        {
            var red = RequireLogin();
            if (red != null) return red;

            var uid = CurrentUserId()!.Value;
            var u = _context.Users.Find(uid);
            if (u == null) return RedirectToAction("Login");

            if (u.userPass != oldPass)
            {
                ViewBag.msg = "Old password is incorrect";
                return View();
            }

            u.userPass = newPass;
            _context.SaveChanges();

            return RedirectToAction("Logout");
        }

        public IActionResult Directors(string? search)
        {
            var red = RequireLogin();
            if (red != null) return red;

            ViewBag.IsAdmin = IsAdmin();

            var q = _context.Directors.AsQueryable();
            if (!string.IsNullOrWhiteSpace(search))
                q = q.Where(d => d.directorName.Contains(search));

            return View(q.ToList());
        }

        [HttpPost]
        public IActionResult AddDirector(Director d)
        {
            var red = RequireAdmin();
            if (red != null) return red;

            if (!ModelState.IsValid)
                return RedirectToAction("Directors");

            _context.Directors.Add(d);
            _context.SaveChanges();
            return RedirectToAction("Directors");
        }

        public IActionResult DeleteDirector(int id)
        {
            var red = RequireAdmin();
            if (red != null) return red;

            var d = _context.Directors.Find(id);
            if (d != null)
            {
                _context.Directors.Remove(d);
                _context.SaveChanges();
            }

            return RedirectToAction("Directors");
        }

        public IActionResult Movies(string? search)
        {
            var red = RequireLogin();
            if (red != null) return red;

            ViewBag.IsAdmin = IsAdmin();
            ViewBag.Directors = _context.Directors.ToList();

            var q = _context.Movies.Include(m => m.Director).AsQueryable();
            if (!string.IsNullOrWhiteSpace(search))
                q = q.Where(m => m.movieTitle.Contains(search));

            return View(q.ToList());
        }

        [HttpPost]
        public IActionResult AddMovie(Movie m)
        {
            var red = RequireAdmin();
            if (red != null) return red;

            if (!ModelState.IsValid)
                return RedirectToAction("Movies");

            _context.Movies.Add(m);
            _context.SaveChanges();
            return RedirectToAction("Movies");
        }

        public IActionResult DeleteMovie(int id)
        {
            var red = RequireAdmin();
            if (red != null) return red;

            var m = _context.Movies.Find(id);
            if (m != null)
            {
                _context.Movies.Remove(m);
                _context.SaveChanges();
            }

            return RedirectToAction("Movies");
        }
    }
}
