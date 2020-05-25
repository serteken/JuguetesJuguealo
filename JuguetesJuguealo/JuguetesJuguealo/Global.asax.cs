using System;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Data.Entity;
using JuguetesJuguealo.Models;
using JuguetesJuguealo.Lógica;

namespace JuguetesJuguealo
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Código que se ejecuta al iniciar la aplicación
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Inicializo la base de datos de los productos.
            Database.SetInitializer(new InicializadorBaseDatosProducto());

            AccionesRol roleActions = new AccionesRol();
            roleActions.AddUserAndRole();

            // Add Routes.
            RegisterCustomRoutes(RouteTable.Routes);
        }

        void RegisterCustomRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
                "ProductsByCategoryRoute",
                "Categoria/{nombreCategoria}",
                "~/ListaProducto.aspx"
            );
            routes.MapPageRoute(
                "ProductByNameRoute",
                "Producto/{nombreProducto}",
                "~/DetallesProducto.aspx"
            );
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs.

            // Get last error from the server
            Exception exc = Server.GetLastError();

            if (exc is HttpUnhandledException)
            {
                if (exc.InnerException != null)
                {
                    exc = new Exception(exc.InnerException.Message);
                    Server.Transfer("PaginaError.aspx?handler=Application_Error%20-%20Global.asax",
                        true);
                }
            }
        }
    }
}