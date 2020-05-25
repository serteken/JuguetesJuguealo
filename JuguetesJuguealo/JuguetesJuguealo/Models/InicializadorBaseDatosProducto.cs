using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace JuguetesJuguealo.Models
{
    public class InicializadorBaseDatosProducto : DropCreateDatabaseIfModelChanges<ContextoProducto>
    {
        protected override void Seed(ContextoProducto context)
        {
            GetCategorias().ForEach(a => context.Categorias.Add(a));
            GetProductos().ForEach(b => context.Productos.Add(b));
        }

        private static List<Categoria> GetCategorias()
        {
            var categorias = new List<Categoria>
            {
                   new Categoria
                {
                    CategoriaID = 1,
                    NombreCategoria= "Coches"
                },
                new Categoria
                {
                    CategoriaID = 2,
                    NombreCategoria = "Aviones"
                },
                new Categoria
                {
                    CategoriaID = 3,
                    NombreCategoria = "Camiones"
                },
                new Categoria
                {
                    CategoriaID = 4,
                    NombreCategoria = "Barcos"
                },
                new Categoria
                {
                    CategoriaID = 5,
                    NombreCategoria = "Cohetes"
                },

            };
            return categorias;
        }

        private static List<Producto> GetProductos()
        {
            var productos = new List<Producto>
            {
                      new Producto
                {
                    ProductoID = 1,
                    NombreProducto = "Audi TT",
                    Descripcion = "Mítico coche deportivo de Audi para que disfruten los más pequeños de la casa",
                    ImagePath="AudiTT.jpg",
                    PrecioUnidad = 15.95,
                    CategoriaID = 1
                },
                      new Producto
                {
                    ProductoID = 2,
                    NombreProducto = "Land Rover Cruiser",
                    Descripcion = "Réplica exacta del Land Rover Cruiser",
                    ImagePath="LandRover.jpg",
                    PrecioUnidad = 10.95,
                    CategoriaID = 1
                },
                      new Producto
                {
                    ProductoID = 3,
                    NombreProducto = "Lamborgini Diablo",
                    Descripcion = "Lamborgini Diablo, un clásico de los coches deportivos",
                    ImagePath="Lamborgini.jpg",
                    PrecioUnidad = 11.95,
                    CategoriaID = 1
                },
                      new Producto
                {
                    ProductoID = 4,
                    NombreProducto = "Lamborgini",
                    Descripcion = "Lamborgini a pequeña escala",
                    ImagePath="Lamborgini2.jpg",
                    PrecioUnidad = 9.95,
                    CategoriaID = 1
                },

                      new Producto
                {
                    ProductoID = 5,
                    NombreProducto = "Bentley",
                    Descripcion = "Coche dirigido por los más pequeños de la casa",
                    ImagePath="BentleyFinal.jpg",
                    PrecioUnidad = 34.95,
                    CategoriaID = 1
                },

                      new Producto
                {
                    ProductoID = 6,
                    NombreProducto = "Avión Pelicula Cars",
                    Descripcion = "Avión que aparece en la película Cars",
                    ImagePath="AvionCarsFinal.jpg",
                    PrecioUnidad = 29.95,
                    CategoriaID = 2
                },
                      new Producto
                {
                    ProductoID = 7,
                    NombreProducto = "Avión de Espuma",
                    Descripcion = "Avión fabricado con espuma eva, regalo muy original",
                    ImagePath="AvionEspumaFinal.jpg",
                    PrecioUnidad = 19.95,
                    CategoriaID = 2
                },
                      new Producto
                {
                    ProductoID = 8,
                    NombreProducto = "Aviones con Simulación",
                    Descripcion = "Aviones con simulación de ruido, dispone de 4 botones con diferentes sonidos",
                    ImagePath="AvionesSimulacionFinal.jpg",
                    PrecioUnidad = 29.95,
                    CategoriaID = 2
                },
                      new Producto
                {
                    ProductoID = 9,
                    NombreProducto = "Helicoptero",
                    Descripcion = "Helicoptero azul de gran tamaño",
                    ImagePath="Helicoptero.jpg",
                    PrecioUnidad = 9.95,
                    CategoriaID = 2
                },

                      new Producto
                {
                    ProductoID = 10,
                    NombreProducto = "Maqueta Avion",
                    Descripcion = "Una maqueta para montar en familia con maderas nobles",
                    ImagePath="MaquetaAvion.jpg",
                    PrecioUnidad = 24.95,
                    CategoriaID = 2
                },

                      new Producto
                {
                    ProductoID = 11,
                    NombreProducto = "Camión de Bomberos",
                    Descripcion = "Réplica de un Camión de Bomberos con todos los detalles",
                    ImagePath="CamionBomberosFinal.jpg",
                    PrecioUnidad = 19.95,
                    CategoriaID = 3
                },
                      new Producto
                {
                    ProductoID = 12,
                    NombreProducto = "Camión de Plástico",
                    Descripcion = "Camión de colores llamativos especial menores de 3 años",
                    ImagePath="CamionPlasticoFinal.jpg",
                    PrecioUnidad = 4.95,
                    CategoriaID = 3
                },
                      new Producto
                {
                    ProductoID = 13,
                    NombreProducto = "Camión remolcador",
                    Descripcion = "Camión que permite remolcar hasta un coche de tamaño pqueño",
                    ImagePath="Remolcador.jpg",
                    PrecioUnidad = 11.95,
                    CategoriaID = 3
                },
                      new Producto
                {
                    ProductoID = 14,
                    NombreProducto = "Mack",
                    Descripcion = "Réplica de camión Mack especial coleccionistas",
                    ImagePath="Mack.jpg",
                    PrecioUnidad = 49.95,
                    CategoriaID = 3
                },

                      new Producto
                {
                    ProductoID =15,
                    NombreProducto = "Barco de Hojalata",
                    Descripcion = "Barco antiguo hecho de hojalata especial coleccionistas",
                    ImagePath="BarcoHojalataFinal.jpg",
                    PrecioUnidad = 59.95,
                    CategoriaID = 4
                },

                      new Producto
                {
                    ProductoID = 16,
                    NombreProducto = "Barco Peppa Pig",
                    Descripcion = "Camión que permite remolcar hasta un coche de tamaño pqueño",
                    ImagePath="BarcoPeppaPigFinal.jpg",
                    PrecioUnidad = 11.95,
                    CategoriaID = 4
                },
                      new Producto
                    {
                    ProductoID = 17,
                    NombreProducto = "Portaviones",
                    Descripcion = "Réplica de portaviones de la marina con todos los detalles",
                    ImagePath="Portaviones.jpg",
                    PrecioUnidad = 49.95,
                    CategoriaID = 4
                    },

                      new Producto
                {
                    ProductoID =18,
                    NombreProducto = "Barco de Rescate",
                    Descripcion = "Barco de rescate, flotabilidad total y sonidos de alarma",
                    ImagePath="BarcoRescateFinal.jpg",
                    PrecioUnidad = 20.95,
                    CategoriaID = 4
                },

                      new Producto
                {
                    ProductoID =19,
                    NombreProducto = "Cohete Básico",
                    Descripcion = "Cohete para niños hecho con material reciclado",
                    ImagePath="CoheteFinal.jpg",
                    PrecioUnidad = 9.95,
                    CategoriaID = 5
                },

                      new Producto
                {
                    ProductoID =20,
                    NombreProducto = "Cohete de Madera",
                    Descripcion = "Maqueta para terminar con los mas pequeños de madera reciclada",
                    ImagePath="CoheteMadera.jpg",
                    PrecioUnidad = 18.95,
                    CategoriaID = 5
                },

                      new Producto
                {
                    ProductoID =21,
                    NombreProducto = "Cohete de Playmobil",
                    Descripcion = "Cohete de la legendaria casa playmobil con todos los personajes de la foto",
                    ImagePath="CoheteCasa.jpg",
                    PrecioUnidad = 35.95,
                    CategoriaID = 5
                },

                      new Producto
                {
                    ProductoID =22,
                    NombreProducto = "Conjunto Explorador del Espacio",
                    Descripcion = "Explorador de satélites espaciales con astronautas, satélites y transbordador de regalo",
                    ImagePath="CoheteExplorador.jpg",
                    PrecioUnidad = 22.95,
                    CategoriaID = 5
                },


            };
            return productos;
        }
    }
}