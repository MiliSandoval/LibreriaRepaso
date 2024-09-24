using EFWebApi.Models;

namespace EFWebApi.Data.Repositories
{
    public class LibroRepository : ILibroRepository
    {
        private LibrosDbContext _context;

        public LibroRepository(LibrosDbContext context)
        {
            _context = context;
        }

        //public void SetContext(LibrosDbContext context)
        //{
        //    _context = context;
        //}

        public void Create(Libro libro)
        {
            _context.Libros.Add(libro);
            _context.SaveChanges();
        }

        public void Delete(int id)
        {
            var libroDelete = GetById(id);
            if(libroDelete != null)
            {
                _context.Libros.Remove(libroDelete);
                _context.SaveChanges();
            }
        }

        public List<Libro> GetAll()
        {
            return _context.Libros.ToList();
        }

        public Libro? GetById(int id)
        {
            return _context.Libros.Find(id);
        }

        public void Update(Libro libro)
        {
            if (libro != null)
            {
                _context.Libros.Update(libro);
                _context.SaveChanges();
            }
        }
    }
}
