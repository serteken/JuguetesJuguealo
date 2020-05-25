using JuguetesJuguealo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JuguetesJuguealo
{
    public partial class DetallesProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Producto> GetProducto([QueryString("productoID")] int? productId, [RouteData] string nombreProducto)
        {
            var _db = new JuguetesJuguealo.Models.ContextoProducto();
            IQueryable<Producto> query = _db.Productos;
            if (productId.HasValue && productId > 0)
            {
                query = query.Where(p => p.ProductoID == productId);
            }

            else if (!String.IsNullOrEmpty(nombreProducto))
            {
                query = query.Where(p =>
                      String.Compare(p.NombreProducto, nombreProducto) == 0);
            }

            else
            {
                query = null;
            }
            return query;
        }
    }
}