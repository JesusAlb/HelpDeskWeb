<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/paginaMaestra.Master" CodeBehind="principal.aspx.cs" Inherits="HelpDeskWeb.principal" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/helpdesk-template.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/styles2.css" rel="stylesheet" />
    <link href="css/signin.css" rel="stylesheet" />
    <link href="css/printstyles.css" rel="stylesheet" />
    <script src="js/bootstrap.js"></script>
</asp:Content>
<asp:Content ContentPlaceHolderID="Main" Runat="Server">
    <asp:Panel runat="server" CssClass="container">
        <asp:Panel runat="server" CssClass="container-panel">
            <asp:Panel runat="server" CssClass="row" style="margin-top:5%">
                <asp:Image runat="server" ID="imca"  ImageUrl="~/Imagenes/IMCA IAP.png" Height="293px" Width="674px" /><br />
            </asp:Panel>
            <asp:Panel runat="server" CssClass="row">
            <asp:Label runat="server" Text="Help Desk" Font-Size="XX-Large" Font-Bold="true" /><br />
            <br />
                </asp:Panel>
            <asp:Label runat="server" ID="lbelNomUsuario" Font-Size="X-Large" /><br />
            <asp:Label runat="server" ID="lbelTipoUsuario" Font-Size="Larger" />
            <br />
            <br />
            <asp:Panel runat="server" CssClass="btn-group btn-group-lg " >
            <asp:HyperLink ID="hypNumIncidentes" runat="server" CssClass="btn btn-danger" role="button" Text="Número de Incidentes:" Width="300" />
            <asp:HyperLink ID="hypNumEventos" runat="server" CssClass="btn btn-warning" Text="Número de Eventos:" Width="300" />
                </asp:Panel>
        </asp:Panel>
        </asp:Panel>
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
</asp:Content>