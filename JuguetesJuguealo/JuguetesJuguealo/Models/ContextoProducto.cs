using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace JuguetesJuguealo.Models
{
    public class ContextoProducto : DbContext
    {
        public ContextoProducto() : base("JuguetesJuguealo")
        {

        }

        public DbSet<Categoria> Categorias { get; set; }
        public DbSet<Producto> Productos { get; set; }
        public DbSet<CartItem> CartItems { get; set; }
       
    }

   
}