<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaginaAdministracion.aspx.cs" Inherits="JuguetesJuguealo.Admin.PaginaAdministracion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%--Título--%>
     <div class="page-title fix">
	    <div class="header-top">
            <p>&nbsp;</p>
		    <h2 style="font-size:2.2em;">Administración</h2>
            <p>&nbsp;</p>
	    </div>
     </div>
    <hr />

    <%--Area de logado--%>
 <div class="container"> 
 <div class="login-page page fix">
   
    <div class="row">
        <div class="col-md-12">
            <h3 style="margin-bottom:1%;">Añadir Producto:</h3>
                <table>
                         <tr>
                             <td><asp:Label ID="LabelAddCategory" runat="server">Categoria:</asp:Label></td>

                             <td style="margin-bottom:5%;">
                                <asp:DropDownList ID="DropDownAddCategory" runat="server" 
                                    ItemType="JuguetesJuguealo.Models.Categoria" 
                                    SelectMethod="GetCategorias" DataTextField="NombreCategoria" 
                                    DataValueField="CategoriaID" >
                                </asp:DropDownList>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <p runat="server">&nbsp;</p>
                            </td>
                       </tr>
                        <tr>
                            <td><asp:Label ID="LabelAddName" runat="server">Nombre:</asp:Label></td>
                            <td>
                                <asp:TextBox ID="AddProductName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="* Nombre del producto requerido." ControlToValidate="AddProductName" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                             <p runat="server">&nbsp;</p>
                           </td>
                       </tr>
                        <tr>
                            <td><asp:Label ID="LabelAddDescription" runat="server">Descripcion:</asp:Label></td>
                            <td>
                                <asp:TextBox ID="AddProductDescription" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="* Descripcion requerida." ControlToValidate="AddProductDescription" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <p runat="server">&nbsp;</p>
                            </td>
                        </tr>
                         <tr>
                             <td><asp:Label ID="LabelAddPrice" runat="server">Precio:</asp:Label></td>
                             <td>
                                 <asp:TextBox ID="AddProductPrice" runat="server"></asp:TextBox>
                             </td>
                        </tr>
                         <tr>
                            <td>
                                <p runat="server">&nbsp;</p>
                           </td>
                        </tr>
                          <tr>
                            <td><asp:Label ID="LabelAddImageFile" runat="server">Imagen:</asp:Label></td>
                            <td>
                                <asp:FileUpload ID="ProductImage" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="* Imagen requerida." ControlToValidate="ProductImage" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                </table>

                 <p></p>
                 <p></p>
                 <p runat="server">&nbsp;</p>
                    <asp:Button ID="AddProductButton" runat="server" Text="Añadir Producto" OnClick="AddProductButton_Click"  CausesValidation="true"/>
                    <asp:Label ID="LabelAddStatus" runat="server" Text=""></asp:Label>
                    <p></p>
                    <h3 style="margin-top:4%; margin-bottom:1%; ">Eliminar Producto:</h3>

                <table>
                    <tr>
                        <td><asp:Label ID="LabelRemoveProduct" runat="server">Producto:</asp:Label></td>
                        <td><asp:DropDownList ID="DropDownRemoveProduct" runat="server" ItemType="JuguetesJuguealo.Models.Producto" 
                                SelectMethod="GetProductos" AppendDataBoundItems="true" 
                                DataTextField="NombreProducto" DataValueField="ProductoID" >
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>

                <p runat="server">&nbsp;</p>
                <asp:Button ID="RemoveProductButton" runat="server" Text="Eliminar Producto" OnClick="RemoveProductButton_Click" CausesValidation="false"/>
                <asp:Label ID="LabelRemoveStatus" runat="server" Text=""></asp:Label>
         </div>
        </div>
      </div>
   </div>
</asp:Content>
