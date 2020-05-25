<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetallesProducto.aspx.cs" Inherits="JuguetesJuguealo.DetallesProducto" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-title fix">
	    <div class="header-top">
            <p>&nbsp;</p>
		    <h2 style="font-size:2em;">Detalles del Producto</h2>
            <p>&nbsp;</p>
	    </div>
    </div>

<section class="product-page page fix">

       <asp:FormView ID="productDetail" runat="server" ItemType="JuguetesJuguealo.Models.Producto" SelectMethod ="GetProducto" RenderOuterTable="false">
  
  <ItemTemplate>
	<div class="container">
		<div class="row">
            	<div class="col-sm-6">
				  <div class="details-pro-tab">
					<div class="tab-content details-pro-tab-content">

						<div class="tab-pane fade in active" id="image-1">
							<div class="simpleLens-big-image-container">
								<a class="simpleLens-lens-image" data-lens-image="/Juguetes/<%#:Item.ImagePath %>">
									<img src="/Juguetes/<%#:Item.ImagePath %>" alt="<%#:Item.NombreProducto %>" class="simpleLens-big-image">
								</a>
							</div>
						</div>

						<div class="tab-pane fade" id="image-2">
							<div class="simpleLens-big-image-container">
								<a class="simpleLens-lens-image" data-lens-image="/Juguetes/<%#:Item.ImagePath %>">
									<img src="/Juguetes/<%#:Item.ImagePath %>" alt="<%#:Item.NombreProducto %>" class="simpleLens-big-image">
								</a>
							</div>
						</div>

						<div class="tab-pane fade" id="image-3">
							<div class="simpleLens-big-image-container">
								<a class="simpleLens-lens-image" data-lens-image="/Juguetes/<%#:Item.ImagePath %>">
									<img src="/Juguetes/<%#:Item.ImagePath %>" alt="<%#:Item.NombreProducto %>" class="simpleLens-big-image">
								</a>
							</div>
						</div>

						<div class="tab-pane fade" id="image-4">
							<div class="simpleLens-big-image-container">
								<a class="simpleLens-lens-image" data-lens-image="/Juguetes/<%#:Item.ImagePath %>">
									<img src="/Juguetes/<%#:Item.ImagePath %>" alt="<%#:Item.NombreProducto %>" class="simpleLens-big-image">
								</a>
							</div>
						</div>

					</div>
					
					<ul class="tabs-list details-pro-tab-list" role="tablist">
						<li class="active"><a href="#image-1" data-toggle="tab"><img src="/Juguetes/<%#:Item.ImagePath%>" alt="<%#:Item.NombreProducto %>"/></a></li>
						<li><a href="#image-2" data-toggle="tab"><img src="/Juguetes/<%#:Item.ImagePath %>" alt="<%#:Item.NombreProducto %>"/></a></li>
					</ul>

				</div>
			</div>

		    <div class="col-sm-6">
				<div class="shop-details">
				
					<h2><%#:Item.NombreProducto %></h2>
					
					<div class="pro-ratting">
						<i class="on fa fa-star"></i>
						<i class="on fa fa-star"></i>
						<i class="on fa fa-star"></i>
						<i class="on fa fa-star"></i>
						<i class="on fa fa-star-half-o"></i>
					</div>
					<h3><%#: String.Format("{0:c}", Item.PrecioUnidad) %></h3>
					<h4>10 Comentarios</h4>
					<h5>Estado - <span>En Stock</span></h5>
					<h6>Guia Rápida</h6>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco aboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepte.</p>
					<div class="select-menu fix">
						<div class="sort fix">
							<h4>COLOR</h4>
							<select>
								<option value="3">Rojo</option>
								<option value="4">Azul</option>
								<option value="5">Blanco</option>
								<option value="6">Negro</option>
							</select>
						</div>
					</div>
					<div class="review">
						<textarea rows="4" placeholder="Escribe tu comentario..."></textarea>
					</div>
					<div class="action-btn">
						<a href="/AñadirCarro.aspx?productoID=<%#:Item.ProductoID %>"><i class="fa fa-shopping-cart"></i></a>
						<a href="#"><i class="fa fa-refresh"></i></a>
					</div>
				</div>
			</div>

			<div class="col-sm-12 fix">
				<div class="description">
					
					<ul class="nav product-nav">
						<li class="active"><a data-toggle="tab" href="#description">DESCRIPCION</a></li>
						<li class=""><a data-toggle="tab" href="#review">COMENTARIOS</a></li>
						<li class=""><a data-toggle="tab" href="#tags">ETIQUETAS</a></li>
					</ul>
					
					<div class="tab-content">
						<div id="description" class="tab-pane fade active in" role="tabpanel">

							<p><%#:Item.Descripcion %></p>
							
						</div>
						<div id="review" class="tab-pane fade" role="tabpanel">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco aboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepte.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamc.</p>
						</div>
						<div id="tags" class="tab-pane fade" role="tabpanel">
							<a href="#">BARCOS</a><a href="#">JUGUETES</a><a href="#">COCHES</a><a href="#">NIÑOS</a>
						</div>
					</div>
				</div>
			</div>
         </div>
       </div>
    </ItemTemplate>
   </asp:FormView>
 </section>
	    
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
