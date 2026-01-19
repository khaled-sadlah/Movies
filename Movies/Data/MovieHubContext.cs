using Microsoft.EntityFrameworkCore;
using Movies.Models;

namespace Movies.Data
{
    public class MovieHubContext : DbContext
    {
        public MovieHubContext(DbContextOptions<MovieHubContext> options) : base(options) { }

        public DbSet<User> Users => Set<User>();
        public DbSet<Director> Directors => Set<Director>();
        public DbSet<Movie> Movies => Set<Movie>();

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<User>().HasData(new User
            {
                UserId = 1,
                userName = "Admin",
                userPass = "1234",
                userEmail = "admin@moviehub.com",
                userFname = "System Admin",
                userBirthDate = new DateTime(2000, 1, 1),
                userGender = "male",
                isAdmin = true
            });

            modelBuilder.Entity<Movie>()
                .HasOne(m => m.Director)
                .WithMany()
                .HasForeignKey(m => m.DirectorId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
