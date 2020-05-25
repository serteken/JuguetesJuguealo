using JuguetesJuguealo.Lógica;
using System;
using System.Web;
using System.Web.UI;

namespace JuguetesJuguealo
{
    public partial class PaginaError : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string generalErrorMsg = "Un problema ha ocurrido en este sitio web. Por favor inténtelo de nuevo. " +
                "Si el error continua pongase en contacto con soporte.";
            string httpErrorMsg = "Un error HTTP ha ocurrido.";
            string unhandledErrorMsg = "El error ha sido manejado por un error de código.";

           
            FriendlyErrorMsg.Text = generalErrorMsg;

           
            string errorHandler = Request.QueryString["handler"];
            if (errorHandler == null)
            {
                errorHandler = "Error Page";
            }

            
            Exception ex = Server.GetLastError();

            
            string errorMsg = Request.QueryString["msg"];
            if (errorMsg == "404")
            {
                ex = new HttpException(404, httpErrorMsg, ex);
                FriendlyErrorMsg.Text = ex.Message;
            }

            
            if (ex == null)
            {
                ex = new Exception(unhandledErrorMsg);
            }

            
            if (Request.IsLocal)
            {
                
                ErrorDetailedMsg.Text = ex.Message;

                
                ErrorHandler.Text = errorHandler;

                
                DetailedErrorPanel.Visible = true;

                if (ex.InnerException != null)
                {
                    InnerMessage.Text = ex.GetType().ToString() + "<br/>" +
                        ex.InnerException.Message;
                    InnerTrace.Text = ex.InnerException.StackTrace;
                }
                else
                {
                    InnerMessage.Text = ex.GetType().ToString();
                    if (ex.StackTrace != null)
                    {
                        InnerTrace.Text = ex.StackTrace.ToString().TrimStart();
                    }
                }
                
                UtilidadesExcepcion.LogException(ex, errorHandler);

                
                Server.ClearError();
            }
        }
    }
}