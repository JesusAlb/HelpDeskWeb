<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="catSolicitudes.aspx.cs" Inherits="HelpDeskWeb.Catalogos.catSolicitudes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Centro de servicio</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../css/signin.css" rel="stylesheet"/>
    <script src="../js/ie-emulation-modes-warning.js"></script>
    <script src="../js/ie10-viewport-bug-workaround.js"></script>
    </head>
    <body>
      <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <asp:HyperLink runat="server" class="navbar-brand" Text="HelpDesk" ImageUrl="~/Imagenes/IMCA IAP.png" ImageHeight="30" ImageWidth="80" NavigateUrl="~/principal.aspx" />
        </div>
        <div class="collapse navbar-collapse ">
          <ul class="nav navbar-nav">       
            <li class="dropdown active">
              <asp:HyperLink runat="server" ID="menuCatalogos" href="#"  class="dropdown-toggle" data-toggle="dropdown">Catálogos</asp:HyperLink>
              <ul class="dropdown-menu" role="menu">
                <li><asp:HyperLink runat="server" NavigateUrl="~/Catalogos/catUsuarios.aspx" >Para usuarios</asp:HyperLink></li>
                <li class="active"><asp:HyperLink runat="server" NavigateUrl="~/Catalogos/catSolicitudes.aspx">Para solicitudes</asp:HyperLink></li>
                <li><asp:HyperLink runat="server" NavigateUrl="~/Catalogos/catEquipos.aspx">Para equipos</asp:HyperLink></li>          
             </ul>
          </li>
          <li class="dropdown">
              <asp:HyperLink runat="server" ID="menuControl" href="#" CssClass="dropdown-toggle" data-toggle="dropdown">Control</asp:HyperLink>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">Usuarios</a></li>
                <li><a href="#">Equipos</a></li>
             </ul>
          </li>
          <li class="dropdown">
              <asp:HyperLink runat="server" href="#" CssClass="dropdown-toggle" data-toggle="dropdown">Solicitudes</asp:HyperLink>
              <ul class="dropdown-menu" role="menu">
                <li><asp:HyperLink runat="server" href="#">Incidentes</asp:HyperLink></li>
                <li><asp:HyperLink runat="server" href="#">Eventos</asp:HyperLink></li>
             </ul>
          </li>
          <li><asp:HyperLink runat="server" ID="menuReportes" href="#" >Reportes</asp:HyperLink></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                 <asp:HyperLink runat="server" href="#" ID="menuUsuario" CssClass="dropdown-toggle" data-toggle="dropdown"> 
                     <span class="glyphicon glyphicon-user"></span><asp:Label runat="server" ID="lbelUsuario" />
                 </asp:HyperLink>
                 <ul class="dropdown-menu" role="menu">
                    <li><asp:HyperLink runat="server" href="#">Perfil</asp:HyperLink></li>
                    <li class="divider"></li>
                    <li><asp:HyperLink runat="server" href="#">Cerrar sesión</asp:HyperLink></li>
                  </ul>
                </li>
                 <li><asp:HyperLink runat="server" NavigateUrl="~/principal.aspx" >Inicio</asp:HyperLink></li>
            </ul>
        </div>
      </div>
    </div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>
