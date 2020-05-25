<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarritoCompra.aspx.cs" Inherits="JuguetesJuguealo.CarritoCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-title fix">
	    <div class="header-top">
            <p>&nbsp;</p>
		    <h2 style="font-size:2em;">Carrito Compra</h2>
            <p>&nbsp;</p>
	    </div>
    </div>

 <section class="cart-page page fix">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="table-responsive">

                            <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
                            ItemType="JuguetesJuguealo.Models.CartItem" SelectMethod="GetItemsCarritoCompra" 
                            CssClass="table cart-table">  
                
                                    <Columns>
                                        <asp:BoundField DataField="ProductoID" HeaderText="Referencia" SortExpression="ProductoID" />        
                                        <asp:BoundField DataField="Producto.NombreProducto" HeaderText="Nombre del Producto" />  
                                        <asp:BoundField DataField="Producto.Descripcion" HeaderText="Descripción" />        
                                        <asp:BoundField DataField="Producto.PrecioUnidad" HeaderText="Precio/Unidad" DataFormatString="{0:c}"/>     
                                        <asp:TemplateField   HeaderText="Cantidad">            
                                                <ItemTemplate>
                                                    <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" Text="<%#: Item.Cantidad %>"></asp:TextBox> 
                                                </ItemTemplate>        
                                        </asp:TemplateField>    
                                        <asp:TemplateField HeaderText="Item Total" >            
                                                <ItemTemplate>
                                                    <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Cantidad)) *  Convert.ToDouble(Item.Producto.PrecioUnidad)))%>
                                                </ItemTemplate>        
                                        </asp:TemplateField> 
                                        <asp:TemplateField HeaderText="Eliminar de la cesta">            
                                                <ItemTemplate>
                                                    <asp:CheckBox id="RemoveItem" runat="server"></asp:CheckBox>
                                                </ItemTemplate>        
                                        </asp:TemplateField>    
                                    </Columns>    

                             </asp:GridView>
             
                            <div class="col-sm-6 col-md-7">
				                <div class="coupon">

                                    <asp:Button ID="UpdateBtn" runat="server" Text="Actualizar Carrito" OnClick="UpdateBtn_Click" />
                                     <h3></h3>
					                <a href="ListaProducto.aspx">Continua Comprando</a>

					                <p><span>A TENER EN CUENTA :</span> El envío y los impuestos se estiman y actualizan durante el pago en función de su información de facturación y envío.</p>
				                </div>
			                </div>

			                <div class="col-sm-6 col-md-5">
				                <div class="proceed fix">
				                   <div class="total">
                     
                                        <h6>
                                            <asp:Label ID="LabelTotalText" runat="server" Text="Total: "></asp:Label>
                                            <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
                                        </h6> 
                                      <a id="procedto" href="Pago/EmpezarPago.aspx" style="margin-right:10%;margin-top:10%;">COMPLETAR PAGO</a>
                                     </div>
                     
				                </div>
                
			                </div>

                      </div>
                            <br />

                       <table style="float:right; margin-right:5%;"> 
                        <tr>
                          <td>
                            
                              <asp:ImageButton ID="PagoImageBtn" runat="server" 
                                          ImageUrl="Juguetes/Paypal.gif" 
                                          Width="145" AlternateText="Pagar con PayPal" 
                                          OnClick="PagoBtn_Click" 
                                          BackColor="Transparent" BorderWidth="0" />
                            </td>
                         </tr>
                       </table>

                     </div>
                </div>
            </div>
     </section>
</asp:Content>
