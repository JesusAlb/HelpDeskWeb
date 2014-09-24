<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Incidentes.aspx.cs" Inherits="HelpDeskWeb.Solicitudes.Incidentes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Centro de soluciones</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/helpdesk-template.css" rel="stylesheet" />
    <link href="../css/styles.css" rel="stylesheet" />
    <link href="../css/styles2.css" rel="stylesheet" />
    <link href="../css/printstyles.css" rel="stylesheet" />
    <script src="../js/bootstrap.js"></script>

</head>
<body>
    <asp:Panel runat="server" CssClass="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <asp:HyperLink runat="server" class="navbar-brand" Text="HelpDesk" ImageUrl="~/Imagenes/IMCA IAP.png" ImageHeight="30" ImageWidth="80" NavigateUrl="~/principal.aspx" />
            </div>
            <div class="collapse navbar-collapse ">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <asp:HyperLink runat="server" ID="menuCatalogos" href="#" class="dropdown-toggle" data-toggle="dropdown">Catálogos</asp:HyperLink>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="~/Catalogos/catUsuarios.aspx">Para usuarios</asp:HyperLink></li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="~/Catalogos/catSolicitudes.aspx">Para solicitudes</asp:HyperLink></li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="~/Catalogos/catEquipos.aspx">Para equipos</asp:HyperLink></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <asp:HyperLink runat="server" ID="menuControl" href="#" CssClass="dropdown-toggle" data-toggle="dropdown">Control</asp:HyperLink>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="~/Control/Usuarios.aspx">Usuarios</asp:HyperLink></li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="~/Control/Equipos.aspx">Equipos</asp:HyperLink></li>
                        </ul>
                    </li>
                    <li class="active dropdown">
                        <asp:HyperLink runat="server" href="#" CssClass="dropdown-toggle" data-toggle="dropdown">Solicitudes</asp:HyperLink>
                        <ul class="dropdown-menu" role="menu">
                            <li class="active">
                                <asp:HyperLink runat="server" NavigateUrl="~/Solicitudes/Incidentes.aspx">Incidentes</asp:HyperLink></li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="~/Solicitudes/Eventos.aspx">Eventos</asp:HyperLink></li>
                        </ul>
                    </li>
                    <li>
                        <asp:HyperLink runat="server" ID="menuReportes" href="#">Reportes</asp:HyperLink></li>
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
                                <asp:HyperLink runat="server" href="#">Cerrar sesión</asp:HyperLink></li>
                        </ul>
                    </li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/principal.aspx">Inicio</asp:HyperLink></li>
                </ul>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" CssClass="container">
        <asp:Panel runat="server" CssClass="box">
            <form runat="server" role="form">
                <asp:ScriptManager runat="server" ID="script" EnablePartialRendering="true"></asp:ScriptManager>
                <asp:Panel runat="server" CssClass="row panel-titulo">
                    Centro de atención a incidencias
                </asp:Panel>
                <asp:Panel runat="server" CssClass="row">
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Panel runat="server" CssClass="col-lg-8">
                            <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                            <asp:Panel runat="server" CssClass="col-lg-11">
                                <asp:Panel runat="server" CssClass="row">
                                    <asp:Panel runat="server" CssClass="col-lg-7">
                                        <asp:Panel runat="server" CssClass="input-group">
                                            <asp:TextBox runat="server" ID="txtFiltro" placeholder="Buscar" CssClass="form-control" />
                                            <span class="input-group-btn">
                                                <asp:Button runat="server" ID="btnFiltrar" Text="Fitrar" CssClass="btn btn-default" />
                                            </span>
                                        </asp:Panel>
                                    </asp:Panel>
                                    <asp:Panel runat="server" CssClass="col-lg-5">
                                        <asp:Panel runat="server" CssClass="input-group">
                                            <span class="input-group-addon">Tipo</span>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbTipoFiltro" DataTextField="nomTipoIncidente" DataValueField="idTipoIncidente"></asp:DropDownList>
                                        </asp:Panel>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" CssClass="row" Style="margin-top: 2%">
                                    <asp:Panel runat="server" CssClass="col-lg-12">
                                        <asp:Panel runat="server" CssClass="input-group">
                                            <span class="input-group-addon">Filtrar por fecha</span>
                                            <asp:TextBox runat="server" TextMode="Date" ID="filtroFechaInicial" CssClass="form-control"></asp:TextBox>
                                            <span class="input-group-addon">a</span>
                                            <asp:TextBox runat="server" TextMode="Date" ID="filtroFechaFinal" CssClass="form-control"></asp:TextBox>
                                        </asp:Panel>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:Panel runat="server" CssClass="col-lg-3">

                            <asp:UpdatePanel runat="server" ID="update2" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel runat="server" CssClass="row">
                                        <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                        <asp:LinkButton ID="btnNuevo" OnClientClick="mostrarModal(0)" Style="margin-bottom: -8%" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnCancelar" Style="margin-bottom: -8%" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-remove"></span>
                             Cancelar
                                        </asp:LinkButton>
                                            </asp:Panel>
                                    </asp:Panel>
                                    <asp:Panel runat="server" CssClass="row" Style="margin-top: 2%">
                                        <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                        <asp:LinkButton ID="btnCerrar" OnClientClick="mostrarModal(2)" Style="margin-bottom: -8%" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-lock"></span>
                             Cerrar
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnAsignar" OnClientClick="mostrarModal(1)" Style="margin-bottom: -8%" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-user"></span>
                             soporte
                                        </asp:LinkButton>
                                            </asp:Panel>
                                    </asp:Panel>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tabAbierta" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:Panel runat="server" CssClass="modal fade" ID="ModalNuevo" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <asp:Panel runat="server" CssClass="modal-dialog modal-md">
                                    <asp:Panel runat="server" CssClass="modal-content">
                                        <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                            <asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="lbelTituloModal" Text="Alta de incidente" />
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-body">
                                            <asp:Panel runat="server" CssClass="form-group">
                                               <asp:Label runat="server" Text="Descripción" Font-Bold="true"></asp:Label>
                                                <asp:TextBox runat="server" placeholder="Describa su incidente de tal forma que podamos ayudarle." style="resize:none" Height="125" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                            </asp:Panel>
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-footer">
                                            <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                            <asp:Button runat="server" ID="btnGuardar"  CssClass="btn btn-primary" Text="Grabar"/>
                                        </asp:Panel>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel runat="server" CssClass="modal fade" ID="ModalAsignar" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <asp:Panel runat="server" CssClass="modal-dialog modal-md">
                                    <asp:Panel runat="server" CssClass="modal-content">
                                        <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                            <asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="Label1" Text="Asignar soporte a incidente" />
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-body">
                                            <asp:Panel runat="server" CssClass="row">
                                                <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                <asp:Panel runat="server" CssClass="col-lg-10">
                                                    <asp:Panel runat="server" CssClass="form-group">
                                                        <asp:Panel runat="server" CssClass="row">
                                                            <asp:Panel runat="server" CssClass="col-lg-6">
                                                                <asp:Label runat="server" Font-Bold="true" Text="Tipo" />
                                                                <asp:DropDownList runat="server" ID="cbTipoIncidente" DataValueField="idTipoIncidente" DataTextField="nomTipoIncidente" CssClass="form-control" />
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="col-lg-6">
                                                                <asp:Label runat="server" Font-Bold="true" Text="Prioridad" />
                                                                <asp:DropDownList runat="server" ID="cbPrioridad" CssClass="form-control">
                                                                    <asp:ListItem Text="Alta"></asp:ListItem>
                                                                    <asp:ListItem Text="Media"></asp:ListItem>
                                                                    <asp:ListItem Text="Norma"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </asp:Panel>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                    <asp:Panel runat="server" CssClass="form-group">
                                                        <asp:Label runat="server" Font-Bold="true" Text="Soporte"></asp:Label>
                                                        <asp:DropDownList runat="server" ID="cbSoporte" DataTextField="nomCompleto" DataValueField="idUsuario" CssClass="form-control"></asp:DropDownList>
                                                    </asp:Panel>
                                                    <asp:Panel runat="server" CssClass="form-group">
                                                        <asp:Label runat="server" Font-Bold="true" Text="Seguimiento"></asp:Label>
                                                        <asp:DropDownList runat="server" ID="cbSeguimiento" DataTextField="nomCompleto" DataValueField="idUsuario" CssClass="form-control"></asp:DropDownList>
                                                    </asp:Panel>
                                                    <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                </asp:Panel>
                                            </asp:Panel>
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-footer">
                                            <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                            <asp:Button runat="server" ID="Button1" CssClass="btn btn-primary" Text="Grabar" />
                                        </asp:Panel>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel runat="server" CssClass="modal fade" ID="ModalCerrar" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <asp:Panel runat="server" CssClass="modal-dialog modal-md">
                                    <asp:Panel runat="server" CssClass="modal-content">
                                        <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                            <asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="Label2" Text="Alta de incidente" />
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-body">
                                            <asp:Panel runat="server" CssClass="form-group">
                                               <asp:Label runat="server" Text="Acciones" Font-Bold="true"></asp:Label>
                                                <asp:TextBox runat="server" placeholder="Describa las acciones que realizó para intentar solucionar el incidente." Height="100" style="resize:none" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                            </asp:Panel>
                                            <asp:Panel runat="server" CssClass="form-group">
                                                <asp:Label runat="server" Text="Solución"/>
                                                <asp:TextBox runat="server" placeholder="Describa lo que realizó para solucionar el incidente" Height="100" style="resize:none" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                            </asp:Panel>
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-footer">
                                            <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                            <asp:Button runat="server" ID="Button2"  CssClass="btn btn-primary" Text="Grabar" />
                                        </asp:Panel>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>
                    </asp:Panel>
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Panel runat="server" CssClass="box">
                            <ul id="myTab" class="nav nav-tabs" role="tablist">
                                <li class="active">
                                    <asp:LinkButton runat="server" ID="tabAbierta" href="#abierta" role="tab" data-toggle="tab">Abierta</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton runat="server" ID="tabEnProceso" href="#enProceso" role="tab" data-toggle="tab">En proceso</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton runat="server" ID="tabCerrada" href="#cerrada" role="tab" data-toggle="tab">Cerrada</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton runat="server" ID="tabCancelada" href="#cancelada" role="tab" data-toggle="tab">Cancelada</asp:LinkButton></li>
                            </ul>
                            <asp:Panel runat="server" ID="myTabContent" CssClass="tab-content">
                                <asp:Panel runat="server" ID="abierta" CssClass="tab-pane fade in active">
                                    <asp:Panel runat="server" ID="contenedorTabla1" ScrollBars="Auto" Height="300" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="update1" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ToolTip="Asigne el soporte a los incidentes" runat="server" OnRowCreated="gvIncidentes_RowCreated" ID="gvIncidentes_Abiertos" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" DataKeyNames="numIncidente" CellPadding="4" GridLines="Horizontal">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="numIncidente" />
                                                        <asp:BoundField HeaderText="Descripción" DataField="descripcion" HeaderStyle-Width="350" />
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" />
                                                        <asp:BoundField HeaderText="Fecha solicitud" DataField="fecha_Sol" DataFormatString="{0:D}" />
                                                        <asp:BoundField HeaderText="Hora inicial" DataField="horaIn" DataFormatString="{0:t}" />
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnCancelar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnAsignar" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="enProceso" CssClass="tab-pane fade">
                                    <asp:Panel runat="server" ID="Panel1" ScrollBars="Auto" Height="300" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ToolTip="Solucione los incidentes" runat="server" OnRowCreated="gvIncidentes_RowCreated" ID="gvIncidentes_EnProceso" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" DataKeyNames="numIncidente" CellPadding="4" GridLines="Horizontal">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="numIncidente" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Tipo" DataField="tipo" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Descripción" DataField="descripcion" ItemStyle-Width="400" ItemStyle-Wrap="true" />
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Prioridad" DataField="prioridad" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Soporte" DataField="soporte" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Apoyo" DataField="seguimiento" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Fecha solicitud" DataField="fecha_Sol" DataFormatString="{0:D}" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Hora inicial" DataField="horaIn" DataFormatString="{0:t}" ItemStyle-Wrap="false" />
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnAsignar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnCancelar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnCerrar" EventName="Click" /> 
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="cerrada" CssClass="tab-pane fade">
                                    <asp:Panel runat="server" ID="Panel2" ScrollBars="Auto" Height="300" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView runat="server" OnRowCreated="gvIncidentes_RowCreated" ID="gvIncidentes_Cerrados" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" DataKeyNames="numIncidente" CellPadding="4" GridLines="Horizontal">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="numIncidente" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Tipo" DataField="tipo" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Descripción" DataField="descripcion" ItemStyle-Wrap="true" />
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Prioridad" DataField="prioridad" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Soporte" DataField="soporte" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Apoyo" DataField="seguimiento" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Fecha solicitud" DataField="fecha_Sol" DataFormatString="{0:D}" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Hora inicial" DataField="horaIn" DataFormatString="{0:t}" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Fecha cierre" DataField="fecha_Cierre" DataFormatString="{0:D}" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Hora final" DataField="horaFn" DataFormatString="{0:t}" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Acciones" DataField="acciones" ItemStyle-Wrap="true" ItemStyle-Width="400" />
                                                        <asp:BoundField HeaderText="Solución" DataField="solucion" ItemStyle-Wrap="true" ItemStyle-Width="400" />
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnCerrar" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="cancelada" CssClass="tab-pane fade">
                                    <asp:Panel runat="server" ID="Panel3" ScrollBars="Auto" Height="300" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ToolTip="Solucione los incidentes" runat="server" OnRowCreated="gvIncidentes_RowCreated" ID="gvIncidentes_Cancelados" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" DataKeyNames="numIncidente" CellPadding="4" GridLines="Horizontal">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="numIncidente" />
                                                        <asp:BoundField HeaderText="Descripción" DataField="descripcion" HeaderStyle-Width="400" />
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" />
                                                        <asp:BoundField HeaderText="Fecha de solicitud" DataField="fecha_Sol" DataFormatString="{0:D}" />
                                                        <asp:BoundField HeaderText="Hora solicitud" DataField="horaIn" DataFormatString="{0:t}" />
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnCancelar" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>
                    </asp:Panel>
                </asp:Panel>
            </form>
        </asp:Panel>
    </asp:Panel>
    <asp:Panel CssClass="navbar navbar-fixed-bottom panel-inferior" runat="server">
    </asp:Panel>
     <script type="text/javascript">
         function mostrarModal(a) {
             switch (a) {
                 case 0: {
                     $('#ModalNuevo').modal('show');
                     break;
                 }
                 case 1: {
                     $('#ModalAsignar').modal('show');
                     break;
                 }
                 case 2: {
                     $('#ModalCerrar').modal('show');
                     break;
                 }
                
             }
         }

     </script>
    <script src="../js/jquery-2.1.1.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>
