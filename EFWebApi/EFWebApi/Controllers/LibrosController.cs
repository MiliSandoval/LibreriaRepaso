using EFWebApi.Data.Repositories;
using EFWebApi.Models;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EFWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LibrosController : ControllerBase
    {
        private ILibroRepository _repository;

        public LibrosController(LibroRepository repository)
        {
            _repository = repository;
        }

        // GET: api/<LibrosController>
        [HttpGet]
        public IActionResult Get()
        {
            try
            {
                return Ok(_repository.GetAll());
            }
            catch(Exception)
            {
               return StatusCode(500, "Ha ocurrido un error interno!");
            }
        }

        // POST api/<LibrosController>
        [HttpPost]
        public IActionResult Post([FromBody] Libro value)
        {
            try
            {
                if(IsValid(value)) //Validaciones de datos
                {
                    _repository.Create(value);
                    return Ok("Libro insertado!");
                }
                else
                {
                    return BadRequest("Los datos no son correctos o incompletos!");
                }
            }
            catch (Exception)
            {
                return StatusCode(500, "Ha ocurrido un error interno!");
            }
        }

        private bool IsValid(Libro value)
        {
            return !string.IsNullOrEmpty(value.Isbn) && !string.IsNullOrEmpty(value.Nombre) && !string.IsNullOrEmpty(value.FechaPublicacion);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            try
            {
                _repository.Delete(id);
                return Ok("Libro borrado!");
            }
            catch (Exception)
            {
                return StatusCode(500, "Ha ocurrido un error interno!");
            }
        }
    }
}
