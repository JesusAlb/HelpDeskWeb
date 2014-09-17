<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="principal.aspx.cs" Inherits="HelpDeskWeb.principal" %>

<!DOCTYPE html>

<html runat="server" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta runat="server" http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title runat="server">Centro de servicio</title>
    <link  href="css/bootstrap.min.css" rel="stylesheet" />
    <link  href="css/signin.css" rel="stylesheet" />
    <link href="css/helpdesk-template.css" rel="stylesheet" />
</head>
<body runat="server">
    <asp:Panel runat="server" CssClass="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <asp:Panel runat="server" CssClass="container">
            <asp:Panel runat="server" CssClass="navbar-header">
                <asp:HyperLink runat="server" class="navbar-brand" Text="HelpDesk" ImageUrl="~/Imagenes/IMCA IAP.png" ImageHeight="30" ImageWidth="80" NavigateUrl="~/principal.aspx" />
            </asp:Panel>
            <asp:Panel runat="server" CssClass="collapse navbar-collapse ">
                <ul runat="server" class="nav navbar-nav">
                    <li runat="server" class="dropdown">
                        <asp:HyperLink runat="server" ID="menuCatalogos" href="#" class="dropdown-toggle" data-toggle="dropdown">Catálogos</asp:HyperLink>
                        <ul runat="server" class="dropdown-menu" role="menu">
                            <li runat="server">
                                <asp:HyperLink runat="server" NavigateUrl="~/Catalogos/catUsuarios.aspx">Para usuarios</asp:HyperLink></li>
                            <li runat="server">
                                <asp:HyperLink runat="server" NavigateUrl="~/Catalogos/catSolicitudes.aspx">Para solicitudes</asp:HyperLink></li>
                            <li runat="server">
                                <asp:HyperLink runat="server" NavigateUrl="~/Catalogos/catEquipos.aspx">Para equipos</asp:HyperLink></li>
                        </ul>
                    </li>
                    <li runat="server" class="dropdown">
                        <asp:HyperLink runat="server" ID="menuControl" href="#" CssClass="dropdown-toggle" data-toggle="dropdown">Control</asp:HyperLink>
                        <ul runat="server" class="dropdown-menu" role="menu">
                            <li runat="server">
                                <asp:HyperLink runat="server" NavigateUrl="~/Control/Usuarios.aspx">Usuarios</asp:HyperLink></li>
                            <li runat="server">
                                <asp:HyperLink runat="server" NavigateUrl="~/Control/Equipos.aspx">Equipos</asp:HyperLink>
                            </li>
                        </ul>
                    </li>
                    <li runat="server" class="dropdown">
                        <asp:HyperLink runat="server" href="#" CssClass="dropdown-toggle" data-toggle="dropdown">Solicitudes</asp:HyperLink>
                        <ul runat="server" class="dropdown-menu" role="menu">
                            <li runat="server">
                                <asp:HyperLink runat="server" navigateUrl="~/Solicitudes/Incidentes.aspx">Incidentes</asp:HyperLink></li>
                            <li runat="server">
                                <asp:HyperLink runat="server" href="#">Eventos</asp:HyperLink></li>
                        </ul>
                    </li>
                    <li runat="server">
                        <asp:HyperLink runat="server" ID="menuReportes" href="#">Reportes</asp:HyperLink></li>
                </ul>
                <ul runat="server" class="nav navbar-nav navbar-right">
                    <li runat="server" class="dropdown">
                        <asp:HyperLink runat="server" href="#" ID="menuUsuario" CssClass="dropdown-toggle" data-toggle="dropdown">
                            <span runat="server" class="glyphicon glyphicon-user"></span>
                            <asp:Label runat="server" ID="lbelUsuario" />
                        </asp:HyperLink><ul class="dropdown-menu" role="menu">
                            <li runat="server">
                                <asp:HyperLink runat="server" href="#">Perfil</asp:HyperLink></li>
                            <li runat="server" class="divider"></li>
                            <li>
                                <asp:HyperLink runat="server" href="#">Cerrar sesión</asp:HyperLink></li>
                        </ul>
                    </li>
                    <li runat="server" class="active">
                        <asp:HyperLink runat="server" NavigateUrl="~/principal.aspx">Inicio</asp:HyperLink></li>
                </ul>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
    <asp:Panel runat="server" CssClass="container">
        <asp:Panel runat="server" CssClass="container-panel">
            <asp:Panel runat="server" CssClass="row">
                <asp:Image runat="server" ImageUrl="~/Imagenes/IMCA IAP.png" Height="293px" Width="674px" /><br />
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
        <asp:Panel runat="server" CssClass="navbar navbar-fixed-bottom panel-inferior" >
    </asp:Panel>
    <script  src="js/jquery-2.1.1.js"></script>
    <script  src="js/bootstrap.min.js"></script>
</body>
</html>