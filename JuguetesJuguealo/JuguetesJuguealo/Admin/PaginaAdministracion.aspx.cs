using JuguetesJuguealo.Lógica;
using System;
using System.Linq;
using System.Web.UI;

namespace JuguetesJuguealo.Admin
{
    public partial class PaginaAdministracion: Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string productAction = Request.QueryString["ProductAction"];
            if (productAction == "add")
            {
                LabelAddStatus.Text = "Producto añadido!";
            }

            if (productAction == "remove")
            {
                LabelRemoveStatus.Text = "Producto eliminado!";
            }
        }

        protected void AddProductButton_Click(object sender, EventArgs e)
        {
            Boolean fileOK = false;
            String path = Server.MapPath("~/Juguetes/");
            if (ProductImage.HasFile)
            {
                String fileExtension = System.IO.Path.GetExtension(ProductImage.FileName).ToLower();
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                    }
                }
            }

            if (fileOK)
            {
                try
                {
                    // Salvar las imágenes en carpeta.
                    ProductImage.PostedFile.SaveAs(path + ProductImage.FileName);
                    
                    ProductImage.PostedFile.SaveAs(path + "Thumbs/" + ProductImage.FileName);
                }
                catch (Exception ex)
                {
                    LabelAddStatus.Text = ex.Message;
                }

                // Añadir producto a la DB
                AñadirProductos products = new AñadirProductos();
                bool addSuccess = products.AñadirProducto(AddProductName.Text, AddProductDescription.Text,
                    AddProductPrice.Text, DropDownAddCategory.SelectedValue, ProductImage.FileName);
                if (addSuccess)
                {
                    // Recargar la página.
                    string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                    Response.Redirect(pageUrl + "?ProductAction=add");
                }
                else
                {
                    LabelAddStatus.Text = "Habilitado para añadir producto a la base de datos.";
                }
            }
            else
            {
                LabelAddStatus.Text = "Habilitado para añadir un tipo de archivo.";
            }
        }

        public IQueryable GetCategorias()
        {
            var _db = new Models.ContextoProducto();
            IQueryable query = _db.Categorias;
            return query;
        }

        public IQueryable GetProductos()
        {
            var _db = new Models.ContextoProducto();
            IQueryable query = _db.Productos;
            return query;
        }

        protected void RemoveProductButton_Click(object sender, EventArgs e)
        {
            using (var _db = new Models.ContextoProducto())
            {
                int productId = Convert.ToInt16(DropDownRemoveProduct.SelectedValue);
                var myItem = (from c in _db.Productos where c.ProductoID == productId select c).FirstOrDefault();
                if (myItem != null)
                {
                    _db.Productos.Remove(myItem);
                    _db.SaveChanges();

                    // Recargar la página.
                    string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                    Response.Redirect(pageUrl + "?ProductAction=remove");
                }
                else
                {
                    LabelRemoveStatus.Text = "Habilitado para localizar el producto.";
                }
            }
        }
    }
}