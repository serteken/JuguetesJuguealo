using JuguetesJuguealo.Models;
using System;
using System.Linq;
using System.Web.ModelBinding;
using System.Web.UI;

namespace JuguetesJuguealo
{
    public partial class Aviones : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Producto> GetProductos([QueryString("id")] int? categoriaId, [RouteData] string nombreCategoria)
        {
            categoriaId = 2;

            var _db = new ContextoProducto();
            IQueryable<Producto> query = _db.Productos;
            if (categoriaId.HasValue && categoriaId > 0)
            {
                query = query.Where(p => p.CategoriaID == categoriaId);
            }

            if (!String.IsNullOrEmpty(nombreCategoria))
            {
                query = query.Where(p =>
                    String.Compare(p.Categoria.NombreCategoria,
                    nombreCategoria) == 0);
            }
            return query;
        }
    }
}