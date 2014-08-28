<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="catEquipos.aspx.cs" Inherits="HelpDeskWeb.Catalogos.catEquipos" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Centro de servicio</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../css/helpdesk-template.css" rel="stylesheet"/>
    <link href="../css/styles.css" rel="stylesheet"/>
    <link href="../css/styles2.css" rel="stylesheet"/>
    <link href="../css/printstyles.css" rel="stylesheet"/>
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
            <li class="dropdown">
              <asp:HyperLink runat="server" ID="menuCatalogos" href="#"  class="dropdown-toggle" data-toggle="dropdown">Catálogos</asp:HyperLink>
              <ul class="dropdown-menu" role="menu">
                <li><asp:HyperLink runat="server" NavigateUrl="~/Catalogos/catUsuarios.aspx" >Para usuarios</asp:HyperLink></li>
                <li><asp:HyperLink runat="server" NavigateUrl="~/Catalogos/catSolicitudes.aspx">Para solicitudes</asp:HyperLink></li>
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
                 <li class="active"><asp:HyperLink runat="server" NavigateUrl="~/principal.aspx" >Inicio</asp:HyperLink></li>
            </ul>
        </div>
      </div>
    </div>
    <asp:Panel runat="server" CssClass="container">
        <asp:Panel runat="server" CssClass="box">
            <asp:Panel runat="server" CssClass="row">
            <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>           
            <asp:Panel runat="server" CssClass="row">             
                <asp:Panel runat="server" CssClass="col-lg-10">
                <asp:Panel runat="server" CssClass="panel panel-default" >
                <asp:Panel runat="server" CssClass="panel-heading" HorizontalAlign="Center" Font-Bold="true" Font-Size="16">
                    Catálogos para Equipos
                </asp:Panel>
                  <asp:Panel runat="server" CssClass="panel-body">                
                 <ul class="nav nav-tabs" role="tablist">
                  <li class="active"><a href="#">Tipos de equipos</a></li>
                  <li><a href="#">Marcas</a></li>
                </ul>
                <asp:Panel runat="server" CssClass="col-lg-6">
                <asp:Panel runat="server" CssClass="row" Height="50"></asp:Panel>
                <asp:Panel runat="server" CssClass="row">
                <asp:Panel runat="server" CssClass="col-lg-2>"></asp:Panel>
                <asp:Panel runat="server" CssClass="col-lg-8" HorizontalAlign="Center" Wrap="true">
                   <form role="form">
                    <asp:Panel runat="server" cssClass="form-group" HorizontalAlign="Center">
                    <input type="text" class="form-control" placeholder="Buscar" />
                    </asp:Panel>
                    </form>
                </asp:Panel>
                </asp:Panel>
                <asp:Panel runat="server" CssClass="col-lg-2>"></asp:Panel>
                <asp:Panel runat="server" CssClass="row">             
                <asp:DataGrid runat="server" ID="dgTipoEquipos" CssClass="table table-striped table-bordered table-hover table"
                    AllowPaging="True" DataKeyField="idTipoEquipo" 
                    AutoGenerateColumns="False" CellPadding="4" GridLines="None">   
                    <HeaderStyle Font-Bold="true" HorizontalAlign="Center" Font-Size="13" />                   
                    <Columns>
                        <asp:BoundColumn HeaderText="Id" DataField="idTipoEquipo"/>
                        <asp:BoundColumn HeaderText="Tipo de equipo" DataField="nomTipoEquipo"/>
                     </Columns>
                </asp:DataGrid>
                </asp:Panel> 
                </asp:Panel>
                <asp:Panel runat="server" CssClass="col-lg-6">
                    <h3 class="text-center">Alta de equipos</h3>
                    <form runat="server" role="form">                   
                    <asp:Panel runat="server" CssClass="form-group" HorizontalAlign="Center">
                      <asp:TextBox runat="server" Width="400" CssClass="form-control" placeholder="Nombre"></asp:TextBox>
                    </asp:Panel>                   
                      <asp:Panel runat="server" CssClass="panel panel-default">
                        <asp:Panel runat="server" CssClass="panel-heading" Font-Size="13">Características a capturar</asp:Panel>
                        <asp:Panel runat="server" CssClass="panel-body">
                        <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                        <asp:Panel runat="server" CssClass="col-lg-9">
                        <div  class="row">                      
                        <asp:CheckBox runat="server" CssClass="checkbox-inline" Checked="true"  Enabled="false" Text="Marca del equipo" />
                        </div>
                        <div class="row">
                        <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chDiscoD" Text="Capacidad de almacenamiento"/>
                         </div>
                        <div class="row">
                        <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chProcesador" Text="Velocidad del reloj del procesador"/>
                        </div>
                        <div class="row">
                        <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chRAM" Text="Capacidad de RAM"/>
                        </div>
                        <div class="row">
                        <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chRed" Text="Direcciones de red"/>
                        </div>
                        <div class="row">
                        <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chMonitor" Text="Marca del monitor"/>
                        </div>
                        <div class="row">
                        <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chTeclado" Text="Marca del teclado"/>
                        </div>
                        <div class="row">
                        <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chMouse" Text="Marca del mouse" />
                        </div>
                        <div class="row">
                        <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chTodos"  OnCheckedChanged="chTodos_CheckedChanged" AutoPostBack="true" Text="Seleccionar todas" Value="todos"/>
                        </div>
                      </asp:Panel>
                     </asp:Panel>                              
                    </asp:Panel>
                    <asp:Panel runat="server" CssClass="form-group" HorizontalAlign="Center">
                    <asp:Button runat="server" Text="Grabar" Width="100" CssClass="form-control btn btn-default text-center"/>
                    </asp:Panel>
                    </form>
                </asp:Panel>
                </asp:Panel>             
                </asp:Panel>
                </asp:Panel>             
                </asp:Panel>
                <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>

<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>

