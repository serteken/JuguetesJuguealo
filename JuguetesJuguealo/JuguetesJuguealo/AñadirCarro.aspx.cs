using JuguetesJuguealo.Lógica;
using System;
using System.Diagnostics;
using System.Web.UI;

namespace JuguetesJuguealo
{
    public partial class AñadirCarro : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string rawId = Request.QueryString["ProductoID"];
            int productoId;
            if (!String.IsNullOrEmpty(rawId) && int.TryParse(rawId, out productoId))
            {
                using (AccionesCarritoCompra usuariosCarritoCompra = new AccionesCarritoCompra())
                {
                    usuariosCarritoCompra.AddToCart(Convert.ToInt16(rawId));
                }

            }
            else
            {
                Debug.Fail("ERROR : No podemos añadir ningún producto sin un ID");
                throw new Exception("ERROR : Es ilegal cargar AddToCart.aspx sin configurar un ProductoId.");
            }
            Response.Redirect("CarritoCompra.aspx");
        }
    }
}