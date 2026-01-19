using System.ComponentModel.DataAnnotations;

namespace Movies.Models
{
    public class User
    {
        public int UserId { get; set; }

        [Required, MaxLength(50)]
        public string userName { get; set; } = string.Empty;

        [Required, MaxLength(50)]
        public string userPass { get; set; } = string.Empty;

        [Required, EmailAddress, MaxLength(100)]
        public string userEmail { get; set; } = string.Empty;

        [Required, MaxLength(50)]
        public string userFname { get; set; } = string.Empty;

        [DataType(DataType.Date)]
        public DateTime? userBirthDate { get; set; }

        [MaxLength(10)]
        public string? userGender { get; set; }

        public bool isAdmin { get; set; } = false;
    }
}
