﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="catSolicitudes.aspx.cs" Inherits="HelpDeskWeb.Catalogos.catSolicitudes" %>


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
                 </asp:HyperLink><ul class="dropdown-menu" role="menu">
                    <li><asp:HyperLink runat="server" href="#">Perfil</asp:HyperLink></li><li class="divider"></li>
                    <li><asp:HyperLink runat="server" href="#">Cerrar sesión</asp:HyperLink></li></ul></li>
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
                        <asp:Panel runat="server" CssClass="panel panel-primary" >
                            <asp:Panel runat="server" CssClass="panel-heading" HorizontalAlign="Center" Font-Bold="true" Font-Size="16">
                                Catálogos para Solicitudes </asp:Panel>
                                <asp:Panel runat="server" CssClass="panel-body"> 
                                   <form runat="server" role="form" >    
                                    <asp:ScriptManager runat="server" ID="ScriptManager"  EnablePartialRendering="true">
                                    </asp:ScriptManager>
                                        <asp:UpdatePanel runat="server" ID="update" UpdateMode="Always" >
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="txtFiltroSol" EventName="TextChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="btnLugares" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnRequerimientos" EventName="Click" />
                                        </Triggers>
                                        <ContentTemplate> 
                                   <asp:Panel runat="server" style="border-bottom:1px solid; border-color:lightgray;">
                                   <asp:Panel runat="server" CssClass="btn-group">
                                      <asp:LinkButton runat="server" CssClass="btn btn-primary active" style="border-bottom:none" OnClick="btnTipoIncidentes_Click" ID="btnTipoIncidentes" Text="Tipos de incidentes" />
                                      <asp:LinkButton runat="server" CssClass="btn btn-default" ID="btnLugares" Text="Lugares" style="border-bottom:none" OnClick="btnLugares_Click"></asp:LinkButton>
                                       <asp:LinkButton runat="server" CssClass="btn btn-default" ID="btnRequerimientos" Text="Requerimientos" style="border-bottom:none"  OnClick="btnRequerimientos_Click" ></asp:LinkButton>
                                    </asp:Panel>
                                    </asp:Panel>
                                            <asp:Panel runat="server" CssClass="col-lg-6">
                                                <asp:Panel runat="server" CssClass="row" Height="40"></asp:Panel>
                                                <asp:Panel runat="server" CssClass="row">
                                                    <asp:Panel runat="server" CssClass="col-lg-2>"></asp:Panel>
                                                    <asp:Panel runat="server" CssClass="col-lg-8" HorizontalAlign="Center" >
                                                    <asp:Panel runat="server" CssClass="form-group">
                                                    <asp:Panel runat="server" CssClass="input-group" HorizontalAlign="Center">
                                                                <asp:TextBox runat="server"  ID="txtFiltroSol"  CssClass="form-control"  OnTextChanged="txtFiltro_TextChanged" placeholder="Buscar" /> 
                                                                <span class="input-group-btn">
                                                                    <asp:Button runat="server" Text="Filtrar" ID="btnFiltroSol" OnClick="btnFiltroSol_Click"  class="btn btn-default" />
                                                                </span>                                                                                                                       
                                                    </asp:Panel> 
                                                    </asp:Panel>   
                                                    <asp:Panel runat="server" CssClass="form-group" ID="filtroExtra">
                                                        <asp:DropDownList runat="server" ID="listTipo" CssClass="form-control" OnSelectedIndexChanged="listTipo_SelectedIndexChanged">
                                                            <asp:ListItem Text=""></asp:ListItem>
                                                            <asp:ListItem Text="Cuantificable"></asp:ListItem>
                                                            <asp:ListItem Text="No cuantificable"></asp:ListItem>
                                                        </asp:DropDownList>    
                                                    </asp:Panel>                                  
                                                    </asp:Panel>
                                                    <asp:Panel runat="server" CssClass="col-lg-2">
                                                        <asp:Button runat="server" Text="Nuevo" ID="btnNuevo"  OnClick="btnNuevo_Click" CssClass="btn btn-primary" />    
                                                    </asp:Panel>
                                                    <asp:Panel runat="server" CssClass="col-lg-2"></asp:Panel>
                                                </asp:Panel>
                                                <asp:Panel runat="server" CssClass="col-lg-2>"></asp:Panel>
                                                <asp:Panel runat="server" CssClass="row">                            
                                                     <asp:Panel runat="server"  Height="300px" style="border-radius:10px" BorderWidth="1px" ScrollBars="Vertical" CssClass="embed-responsive" BorderColor="black" >
                                                         <asp:GridView ToolTip="Seleccione el registro a modificar" OnRowCreated="gvSolicitudes_RowCreated"  runat="server" id="gvSolicitudes" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="White" SelectedRowStyle-BackColor="#0B2161"
                                                             DataKeyNames="idTipoIncidente" CellPadding="4" GridLines="None" OnSelectedIndexChanged="gvSolicitudes_SelectedIndexChanged" >
                                                             <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#0B2161"  HorizontalAlign="Center" Font-Size="13" />
                                                             <Columns>
                                                                 <asp:BoundField HeaderText="Tipo de incidentes"   DataField="nomTipoIncidente" />
                                                             </Columns>
                                                                </asp:GridView>                                              
                                                    </asp:Panel> 
                                                </asp:Panel> 
                                            </asp:Panel>
                                            <asp:Panel runat="server" CssClass="col-lg-6">
                                                <asp:Panel runat="server" ID="renglon" CssClass="row" Height="100"></asp:Panel>
                                                <h4 class="text-center"><asp:Label runat="server" Text="Alta de tipos de equipos" ID="lbelAccion"></asp:Label></h4>
                                                <asp:Panel runat="server" ID="panelNombre" CssClass="form-group" HorizontalAlign="Center">
                                                  <asp:TextBox runat="server" ID="txtNomSol" CssClass="form-control" placeholder="Nombre" />
                                                </asp:Panel>    
                                                <asp:Panel runat="server" ID="panelExtraDatos" CssClass="form-group">
                                                   <asp:RadioButtonList runat="server" ID="rbTipoRequerimientos">
                                                           <asp:ListItem Text="Cuantificable" Value="Cuantificable"></asp:ListItem>
                                                           <asp:ListItem Text="No cuantificable" Value="No cuantificable"></asp:ListItem>
                                                   </asp:RadioButtonList>
                                                </asp:Panel>               
                                                   <asp:Panel runat="server" CssClass="form-group" HorizontalAlign="Center">
                                                  <asp:Button runat="server" ID="btnGrabarTipo" OnClick="btnGrabarTipo_Click" Text="Grabar"  CssClass="btn btn-primary btn-group-sm text-center"/>
                                                 </asp:Panel>
                                                </asp:Panel>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </form>
                                </asp:Panel>
                        </asp:Panel>             
                    </asp:Panel>
                 </asp:Panel>             
             </asp:Panel>
        </asp:Panel>
     </asp:Panel>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>

