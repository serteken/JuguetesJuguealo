using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace JuguetesJuguealo.Models
{
    public class CartItem
    {
        [Key]
        public string ItemId { get; set; }

        public string CartId { get; set; }

        public int Cantidad { get; set; }

        public System.DateTime FechaCreacion { get; set; }

        public int ProductoId { get; set; }

        public virtual Producto Producto { get; set; }
    }
}