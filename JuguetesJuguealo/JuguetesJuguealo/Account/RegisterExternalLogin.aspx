<%@ Page Title="Registrar un inicio de sesión externo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterExternalLogin.aspx.cs" Inherits="JuguetesJuguealo.Account.RegisterExternalLogin" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
  <%--  Título--%>
    <div class="page-title fix">

	    <div class="header-top">
            <p>&nbsp;</p>
		    <h2 style="font-size:2em;"> Regístrese con su cuenta <%: ProviderName %></h2>
            <p>&nbsp;</p>
	    </div>
    </div>

<asp:PlaceHolder runat="server">
  <div class="container"> 
    <div class="login-page page fix">
      <div class="row">
         <div class="col-md-12">
               <div class="form-horizontal">

                    <h4 style="margin-left:35%;">Formulario de asociación</h4>
                    <hr />
                    <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                    <p class="text-info" style="margin-bottom:5%;">
                        Ha autenticado con <strong><%: ProviderName %></strong>. Especifique una dirección de correo electrónico a continuación para el sitio actual
                        y haga clic en el botón Iniciar sesión.
                    </p>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="email" CssClass="col-md-4 control-label">Correo electrónico</asp:Label>

                        <div class="col-md-6" style="float:left;">
                            <asp:TextBox runat="server" ID="email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="email"
                                Display="Dynamic" CssClass="text-danger" ErrorMessage="Se requiere el correo electrónico" />
                            <asp:ModelErrorMessage runat="server" ModelStateKey="email" CssClass="text-error" />
                        </div>

                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-4 col-md-10">
                            <asp:Button runat="server" Text="Iniciar sesión" CssClass="btn btn-default" OnClick="LogIn_Click" />
                        </div>
                    </div>
               </div>
           </div>
       </div>
    </div>
 </div>
</asp:PlaceHolder>


<script type="text/javascript" src="Content/olonkar/js/jquery-2.1.4.min.js"></script>

<script type="text/javascript" src="Content/olonkar/js/bootstrap.min.js"></script>

<script type="text/javascript" src="Content/olonkar/js/owl.carousel.min.js"></script>

<script type="text/javascript" src="Content/olonkar/js/jquery.countTo.js"></script>

<script type="text/javascript" src="Content/olonkar/js/jquery.mixitup.min.js"></script>

<script type="text/javascript" src="Content/olonkar/js/jquery.magnific-popup.min.js"></script>

<script type="text/javascript" src="Content/olonkar/js/jquery.appear.js"></script>

<script type="text/javascript" src="Content/olonkar/js/jquery.meanmenu.min.js"></script>

<script type="text/javascript" src="Content/olonkar/js/jquery.nivo.slider.pack.js"></script>

<script type="text/javascript" src="Content/olonkar/js/jquery.scrollup.min.js"></script>

<script type="text/javascript" src="Content/olonkar/js/jquery.simpleLens.min.js"></script>

<script type="text/javascript" src="Content/olonkar/js/jquery-price-slider.js"></script>

<script type="text/javascript" src="Content/olonkar/js/wow.min.js"></script>
<script>
    new WOW().init();
</script>	

<script type="text/javascript" src="Content/olonkar/js/main.js"></script>
</asp:Content>
