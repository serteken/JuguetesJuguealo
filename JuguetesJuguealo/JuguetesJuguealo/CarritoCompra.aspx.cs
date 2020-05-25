using JuguetesJuguealo.Lógica;
using JuguetesJuguealo.Models;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;

namespace JuguetesJuguealo
{
    public partial class CarritoCompra : Page
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
                    //TituloCarritoCompra.InnerText = "Cesta Vacía";
                    UpdateBtn.Visible = false;
                    PagoImageBtn.Visible = false;
                }
            }

        }
        public List<CartItem> GetItemsCarritoCompra()
        {
            AccionesCarritoCompra actions = new AccionesCarritoCompra();
            return actions.GetCartItems();
        }

        public List<CartItem> UpdateCartItems()
        {
            using (AccionesCarritoCompra usuariosCarritoCompra = new AccionesCarritoCompra())
            {
                String cartId = usuariosCarritoCompra.GetCartId();

                AccionesCarritoCompra.CarritoCompraUpdates[] cartUpdates = new AccionesCarritoCompra.CarritoCompraUpdates[CartList.Rows.Count];
                for (int i = 0; i < CartList.Rows.Count; i++)
                {
                    IOrderedDictionary rowValues = new OrderedDictionary();
                    rowValues = GetValues(CartList.Rows[i]);
                    cartUpdates[i].ProductoId = Convert.ToInt32(rowValues["ProductoID"]);

                    CheckBox cbRemove = new CheckBox();
                    cbRemove = (CheckBox)CartList.Rows[i].FindControl("RemoveItem");
                    cartUpdates[i].RemoveItem = cbRemove.Checked;

                    TextBox quantityTextBox = new TextBox();
                    quantityTextBox = (TextBox)CartList.Rows[i].FindControl("PurchaseQuantity");
                    cartUpdates[i].PurchaseQuantity = Convert.ToInt16(quantityTextBox.Text.ToString());
                }
                usuariosCarritoCompra.UpdateCarritoCompraDatabase(cartId, cartUpdates);
                CartList.DataBind();
                lblTotal.Text = String.Format("{0:c}", usuariosCarritoCompra.GetTotal());
                return usuariosCarritoCompra.GetCartItems();
            }
        }

        public static IOrderedDictionary GetValues(GridViewRow row)
        {
            IOrderedDictionary values = new OrderedDictionary();
            foreach (DataControlFieldCell cell in row.Cells)
            {
                if (cell.Visible)
                {
                    // Extract values from the cell.
                    cell.ContainingField.ExtractValuesFromCell(values, cell, row.RowState, true);
                }
            }
            return values;
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            UpdateCartItems();
        }

        protected void PagoBtn_Click(object sender, ImageClickEventArgs e)
        {
            using (AccionesCarritoCompra usuariosCarritoCompra = new AccionesCarritoCompra())
            {
                Session["payment_amt"] = usuariosCarritoCompra.GetTotal();
            }
            Response.Redirect("Pago/EmpezarPago.aspx");
        }
    }
}