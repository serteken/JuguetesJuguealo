<%@ Page Title="Iniciar sesión" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JuguetesJuguealo.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

   <%-- Título--%>
    <div class="page-title fix">
	    <div class="header-top">
            <p>&nbsp;</p>
		    <h2 style="font-size:2em;">INICIAR SESIÓN</h2>
            <p>&nbsp;</p>
	    </div>
    </div>

  <%--Área de Logado--%>
 <div class="container">
   <div class="login-page page fix">  
     <div class="row">
        <div class="col-md-6">
           <div class="login">
            <section id="loginForm">
                
                    <h4>Utilice una cuenta local para iniciar sesión.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">

                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Correo electrónico</asp:Label>

                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                             CssClass="text-danger" ErrorMessage="El campo de correo electrónico es obligatorio." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Contraseña</asp:Label>

                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                               <p>
                        <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Has olvidado tu contraseña?</asp:HyperLink>
                                </p>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-6 col-md-4"  style="margin-left:0px;"  >
                            <div class="remember"  style="margin-left:0px;">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">¿Recordar cuenta?</asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-12 col-md-12"  style="margin-left:0px;">
                            <asp:Button runat="server" OnClick="LogIn" Text="Iniciar sesión" CssClass="btn btn-default" />
                             <p style="margin-top:10%;">
                            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Registrarse como usuario nuevo</asp:HyperLink>
                             </p>
                        </div>
                    </div>
                </section>
            </div>
          </div>

                   <div class="col-md-6" style="margin-bottom:15%;">
                        <section id="socialLoginForm"">
                            <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
                        </section>
                   </div>
     </div>
  </div>
</div>
</asp:Content>
