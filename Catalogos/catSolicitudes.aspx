<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="catSolicitudes.aspx.cs" Inherits="HelpDeskWeb.Catalogos.catSolicitudes" %>


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
    <div class="container">
        <div class="box">
            <div  class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-10">
                    <asp:Panel runat="server" class="panel panel-default" BorderColor="Gray">
                        <asp:Panel runat="server" CssClass="panel-heading" Font-Size="Large" HorizontalAlign="Center" BackColor="#E6E6E6">
                            Catálogos de solicitudes
                        </asp:Panel>
                        <div class="panel-body">
                            <form role="form" runat="server">
                            <asp:ScriptManager runat="server" ID="ScriptManager"  EnablePartialRendering="true">
                            </asp:ScriptManager>
                            <div class="form-group">
                                <ul id="myTab" class="nav nav-tabs" role="tablist">
                                    <li class="active">
                                        <asp:LinkButton runat="server" ID="tabTipoIncidentes" OnClientClick="activaTab('0')" href="#tipoincidentes" role="tab">Tipos de incidencias</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton runat="server" ID="tabLugares" OnClientClick="activaTab('1')" href="#lugares" role="tab">Lugares</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton runat="server" ID="tabRequerimientos" OnClientClick="activaTab('2')" href="#requerimientos" role="tab">Requerimientos</asp:LinkButton></li>
                                </ul>
                            </div>
                            <asp:Panel runat="server" ID="myTabContent" CssClass="tab-content">
                                <asp:Panel runat="server" ID="tipoincidentes" CssClass="tab-pane fade in active">
                                    <div runat="server" class="form-group">
                                    <div runat="server" class="row">
                                        <div runat="server" class="col-lg-2"></div>
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <asp:TextBox runat="server" ID="txtFiltroTipoIncidentes" CssClass="form-control" placeholder="Buscar" />
                                            </div>                                           
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:UpdatePanel runat="server" ID="updateAccionesTipos" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                        <asp:LinkButton ID="btnNuevoTipo" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                                        </asp:LinkButton>
                                                        <asp:LinkButton ID="btnEditarTipo" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-pencil"></span>
                             Editar
                                                        </asp:LinkButton>
                                                    </asp:Panel>
                                                   <asp:HiddenField runat="server" ID="accionesEquipos" Value="0" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnNuevoTipo" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnEditarTipo" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <asp:Panel runat="server" CssClass="modal fade" ID="ModalNuevoTipo" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                   <asp:Panel runat="server" CssClass="modal-dialog modal-md">
                                                       <asp:Panel runat="server" CssClass="modal-content" DefaultButton="btnGrabarTipo">
                                                           <asp:UpdatePanel ID="updateNuevaMarca" runat="server" UpdateMode="Conditional">
                                                               <ContentTemplate>
                                                                   <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                                                       <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                                                       <asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="lbelModalMarca" Text="Alta de marcas" />
                                                                   </asp:Panel>
                                                                   <asp:Panel runat="server" CssClass="modal-body">
                                                                       <asp:Panel runat="server" CssClass="row">
                                                                           <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                                           <asp:Panel runat="server" CssClass="col-lg-10">
                                                                               <asp:Panel runat="server" ID="panel2" CssClass="form-group">
                                                                                   <asp:Label runat="server" Text="Nombre" Font-Bold="true"></asp:Label>
                                                                                   <asp:TextBox runat="server" ID="txtTipoIncidente" CssClass="form-control" placeholder="Nombre" />
                                                                               </asp:Panel>
                                                                           </asp:Panel>
                                                                       </asp:Panel>
                                                                   </asp:Panel>
                                                                   <asp:Panel runat="server" CssClass="modal-footer">
                                                                       <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                                       <asp:LinkButton runat="server" ID="btnGrabarTipo" OnClick="btnGrabarMarca_Click" CssClass="btn btn-primary" Text="Grabar" />
                                                                   </asp:Panel>
                                                               </ContentTemplate>
                                                               <Triggers>
                                                                   <asp:AsyncPostBackTrigger ControlID="btnNuevoTipo" EventName="Click" />
                                                                   <asp:AsyncPostBackTrigger ControlID="btnEditarTipo" EventName="Click" />
                                                               </Triggers>
                                                           </asp:UpdatePanel>
                                                       </asp:Panel>
                                                   </asp:Panel>
                                               </asp:Panel>
                                        </div>
                                        <div runat="server" class="col-lg-2"></div>
                                    </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-lg-2"></div>
                                            <div class="col-lg-8">
                                                <asp:Table runat="server" ID="TablaTipoIncidentes" class="table" Style="margin-bottom: 0%; background-color: #F2F2F2">
                                                    <asp:TableRow runat="server" Font-Bold="true" class="text-center" BackColor="#006699" ForeColor="White" Font-Size="Larger" Style="border-bottom: LightGray 1px solid">
                                                        <asp:TableCell>Tipos de incidentes</asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                                <asp:Panel runat="server" Height="290px" ScrollBars="Auto">
                                                    <asp:UpdatePanel runat="server" ID="updateGvTipoIncidentes" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:GridView OnRowCreated="gv_RowCreated" runat="server" ID="gvTipoIncidentes" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                                AlternatingRowStyle-BackColor="#e0e0e0" ShowHeader="false" DataKeyNames="idTipoEquipo" CellPadding="4" GridLines="Horizontal">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="Tipo de equipo" DataField="nomTipoIncidente" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnGrabarTipo" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </asp:Panel>
                                            </div>
                                            <div class="col-lg-2"></div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </asp:Panel>
                            </form>
                        </div>
                    </asp:Panel>
                    </div>
                 </div>             
        </adiv>
     </div>
    </div>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>

