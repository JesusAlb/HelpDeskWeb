<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="catSolicitudes.aspx.cs" Inherits="HelpDeskWeb.Catalogos.catSolicitudes" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Centro de servicio</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../css/helpdesk-template.css" rel="stylesheet"/>
    <script src="../js/ie-emulation-modes-warning.js"></script>
    <script src="../js/ie10-viewport-bug-workaround.js"></script>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/jquery-2.1.1.js"></script>
    <script src="../js/bootstrap.min.js"></script>
                <!-- include alertify.css -->
    <link rel="stylesheet" href="../css/alertify.css"/>
    <link rel="stylesheet" href="../css/themes/default.css" />
    <link rel="stylesheet" href="../css/alertify.min.css" />
    <!-- include boostrap theme  -->
    <link rel="stylesheet" href="../css/themes/bootstrap.css"/>  
    <!-- include alertify script -->
    <script src="../js/alertify.js"></script>
    <script src="../js/alertify.min.js"></script>
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
                            <li id="usuarios">
                                <asp:HyperLink runat="server" NavigateUrl="~/Administracion/Usuarios.aspx">Usuarios</asp:HyperLink></li>
                            <li id="equipos">
                                <asp:HyperLink runat="server" NavigateUrl="~/Administracion/Equipos.aspx">Equipos</asp:HyperLink></li>
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
                        <asp:HyperLink runat="server" ID="linkInicio" NavigateUrl="~/soporte.aspx">Inicio</asp:HyperLink></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="box">
            <div  class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
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
                                <asp:Panel runat="server" CssClass="modal fade" ID="ModalNuevo" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <asp:Panel runat="server" CssClass="modal-dialog modal-md">
                                        <asp:Panel runat="server" CssClass="modal-content" DefaultButton="btnGrabar">
                                            <asp:UpdatePanel ID="updateModalNuevo" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                                        <asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="lbelModal" />
                                                    </asp:Panel>
                                                    <asp:Panel runat="server" CssClass="modal-body">
                                                        <asp:Panel runat="server" CssClass="row">
                                                            <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                            <asp:Panel runat="server" CssClass="col-lg-10">
                                                                <asp:Panel runat="server" ID="panel2" CssClass="form-group">
                                                                    <asp:Label runat="server" Text="Nombre" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" placeholder="Nombre" />
                                                                </asp:Panel>
                                                                <asp:Panel runat="server" ID="panelTipoRequerimiento" CssClass="form-group" Visible="false">
                                                                    <asp:Label runat="server" Text="Tipo de requerimiento" Font-Bold="true"></asp:Label>
                                                                    <asp:DropDownList runat="server" ID="cbTipoRequerimiento" CssClass="form-control">
                                                                        <asp:ListItem Text="Cuantificable" Value="true"></asp:ListItem>
                                                                        <asp:ListItem Text="No cuantificable" Value="false"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                    <asp:Panel runat="server" CssClass="modal-footer">
                                                        <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                        <asp:LinkButton runat="server" ID="btnGrabar" OnCommand="btnGrabar_Command" CommandName="insertar" CommandArgument="tipoIncidente" CssClass="btn btn-primary" Text="Grabar" />
                                                    </asp:Panel>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnNuevoTipo" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnEditarTipo" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnNuevoLugar" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnEditarLugar" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnNuevoRequerimiento" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnEditarRequerimiento" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="tabTipoIncidentes" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="tabLugares" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="tabRequerimientos" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                    </asp:Panel>
                                </asp:Panel>
                            </div>
                            <asp:Panel runat="server" ID="myTabContent" CssClass="tab-content">
                                <asp:Panel runat="server" ID="tipoincidentes" CssClass="tab-pane fade in active">
                                    <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-1"></div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <asp:TextBox runat="server" ID="txtFiltroTipoIncidentes" CssClass="form-control" placeholder="Buscar" />
                                            </div>                                           
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:UpdatePanel runat="server" ID="upAccionesTipos" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                        <asp:LinkButton ID="btnNuevoTipo" OnCommand="btnNuevo_Command" CommandName="abrirNuevoTipoIncidente" CommandArgument="tipoIncidente" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                                        </asp:LinkButton>
                                                        <asp:LinkButton ID="btnEditarTipo" OnCommand="btnEditar_Command" CommandName="abrirEditarTipoIncidente" CommandArgument="tipoIncidente" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-pencil"></span>
                             Editar
                                                        </asp:LinkButton>
                                                    </asp:Panel>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnNuevoTipo" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnEditarTipo" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>                                            
                                        </div>
                                        <div class="col-lg-1"></div>
                                    </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-lg-1"></div>
                                            <div class="col-lg-10">
                                                <asp:Table runat="server" ID="TablaTipoIncidentes" class="table" Style="margin-bottom: 0%; background-color: #F2F2F2">
                                                    <asp:TableRow runat="server" Font-Bold="true" class="text-center" BackColor="#006699" ForeColor="White" Font-Size="Larger" Style="border-bottom: LightGray 1px solid">
                                                        <asp:TableCell>Tipos de incidentes</asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                                <asp:Panel runat="server" Height="290px" ScrollBars="Auto">
                                                    <asp:UpdatePanel runat="server" ID="upGvTipoIncidentes" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:GridView OnRowCreated="gv_RowCreated" runat="server" ID="gvTipoIncidentes" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                                AlternatingRowStyle-BackColor="#e0e0e0" ShowHeader="false" DataKeyNames="idTipoIncidente" CellPadding="4" GridLines="Horizontal">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="Tipo de incidencia" DataField="nomTipoIncidente" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnGrabar" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </asp:Panel>
                                            </div>
                                            <div class="col-lg-1"></div>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel  runat="server" ID="lugares" CssClass="tab-pane fade">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-lg-1"></div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtFiltroLugares" placeholder="Buscar" />
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:UpdatePanel runat="server" ID="upAccionesLugares" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                            <asp:LinkButton ID="btnNuevoLugar" OnCommand="btnNuevo_Command" CommandName="abrirNuevoLugar" CommandArgument="lugar" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                                            </asp:LinkButton>
                                                            <asp:LinkButton ID="btnEditarLugar" OnCommand="btnEditar_Command" CommandName="abrirEditarLugar" CommandArgument="lugar" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-pencil"></span>
                             Editar
                                                            </asp:LinkButton>
                                                        </asp:Panel>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnNuevoLugar" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnEditarLugar" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="col-lg-1"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                        <div class="col-lg-1"></div>
                                        <div class="col-lg-10">
                                            <asp:Table runat="server" ID="Table1" class="table" Style="margin-bottom: 0%; background-color: #F2F2F2">
                                                <asp:TableRow runat="server" Font-Bold="true" class="text-center" BackColor="#006699" ForeColor="White" Font-Size="Larger" Style="border-bottom: LightGray 1px solid">
                                                    <asp:TableCell>Lugares</asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                            <asp:Panel runat="server" Height="290px" ScrollBars="Auto">
                                                <asp:UpdatePanel runat="server" ID="upGvLugares" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:GridView OnRowCreated="gv_RowCreated" runat="server" ID="gvLugares" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                            AlternatingRowStyle-BackColor="#e0e0e0" ShowHeader="false" DataKeyNames="idLugar" CellPadding="4" GridLines="Horizontal">
                                                            <Columns>
                                                                <asp:BoundField HeaderText="Lugares" DataField="nomLugar" />
                                                            </Columns>
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnGrabar" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </asp:Panel>
                                        </div>
                                        <div class="col-lg-1"></div>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="requerimientos" CssClass="tab-pane fade">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <div class="form-group">
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtFiltroReq" placeholder="Buscar" />
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">Tipo</span>
                                                        <asp:DropDownList runat="server" CssClass="form-control" ID="cbFiltroTipo">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                            <asp:ListItem Text="Cuantificable" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="No cuantificable" Value="0"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:UpdatePanel runat="server" ID="upAccionesRequerimientos" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                            <asp:LinkButton ID="btnNuevoRequerimiento" OnCommand="btnNuevo_Command" CommandName="abrirNuevoRequerimiento" CommandArgument="requerimiento" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                                            </asp:LinkButton>
                                                            <asp:LinkButton ID="btnEditarRequerimiento" OnCommand="btnEditar_Command" CommandName="abrirEditarRequerimiento" CommandArgument="requerimiento" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-pencil"></span>
                             Editar
                                                            </asp:LinkButton>
                                                        </asp:Panel>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnNuevoRequerimiento" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnEditarRequerimiento" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:Table runat="server" ID="Table2" class="table" Style="margin-bottom: 0%; background-color: #F2F2F2">
                                                    <asp:TableRow runat="server" Font-Bold="true" class="text-center" BackColor="#006699" ForeColor="White" Font-Size="Larger" Style="border-bottom: LightGray 1px solid">
                                                        <asp:TableCell>Requerimiento</asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                                <asp:Panel runat="server" Height="290px" ScrollBars="Auto">
                                                    <asp:UpdatePanel runat="server" ID="upGvRequerimientos" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:GridView OnRowCreated="gv_RowCreated" runat="server" ID="gvRequerimientos" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                                AlternatingRowStyle-BackColor="#e0e0e0" ShowHeader="false" DataKeyNames="idRequerimientos" CellPadding="4" GridLines="Horizontal">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="Requerimiento" DataField="nomRequerimiento" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnGrabar" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </asp:Panel>
                            </form>
                        </div>
                    </asp:Panel>
                </div>
                <div class="col-lg-2"></div>
            </div>             
        </div>
     </div>
        <script type="text/javascript">
            function activaTab(index) {
                $('#myTab li:eq(' + index + ') a').tab('show'); // Select third tab (0-indexed)   
            }
    </script>
</body>
</html>

