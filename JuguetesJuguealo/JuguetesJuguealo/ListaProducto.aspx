<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaProducto.aspx.cs" Inherits="JuguetesJuguealo.ListaProducto" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-title fix">
	    <div class="header-top">
            <p>&nbsp;</p>
		    <h2 style="font-size:2em;">Lista de Productos</h2>
            <p>&nbsp;</p>
	    </div>
    </div>

 <div class="shop-product-area section fix">
	<div class="container">
		<div class="row">
             <section>
                <div>

                    <hgroup>
                        <h2><%: Page.Title %></h2>
                    </hgroup>

                       <asp:ListView ID="listaProducto" runat="server" 
                        DataKeyNames="ProductoID" GroupItemCount="4"
                        ItemType="JuguetesJuguealo.Models.Producto" SelectMethod="GetProductos">
                            <EmptyDataTemplate>
                                <table >
                                    <tr>
                                        <td>No Hay Datos.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>

                            <EmptyItemTemplate>
                                <td/>
                            </EmptyItemTemplate>

                            <GroupTemplate>
                                <tr id="itemPlaceholderContainer" runat="server">
                                    <td id="itemPlaceholder" runat="server"></td>
                                </tr>
                            </GroupTemplate>

                            <ItemTemplate>
                              <div runat="server" class="col-sm-4 col-md-3 fix">
					            <div class="product-item fix">

						            <div class="product-img-hover">
							            
							            <a href="DetallesProducto.aspx?productoID=<%#:Item.ProductoID%>" class="pro-image fix"><img src="/Juguetes/<%#:Item.ImagePath%>"
                                                        width="250" height="250"" alt="producto" /></a>
							            
							            <div class="product-action-btn">
								            <a class="quick-view" href="DetallesProducto.aspx?productoID=<%#:Item.ProductoID%>"><i class="fa fa-search"></i></a>
								            <a class="add-cart" href="/AñadirCarro.aspx?productoID=<%#:Item.ProductoID %>"><i class="fa fa-shopping-cart"></i></a>
							            </div>
						            </div>

						            <div class="pro-name-price-ratting">
							            
							            <div class="pro-name">
								            <a href="DetallesProducto.aspx?productoID=<%#:Item.ProductoID%>"> <%#:Item.NombreProducto%></a>
							            </div>
							            
							            <div class="pro-ratting">
								            <i class="on fa fa-star"></i>
								            <i class="on fa fa-star"></i>
								            <i class="on fa fa-star"></i>
								            <i class="on fa fa-star"></i>
								            <i class="on fa fa-star-half-o"></i>
							            </div>
							            
							            <div class="pro-price fix">
								            <p><span class="new"><%#:String.Format("{0:c}", Item.PrecioUnidad)%></span></p>
							            </div>
						            </div>
					             </div>
				              </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table style="width:100%;">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                                    <tr id="groupPlaceholder"></tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr></tr>
                                    </tbody>
                                </table>
                            </LayoutTemplate>
                    </asp:ListView>
                </div>
            </section>
         </div>
      </div>
    </div>
</asp:Content>