using System.ComponentModel.DataAnnotations;

namespace Movies.Models
{
    public class Movie
    {
        public int MovieId { get; set; }

        [Required, MaxLength(120)]
        public string movieTitle { get; set; } = string.Empty;

        [MaxLength(500)]
        public string? movieDesc { get; set; }

        [DataType(DataType.Date)]
        public DateTime? releaseDate { get; set; }

        [Required]
        public int DirectorId { get; set; }

        public Director? Director { get; set; }
    }
}
