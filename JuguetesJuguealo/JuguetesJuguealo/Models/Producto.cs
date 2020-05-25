using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace JuguetesJuguealo.Models
{
    public class Producto
    {
        [ScaffoldColumn(false)]
        public int ProductoID { get; set; }

        [Required, StringLength(100), Display(Name = "Nombre")]
        public string NombreProducto { get; set; }

        [Required, StringLength(10000), Display(Name = "Descripción del Producto"), DataType(DataType.MultilineText)]
        public string Descripcion { get; set; }

        public string ImagePath { get; set; }

        [Display(Name = "Precio")]
        public double? PrecioUnidad { get; set; }

        public int? CategoriaID { get; set; }

        public virtual Categoria Categoria { get; set; }
    }
}