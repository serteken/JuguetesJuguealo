using JuguetesJuguealo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JuguetesJuguealo.Lógica
{
    public class AccionesCarritoCompra : IDisposable
    {
        public string CarritoCompraId { get; set; }

        private ContextoProducto _db = new ContextoProducto();

        public const string CartSessionKey = "CartId";

        public void AddToCart(int id)
        {
            // Recupero el producto de la base de datos

            CarritoCompraId = GetCartId();

            var cartItem = _db.CartItems.SingleOrDefault(
                c => c.CartId == CarritoCompraId
                && c.ProductoId == id);
            if (cartItem == null)
            {
                // Creo un nuevo item del carrito si no existe                 
                cartItem = new CartItem
                {
                    ItemId = Guid.NewGuid().ToString(),
                    ProductoId = id,
                    CartId = CarritoCompraId,
                    Producto = _db.Productos.SingleOrDefault(
                   p => p.ProductoID == id),
                    Cantidad = 1,
                    FechaCreacion = DateTime.Now
                };

                _db.CartItems.Add(cartItem);
            }
            else
            {
                // Si el item no existe en el carrito,                  
                // añado uno a la cantidad.                 
                cartItem.Cantidad++;
            }
            _db.SaveChanges();
        }

        public void Dispose()
        {
            if (_db != null)
            {
                _db.Dispose();
                _db = null;
            }
        }

        public string GetCartId()
        {
            if (HttpContext.Current.Session[CartSessionKey] == null)
            {
                if (!string.IsNullOrWhiteSpace(HttpContext.Current.User.Identity.Name))
                {
                    HttpContext.Current.Session[CartSessionKey] = HttpContext.Current.User.Identity.Name;
                }
                else
                {
                    // Genero un nuevo random GUID usando la clase de System.Guid.     
                    Guid tempCartId = Guid.NewGuid();
                    HttpContext.Current.Session[CartSessionKey] = tempCartId.ToString();
                }
            }
            return HttpContext.Current.Session[CartSessionKey].ToString();
        }

        public List<CartItem> GetCartItems()
        {
            CarritoCompraId = GetCartId();

            return _db.CartItems.Where(
                c => c.CartId == CarritoCompraId).ToList();
        }

        public decimal GetTotal()
        {
            CarritoCompraId = GetCartId();
            // Multiplico el producto elegido por la cantidad.       
            // Precio actual de cada uno de esos productos en el carrito.  
            // Sumo Todos los totales de precios de productos para obtener el total del carrito
            decimal? total = decimal.Zero;
            total = (decimal?)(from cartItems in _db.CartItems
                               where cartItems.CartId == CarritoCompraId
                               select (int?)cartItems.Cantidad *
                               cartItems.Producto.PrecioUnidad).Sum();
            return total ?? decimal.Zero;
        }

        public AccionesCarritoCompra GetCart(HttpContext context)
        {
            using (var cart = new AccionesCarritoCompra())
            {
                cart.CarritoCompraId = cart.GetCartId();
                return cart;
            }
        }

        public void UpdateCarritoCompraDatabase(string cartId, CarritoCompraUpdates[] CartItemUpdates)
        {
            using (var db = new JuguetesJuguealo.Models.ContextoProducto())
            {
                try
                {
                    int CartItemCount = CartItemUpdates.Count();
                    List<CartItem> myCart = GetCartItems();
                    foreach (var cartItem in myCart)
                    {
                        // Iterate through all rows within shopping cart list
                        for (int i = 0; i < CartItemCount; i++)
                        {
                            if (cartItem.Producto.ProductoID == CartItemUpdates[i].ProductoId)
                            {
                                if (CartItemUpdates[i].PurchaseQuantity < 1 || CartItemUpdates[i].RemoveItem == true)
                                {
                                    RemoveItem(cartId, cartItem.ProductoId);
                                }
                                else
                                {
                                    UpdateItem(cartId, cartItem.ProductoId, CartItemUpdates[i].PurchaseQuantity);
                                }
                            }
                        }
                    }
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to Update Cart Database - " + exp.Message.ToString(), exp);
                }
            }
        }

        public void RemoveItem(string removeCartID, int removeProductID)
        {
            using (var _db = new ContextoProducto())
            {
                try
                {
                    var myItem = (from c in _db.CartItems where c.CartId == removeCartID && c.Producto.ProductoID == removeProductID select c).FirstOrDefault();
                    if (myItem != null)
                    {
                        // Eliminar Producto.
                        _db.CartItems.Remove(myItem);
                        _db.SaveChanges();
                    }
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to Remove Cart Item - " + exp.Message.ToString(), exp);
                }
            }
        }

        public void UpdateItem(string updateCartID, int updateProductID, int quantity)
        {
            using (var _db = new ContextoProducto())
            {
                try
                {
                    var myItem = (from c in _db.CartItems where c.CartId == updateCartID && c.Producto.ProductoID == updateProductID select c).FirstOrDefault();
                    if (myItem != null)
                    {
                        myItem.Cantidad = quantity;
                        _db.SaveChanges();
                    }
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to Update Cart Item - " + exp.Message.ToString(), exp);
                }
            }
        }

        public void EmptyCart()
        {
            CarritoCompraId = GetCartId();
            var cartItems = _db.CartItems.Where(
                c => c.CartId == CarritoCompraId);
            foreach (var cartItem in cartItems)
            {
                _db.CartItems.Remove(cartItem);
            }
                         
            _db.SaveChanges();
        }

        public int GetCount()
        {
            CarritoCompraId = GetCartId();

            // Obtengo el recuento de cada artículo en el carrito y se vuelve a sumar         
            int? count = (from cartItems in _db.CartItems
                          where cartItems.CartId == CarritoCompraId
                          select (int?)cartItems.Cantidad).Sum();
            // Retormno 0 si todas las entradas son nulas.         
            return count ?? 0;
        }

        public struct CarritoCompraUpdates
        {
            public int ProductoId;
            public int PurchaseQuantity;
            public bool RemoveItem;
        }

        public void MigrateCart(string cartId, string userName)
        {
            var shoppingCart = _db.CartItems.Where(c => c.CartId == cartId);
            foreach (CartItem item in shoppingCart)
            {
                item.CartId = userName;
            }
            HttpContext.Current.Session[CartSessionKey] = userName;
            _db.SaveChanges();
        }
    }
}