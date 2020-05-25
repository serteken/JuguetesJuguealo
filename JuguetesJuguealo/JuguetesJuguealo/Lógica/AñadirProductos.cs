using JuguetesJuguealo.Models;
using System;

namespace JuguetesJuguealo.Lógica
{
    public class AñadirProductos
    {
        public bool AñadirProducto(string NombreProducto, string DescripcionProducto, string PrecioProducto, string CategoriaProducto, string ProductoImagePath)
        {
            var miProducto = new Producto();
            miProducto.NombreProducto = NombreProducto;
            miProducto.Descripcion = DescripcionProducto;
            miProducto.PrecioUnidad = Convert.ToDouble(PrecioProducto) / 100;
            miProducto.ImagePath = ProductoImagePath;
            miProducto.CategoriaID = Convert.ToInt32(CategoriaProducto);

            using (ContextoProducto _db = new ContextoProducto())
            {
                // Añado producto a la base de datos.
                _db.Productos.Add(miProducto);
                _db.SaveChanges();
            }
          
            return true;
        }
    }
}