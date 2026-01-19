using System.ComponentModel.DataAnnotations;

namespace Movies.Models
{
    public class Director
    {
        public int DirectorId { get; set; }

        [Required, MaxLength(80)]
        public string directorName { get; set; } = string.Empty;

        [DataType(DataType.Date)]
        public DateTime? directorBirthDate { get; set; }

        [MaxLength(10)]
        public string? directorGender { get; set; }
    }
}
