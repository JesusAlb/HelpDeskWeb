<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="catEquipos.aspx.cs" Inherits="HelpDeskWeb.Catalogos.catEquipos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Centro de servicio</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../css/helpdesk-template.css" rel="stylesheet"/>
            <!-- include alertify.css -->
    <link rel="stylesheet" href="../css/alertify.css"/>
    <link rel="stylesheet" href="../css/themes/default.css" />
    <link rel="stylesheet" href="../css/alertify.min.css" />
    <!-- include boostrap theme  -->
    <link rel="stylesheet" href="../css/themes/bootstrap.css"/>  
    <!-- include alertify script -->
    <script src="../js/alertify.js"></script>
    <script src="../js/alertify.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/jquery-2.1.1.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
            <div class="navbar-header">
                <asp:HyperLink runat="server" ID="linkPrincipal" class="navbar-brand" Text="HelpDesk" ImageUrl="~/Imagenes/IMCA IAP.png" ImageHeight="30" ImageWidth="80" NavigateUrl="~/soporte.aspx" />
            </div>
            <div class="collapse navbar-collapse ">
                <ul class="nav navbar-nav">
                    <li id="catalogos" class="dropdown">
                        <asp:HyperLink runat="server" ID="menuCatalogos" href="#" class="dropdown-toggle" data-toggle="dropdown">Catálogos</asp:HyperLink>
                        <ul class="dropdown-menu" role="menu">
                            <li id="paraUsuarios">
                                <asp:HyperLink runat="server" NavigateUrl="~/Catalogos/catUsuarios.aspx">Para usuarios</asp:HyperLink></li>
                            <li id="paraSolicitudes">
                                <asp:HyperLink runat="server" NavigateUrl="~/Catalogos/catSolicitudes.aspx">Para solicitudes</asp:HyperLink></li>
                            <li id="paraEquipos">
                                <asp:HyperLink runat="server" NavigateUrl="~/Catalogos/catEquipos.aspx">Para equipos</asp:HyperLink></li>
                        </ul>
                    </li>
                    <li id="control" class="dropdown">
                        <asp:HyperLink runat="server" ID="menuControl" href="#" CssClass="dropdown-toggle" data-toggle="dropdown">Control</asp:HyperLink>
                        <ul class="dropdown-menu" role="menu">
                            <li id="usuarios"><asp:HyperLink runat="server" NavigateUrl="~/Administracion/Usuarios.aspx">Usuarios</asp:HyperLink></li>
                            <li id="equipos"><asp:HyperLink runat="server" NavigateUrl="~/Administracion/Equipos.aspx">Equipos</asp:HyperLink></li>
                        </ul>
                    </li>
                    <li id="solicitudes" class="dropdown">
                        <asp:HyperLink runat="server" href="#" CssClass="dropdown-toggle" data-toggle="dropdown">Solicitudes</asp:HyperLink>
                        <ul class="dropdown-menu" role="menu">
                            <li id="incidentes">
                                <asp:HyperLink runat="server" NavigateUrl="~/Solicitudes/Incidentes.aspx">Incidentes</asp:HyperLink></li>
                            <li id="eventos">
                                <asp:HyperLink runat="server" NavigateUrl="~/Solicitudes/Eventos.aspx">Eventos</asp:HyperLink></li>
                        </ul>
                    </li>
                    <li runat="server" id="reporte">
                        <asp:HyperLink runat="server" ID="menuReportes" NavigateUrl="~/Reportes/reporte.aspx">Reportes</asp:HyperLink></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <asp:HyperLink runat="server" href="#" ID="menuUsuario" CssClass="dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user"></span>
                            <asp:Label runat="server" ID="lbelUsuario" />
                        </asp:HyperLink><ul class="dropdown-menu" role="menu">
                            <li>
                                <asp:HyperLink runat="server" href="#">Perfil</asp:HyperLink></li>
                            <li class="divider"></li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="~/logout.aspx">Cerrar sesión</asp:HyperLink></li>
                        </ul>
                    </li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/principal.aspx">Inicio</asp:HyperLink></li>
                </ul>
            </div>
     </div>
    </div>
    <asp:Panel runat="server" CssClass="container">
        <asp:Panel runat="server" CssClass="box">
            <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
            <asp:Panel runat="server" CssClass="col-lg-10">
                <form runat="server" role="form">
                    <asp:ScriptManager runat="server" ID="ScriptManager" EnablePartialRendering="true">
                    </asp:ScriptManager>
                    <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                    <asp:Panel runat="server" CssClass="col-lg-10">
                    <asp:Panel runat="server" CssClass="panel panel-default" BorderColor="Gray" >
                        <asp:Panel runat="server" CssClass="panel-heading" Font-Size="Large" HorizontalAlign="Center" BackColor="#E6E6E6">
                            Catálogos de equipos
                        </asp:Panel>
                        <asp:Panel runat="server" CssClass="panel-body">
                          <asp:Panel runat="server" CssClass="form-group">
                            <ul id="myTab" class="nav nav-tabs" role="tablist">
                                <li class="active">
                                    <asp:LinkButton runat="server" ID="tabEquipos" OnClientClick="activaTab('0')" href="#equipos" role="tab">Tipos de equipos</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton runat="server" ID="tabMarcas" OnClientClick="activaTab('1')" href="#marcas" role="tab">Marcas</asp:LinkButton></li>
                            </ul>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="myTabContent" CssClass="tab-content">
                               <asp:Panel runat="server" ID="equipos" CssClass="tab-pane fade in active">
                                <asp:Panel runat="server" CssClass="form-group">
                                    <asp:Panel runat="server" CssClass="row">
                                        <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                        <asp:Panel runat="server" CssClass="col-lg-6">
                                            <asp:Panel runat="server" CssClass="form-group">
                                                <asp:TextBox runat="server" ID="txtFiltroTipo" CssClass="form-control" placeholder="Buscar" />
                                            </asp:Panel>

                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="col-lg-4">
                                            <asp:UpdatePanel runat="server" ID="updateAcciones" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                        <asp:LinkButton ID="btnNuevoTipo" runat="server" CssClass="btn btn-primary" OnClick="btnNuevoTipo_Click">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                                        </asp:LinkButton>
                                                        <asp:LinkButton ID="btnEditarTipo" runat="server" CssClass="btn btn-primary" OnClick="btnEditarTipo_Click">
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
                                            <asp:Panel runat="server" CssClass="modal fade" ID="ModalNuevoTipoEquipos" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                <asp:Panel runat="server" CssClass="modal-dialog modal-md">
                                                    <asp:Panel runat="server" CssClass="modal-content" DefaultButton="btnGrabarTipo">
                                                        <asp:UpdatePanel ID="updateNuevoTipo" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                                                    <asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="lbelModal" Text="Alta de tipo de equipos" />
                                                                </asp:Panel>
                                                                <asp:Panel runat="server" CssClass="modal-body">
                                                                    <asp:Panel runat="server" CssClass="row">
                                                                        <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                                        <asp:Panel runat="server" CssClass="col-lg-10">
                                                                            <asp:Panel runat="server" ID="panelNombre" CssClass="form-group">
                                                                                <asp:Label runat="server" Text="Nombre" Font-Bold="true"></asp:Label>
                                                                                <asp:TextBox runat="server" ID="txtTipoEquipo" CssClass="form-control" placeholder="Nombre" />
                                                                            </asp:Panel>
                                                                            <asp:Panel runat="server" CssClass="panel panel-primary" ID="panelCarTipoEquipo">
                                                                                <asp:Panel runat="server" CssClass="panel-heading" Font-Size="12">Características a capturar</asp:Panel>
                                                                                <asp:Panel runat="server" CssClass="panel-body">
                                                                                    <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                                                    <asp:Panel runat="server" CssClass="col-lg-9">
                                                                                        <div class="row">
                                                                                            <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chEquipo" Checked="true" Enabled="false" Text="Marca del equipo" />
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chDiscoD" Text="Capacidad de almacenamiento" />
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chProcesador" Text="Velocidad del reloj del procesador" />
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chRAM" Text="Capacidad de RAM" />
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chRed" Text="Direcciones de red" />
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chMonitor" Text="Marca del monitor" />
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chTeclado" Text="Marca del teclado" />
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chMouse" Text="Marca del mouse" />
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <asp:CheckBox runat="server" CssClass="checkbox-inline" ID="chTodos" OnCheckedChanged="chTodos_CheckedChanged" AutoPostBack="true" Text="Seleccionar todas" Value="todos" />
                                                                                        </div>
                                                                                    </asp:Panel>
                                                                                </asp:Panel>
                                                                            </asp:Panel>

                                                                        </asp:Panel>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                                <asp:Panel runat="server" CssClass="modal-footer">
                                                                            <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                                            <asp:LinkButton runat="server" ID="btnGrabarTipo" CssClass="btn btn-primary" OnClick="btnGrabarTipo_Click" Text="Grabar" />
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
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" CssClass="form-group">
                                    <asp:Panel runat="server" CssClass="row">
                                        <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                        <asp:Panel runat="server" CssClass="col-lg-10">
                                            <asp:Table runat="server" ID="Table1" class="table" Style="margin-bottom: 0%; background-color: #F2F2F2">
                                                <asp:TableRow runat="server" Font-Bold="true" class="text-center" BackColor="#006699" ForeColor="White" Font-Size="Larger" Style="border-bottom: LightGray 1px solid">
                                                    <asp:TableCell>Tipos de equipos</asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                            <asp:Panel runat="server" Height="300px" ScrollBars="Auto">
                                                <asp:UpdatePanel runat="server" ID="UpdatePanel5" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:GridView OnRowCreated="gv_RowCreated"  runat="server" ID="gvTipoEquipos" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                            AlternatingRowStyle-BackColor="#e0e0e0" ShowHeader="false" DataKeyNames="idTipoEquipo" CellPadding="4" GridLines="Horizontal">
                                                            <Columns>
                                                                <asp:BoundField HeaderText="Tipo de equipo" DataField="nomTipoEquipo" />
                                                            </Columns>
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnGrabarTipo" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </asp:Panel>
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                    </asp:Panel>
                                </asp:Panel>
                                </asp:Panel>
                               <asp:Panel runat="server" ID="marcas" CssClass="tab-pane fade">
                                   <asp:Panel runat="server" CssClass="form-group">
                                       <asp:Panel runat="server" CssClass="row">
                                        <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                        <asp:Panel runat="server" CssClass="col-lg-6">
                                            <div class="form-group">
                                                <asp:TextBox runat="server" ID="txtFiltroMarca" CssClass="form-control" placeholder="Buscar" />
                                            </div>
                                        </asp:Panel>
                                           <asp:Panel runat="server" CssClass="col-lg-4">
                                               <asp:UpdatePanel runat="server" ID="updateAccionesMarcas" UpdateMode="Conditional">
                                                   <ContentTemplate>
                                                       <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                           <asp:LinkButton ID="btnNuevaMarca" runat="server" CssClass="btn btn-primary" OnClick="btnNuevaMarca_Click">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                                           </asp:LinkButton>
                                                           <asp:LinkButton ID="btnEditarMarca" runat="server" CssClass="btn btn-primary" OnClick="btnEditarMarca_Click">
                            <span class="glyphicon glyphicon-pencil"></span>
                             Editar
                                                           </asp:LinkButton>
                                                       </asp:Panel>
                                                       <asp:HiddenField runat="server" ID="accionesMarcas" Value="0" />
                                                   </ContentTemplate>
                                                   <Triggers>
                                                       <asp:AsyncPostBackTrigger ControlID="btnNuevaMarca" EventName="Click" />
                                                       <asp:AsyncPostBackTrigger ControlID="btnEditarMarca" EventName="Click" />
                                                   </Triggers>
                                               </asp:UpdatePanel>
                                               <asp:Panel runat="server" CssClass="modal fade" ID="ModalNuevaMarca" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                   <asp:Panel runat="server" CssClass="modal-dialog modal-md">
                                                       <asp:Panel runat="server" CssClass="modal-content" DefaultButton="btnGrabarMarca">
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
                                                                                   <asp:TextBox runat="server" ID="txtMarca" CssClass="form-control" placeholder="Nombre" />
                                                                               </asp:Panel>
                                                                           </asp:Panel>
                                                                       </asp:Panel>
                                                                   </asp:Panel>
                                                                   <asp:Panel runat="server" CssClass="modal-footer">
                                                                       <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                                       <asp:LinkButton runat="server" ID="btnGrabarMarca" OnClick="btnGrabarMarca_Click" CssClass="btn btn-primary" Text="Grabar" />
                                                                   </asp:Panel>
                                                               </ContentTemplate>
                                                               <Triggers>
                                                                   <asp:AsyncPostBackTrigger ControlID="btnNuevaMarca" EventName="Click" />
                                                                   <asp:AsyncPostBackTrigger ControlID="btnEditarMarca" EventName="Click" />
                                                               </Triggers>
                                                           </asp:UpdatePanel>
                                                       </asp:Panel>
                                                   </asp:Panel>
                                               </asp:Panel>
                                           </asp:Panel>
                                           <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                       </asp:Panel>
                                   </asp:Panel>
                                   <asp:Panel runat="server" CssClass="form-group">
                                       <asp:Panel runat="server" CssClass="row">
                                           <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                           <asp:Panel runat="server" CssClass="col-lg-10">
                                               <asp:Table runat="server" ID="Table2" class="table" Style="margin-bottom: 0%; background-color: #F2F2F2">
                                                   <asp:TableRow runat="server" Font-Bold="true" class="text-center" BackColor="#006699" ForeColor="White" Font-Size="Larger" Style="border-bottom: LightGray 1px solid">
                                                       <asp:TableCell>Tipos de equipos</asp:TableCell>
                                                   </asp:TableRow>
                                               </asp:Table>
                                               <asp:Panel runat="server" Height="300px" ScrollBars="Auto">
                                                   <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Conditional">
                                                       <ContentTemplate>
                                                           <asp:GridView OnRowCreated="gv_RowCreated" runat="server" ID="gvMarca" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                               AlternatingRowStyle-BackColor="#e0e0e0" ShowHeader="false" DataKeyNames="idMarca" CellPadding="4" GridLines="Horizontal">
                                                               <Columns>
                                                                   <asp:BoundField HeaderText="Marcas" DataField="nomMarca" />
                                                               </Columns>
                                                           </asp:GridView>
                                                       </ContentTemplate>
                                                       <Triggers>
                                                           <asp:AsyncPostBackTrigger ControlID="btnGrabarMarca" EventName="Click" />
                                                       </Triggers>
                                                   </asp:UpdatePanel>
                                               </asp:Panel>
                                               <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                           </asp:Panel>
                                       </asp:Panel>
                                   </asp:Panel>
                               </asp:Panel>
                        </asp:Panel>
                        </asp:Panel>
                    </asp:Panel>
                    </asp:Panel>
                    <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                </form>
            </asp:Panel>
            <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
        </asp:Panel>
    </asp:Panel>
    <script type="text/javascript">
        function activaTab(index) {
            $('#myTab li:eq(' + index + ') a').tab('show'); // Select third tab (0-indexed)   
        }
    </script>
</body>
</html>

