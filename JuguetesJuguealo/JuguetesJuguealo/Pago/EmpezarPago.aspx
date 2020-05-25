<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpezarPago.aspx.cs" Inherits="JuguetesJuguealo.Pago.EmpezarPago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	     <%--Título--%>
	  <div class="page-title fix">
			<div class="header-top">
				<p>&nbsp;</p>
				<h2 style="font-size:2em;">Revisión Pedido</h2>
				<p>&nbsp;</p>
			</div>
      </div>

 <section class="checkout-page page fix">
	<div class="container" style="margin-right:10%;">
		<div class="row">
			<div class="col-md-10">
				<div class="panel-group" id="checkout-progress">
				
					<div class="panel panel-default">
						<div class="panel-heading" >
							<a class="active" data-toggle="collapse" data-parent="#checkout-progress" href="#bill-info"><span>1</span>ENVÍO</a>
						</div>
						<div id="bill-info">
							<div class="panel-body">
								<div class="bill-info">
									<div class="group">
										<input type="text" placeholder="Nombre*" style="margin-right:2%;">
										<input type="text" placeholder="Apellidos*"style="margin-right:2%;">
									</div>
									<div class="group">
									<input type="text" placeholder="Dirección*" style="margin-right:2%;">
									<input type="text" placeholder="Población*"style="margin-right:2%;">
									<input type="text" placeholder="Provincia"style="margin-right:2%;">
									</div>
									<div class="group">
										<input type="text" placeholder="Código Postal*"style="margin-right:2%;">
										<input type="text" placeholder="País"style="margin-right:2%;">
									</div>
									<div class="group">
										<input type="text" placeholder="Dirección E-mail*"style="margin-right:2%;">
										<input type="text" placeholder="Teléfono*"style="margin-right:2%;">
									</div>
									
								</div>
							</div>
						</div>
					</div>

				  <div class="panel panel-default">
						<div class="panel-heading" >
							<a class="active" data-toggle="collapse" data-parent="#checkout-progress" href="#"><span>2</span>REVISIÓN PEDIDO</a>
						</div>
						<div >
						   <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="5"
                            ItemType="JuguetesJuguealo.Models.CartItem" SelectMethod="GetItemsCarritoCompra" 
                            CssClass="table cart-table">  
                
                                    <Columns>
                                        <asp:BoundField DataField="ProductoID" HeaderText="Referencia" SortExpression="ProductoID" />        
                                        <asp:BoundField DataField="Producto.NombreProducto" HeaderText="Nombre del Producto" />  
                                        <asp:BoundField DataField="Producto.Descripcion" HeaderText="Descripción" />        
                                        <asp:BoundField DataField="Producto.PrecioUnidad" HeaderText="Precio/Unidad" DataFormatString="{0:c}"/>
										
                                        <asp:TemplateField   HeaderText="Cantidad">            
                                                <ItemTemplate>
                                                   <%#: Item.Cantidad %>
                                                </ItemTemplate>        
                                        </asp:TemplateField>    
                                        <asp:TemplateField HeaderText="Item Total" >            
                                                <ItemTemplate>
                                                    <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Cantidad)) *  Convert.ToDouble(Item.Producto.PrecioUnidad)))%>
                                                </ItemTemplate>        
                                        </asp:TemplateField> 
                                        
                                    </Columns>    

                             </asp:GridView>

							  <div class="proceed fix">
				                   <div class="total">
                     
                                        <h6>
                                            <asp:Label ID="LabelTotalText" runat="server" Text="Total: "></asp:Label>
                                            <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
                                        </h6> 
                                    
                                     </div>
                     
				                </div>

						</div>
					</div>



					
					<div class="panel panel-default">
						<div class="panel-heading" >
							<a class="collapsed" data-toggle="collapse" data-parent="#checkout-progress" href="#shipping-info"><span>3</span>INFORMACIÓN DE ENVÍO</a>
						</div>
						<div id="shipping-info">
							<div class="panel-body">
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco aboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepte.</p>
							</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading" >
							<a class="collapsed" data-toggle="collapse" data-parent="#checkout-progress" href="#payment-met"><span>4</span>INFORMACIÓN DE PAGO</a>
						</div>
						<div id="payment-met">
							<div class="panel-body">
								<div class="payment-met">
									<p>Elige un método de pago:</p>
									<ul>
										<li><a href="#"><img src="/Content/olonkar/img/footer/paypal.jpg" alt="" /></a></li>
										<li><a href="#"><img src="/Content/olonkar/img/footer/visa.jpg" alt="" /></a></li>
										<li><a href="#"><img src="/Content/olonkar/img/footer/master.jpg" alt="" /></a></li>
										<li><a href="#"><img src="/Content/olonkar/img/footer/cards.jpg" alt="" /></a></li>
										<li><a href="#"><img src="/Content/olonkar/img/footer/discover.jpg" alt="" /></a></li>
									</ul>
					
								</div>
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>
</section>
	
</asp:Content>
