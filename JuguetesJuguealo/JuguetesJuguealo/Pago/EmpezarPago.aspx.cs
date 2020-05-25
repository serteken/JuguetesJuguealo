using JuguetesJuguealo.Lógica;
using JuguetesJuguealo.Models;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace JuguetesJuguealo.Pago
{
    public partial class EmpezarPago : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (AccionesCarritoCompra usuariosCarritoCompra = new AccionesCarritoCompra())
            {
                decimal totalCarro = 0;
                totalCarro = usuariosCarritoCompra.GetTotal();
                if (totalCarro > 0)
                {
                    // Display Total.
                    lblTotal.Text = String.Format("{0:c}", totalCarro);
                }
                else
                {
                    LabelTotalText.Text = "";
                    lblTotal.Text = "";
                   
                }
            }

        }

        public List<CartItem> GetItemsCarritoCompra()
        {
            AccionesCarritoCompra actions = new AccionesCarritoCompra();
            return actions.GetCartItems();
        }

        protected void Continue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}