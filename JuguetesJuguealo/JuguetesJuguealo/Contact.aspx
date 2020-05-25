<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="JuguetesJuguealo.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


   <div class="page-title fix">
	    <div class="header-top">
            <p>&nbsp;</p>
		    <h2 style="font-size:2em;">Contacto</h2>
            <p>&nbsp;</p>
	    </div>
   </div>

<div class="contact-page page fix">
	<div class="container">
		<div class="row">
			<div class="contact-info col-sm-12">
				<div class="row">
					<div class="col-sm-6">
						<h4>Información de Contacto</h4>
						<p>perspiciatis unde omnis iste natus error sit voluptatem accm doloremque antium, totam rem aperiam, eaque ipsa perspiciatis unde omnis iste  aque ipsa perspiciatis unde omnis iste </p>
						<div class="info-single">
							<i class="fa fa-map-marker"></i>
							<p>Gran Via, 13</p>
							<p>01234 Madrid</p>
						</div>
						<div class="info-single">
							<i class="fa fa-phone"></i>
							<p>+91  123  456  789</p>
							<p>+91 123  456  789</p>
						</div>
						<div class="info-single">
							<i class="fa fa-globe"></i>
							<a href="#">info@juguetesjuguealo.com</a>
							<a href="#">www.juguetesjuguealo.com</a>
						</div>
					</div>
			
				</div>
			</div>
		
			<div class="contact-form col-sm-12" style="margin-top:0;">
				<h2> DEJA TU MENSAJE</h2>
				
					<div class="row">
						<div class="col-sm-6">
							<label for="name">Nombre*</label>
							<input type="text" id="name" />
							<label for="email">E-mail*</label>
							<input type="text" id="email" />
							<label for="phone">Teléfono*</label>
							<input type="text" id="phone" />
							<label for="subject">Asunto*</label>
							<input type="text" id="subject" />
						</div>
						<div class="col-sm-6">
							<label for="message">Mensaje</label>
							<textarea id="message" rows="7"></textarea>
							<input type="submit" class="submit" value="send"/>
						</div>
					</div>
				
			</div>
            <div>
				<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d12149.09368195044!2d-3.6527552!3d40.424944149999995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2ses!4v1588846507928!5m2!1ses!2ses" width="600" height="450" style="border:0;margin-top:10%;" aria-hidden="false" tabindex="0"></iframe>
			</div>
		</div>
	</div>
</div>
</asp:Content>
