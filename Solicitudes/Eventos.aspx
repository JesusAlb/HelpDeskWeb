<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Eventos.aspx.cs" Inherits="HelpDeskWeb.Solicitudes.Eventos" %>




<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Atención a eventos</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/helpdesk-template.css" rel="stylesheet" />
    <link href="../css/styles.css" rel="stylesheet" />
    <link href="../css/styles2.css" rel="stylesheet" />
    <link href="../css/printstyles.css" rel="stylesheet" />
    <script src="../js/bootstrap.js"></script>
    <script src="../js/jquery-2.1.1.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" lang="js">
        $(function () {
            $("#<%=txtFiltro.ClientID%>").keyup(function () {               
                __doPostBack("txtFiltro", $("#<%=txtFiltro.ClientID%>").val());
            })
        });
    </script>
</head>
<body>  
    <asp:Panel runat="server" CssClass="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <asp:HyperLink runat="server" class="navbar-brand" Text="HelpDesk" ImageUrl="~/Imagenes/IMCA IAP.png" ImageHeight="30" ImageWidth="80" NavigateUrl="~/principal.aspx" />
            </div>
            <div class="collapse navbar-collapse">
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
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="~/Solicitudes/Incidentes.aspx">Incidentes</asp:HyperLink></li>
                            <li class="active">
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
                                <asp:HyperLink runat="server" href="#">Perfil</asp:HyperLink></li><li class="divider"></li>
                            <li>
                                <asp:HyperLink runat="server" href="#">Cerrar sesión</asp:HyperLink></li></ul></li><li>
                        <asp:HyperLink runat="server" NavigateUrl="~/principal.aspx">Inicio</asp:HyperLink></li></ul></div></div></asp:Panel>
    <asp:Panel runat="server" CssClass="container">
        <asp:Panel runat="server" CssClass="box">
            <form runat="server">
                <asp:ScriptManager runat="server" ID="scrip" EnablePartialRendering="true"></asp:ScriptManager>
                <asp:Panel runat="server" CssClass="row panel-titulo">
                    Centro de atención a eventos </asp:Panel>
                <asp:Panel runat="server" CssClass="row">
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Panel runat="server" CssClass="col-lg-7">
                            <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                            <asp:Panel runat="server" CssClass="col-lg-11">
                                <asp:Panel runat="server" CssClass="row">
                                    <asp:Panel runat="server" CssClass="input-group">
                                        <asp:TextBox runat="server" ID="txtFiltro"   placeholder="Buscar" CssClass="form-control" />
                                        <span class="input-group-btn">
                                            <asp:Button runat="server" ID="btnFiltrar" Text="Fitrar" CssClass="btn btn-default" />
                                        </span>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" CssClass="row" Style="margin-top: 2%">
                                    <asp:Panel runat="server" CssClass="input-group">
                                        <span class="input-group-addon">Filtrar por fecha</span>
                                        <asp:TextBox runat="server" TextMode="Date" ID="txtFechaInicial" CssClass="form-control"></asp:TextBox><span class="input-group-addon">a</span>
                                        <asp:TextBox runat="server" TextMode="Date" ID="txtFechaFinal" CssClass="form-control"></asp:TextBox>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:Panel runat="server" CssClass="col-lg-4">
                            <asp:UpdatePanel runat="server" ID="update1" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel runat="server" CssClass="row">
                                        <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                            <asp:LinkButton ID="btnNuevo" OnClientClick="mostrarModal('ModalNuevo', 'show')" OnClick="btnNuevo_Click" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                            </asp:LinkButton><asp:LinkButton ID="btnEditar" OnClick="btnEditar_Click" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Editar
                                            </asp:LinkButton><asp:LinkButton ID="btnCancelar" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-remove"></span>
                             Cancelar
                                            </asp:LinkButton>
                                        </asp:Panel>
                                    </asp:Panel>
                                    <asp:Panel runat="server" CssClass="row" Style="margin-top: 2%">
                                        <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                            <asp:LinkButton ID="btnAsignar" runat="server" OnClick="btnAsignar_Click" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-user"></span>
                             soporte
                                            </asp:LinkButton><asp:LinkButton ID="btnRecursos" OnClick="btnRecursos_Click" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-th-large"></span>
                             Recursos
                                            </asp:LinkButton><asp:LinkButton ID="btnCerrar" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-lock"></span>
                             Cerrar
                                            </asp:LinkButton>
                                        </asp:Panel>
                                    </asp:Panel>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tabAbierta" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="tabEnProceso" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="tabCerrada" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="tabCancelada" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="gvEventos_Abiertos" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="gvEventos_EnProceso" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="gvEventos_Cerrados" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="gvEventos_Cancelados" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:Panel runat="server" CssClass="modal fade" ID="ModalNuevo" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <asp:Panel runat="server" CssClass="modal-dialog modal-md">
                                    <asp:Panel runat="server" CssClass="modal-content">
                                        <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button><asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="lbelTituloModal" Text="Alta de evento" />
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-body">
                                            <asp:Panel runat="server" CssClass="row">
                                                <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                <asp:Panel runat="server" CssClass="col-lg-10">
                                                    <asp:UpdatePanel runat="server" ID="updateModalNuevo" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Text="Título" Font-Bold="true"></asp:Label><asp:TextBox runat="server" placeholder="Escriba el nombre del evento" ID="txtTituloNuevo" Style="resize: none" required CssClass="form-control">
                                                                </asp:TextBox>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Text="Lugar" Font-Bold="true"></asp:Label><asp:DropDownList runat="server" CssClass="form-control" ID="cbLugares" DataTextField="nomLugar" DataValueField="idLugar"></asp:DropDownList>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Panel runat="server" CssClass="row">
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Acomodo"></asp:Label><asp:TextBox runat="server" CssClass="form-control" required ID="txtAcomodo"></asp:TextBox>
                                                                    </asp:Panel>
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Tipo"></asp:Label><asp:DropDownList runat="server" CssClass="form-control" required ID="cbTipo">
                                                                            <asp:ListItem Text="Público"></asp:ListItem>
                                                                            <asp:ListItem Text="Privado"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Panel runat="server" CssClass="row">
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Asistencia aproximada"></asp:Label><asp:TextBox runat="server" CssClass="form-control" TextMode="Number" required ID="txtAsistencia"></asp:TextBox>
                                                                    </asp:Panel>
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Fecha de realización"></asp:Label><asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="txtFecha"></asp:TextBox>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Panel runat="server" CssClass="row">
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Hora de inicio"></asp:Label><asp:TextBox runat="server" CssClass="form-control" TextMode="Time" required ID="txtHoraInicial"></asp:TextBox>
                                                                    </asp:Panel>
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Hora de termino"></asp:Label><asp:TextBox runat="server" CssClass="form-control" TextMode="Time" ID="txtHoraFinal"></asp:TextBox>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Font-Bold="true" Text="Descripción"></asp:Label><asp:TextBox runat="server" CssClass="form-control" placeholder="Describa el evento" ID="txtDescripcion" Height="100" TextMode="MultiLine" Style="resize: none"></asp:TextBox>
                                                            </asp:Panel>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnEditar" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </asp:Panel>
                                            </asp:Panel>
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-footer">
                                            <asp:UpdatePanel runat="server" ID="UpdateScript"
                                                UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                    <asp:Button runat="server" ID="btnGuardar" OnClick="btnGuardar_Click" CssClass="btn btn-primary" Text="Grabar" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel runat="server" CssClass="modal fade" ID="ModalAsignar" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <asp:Panel runat="server" CssClass="modal-dialog modal-md">
                                    <asp:Panel runat="server" CssClass="modal-content">
                                        <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button><asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="Label1" Text="Asignar soporte al evento" />
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-body">
                                            <asp:Panel runat="server" CssClass="row">
                                                <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                <asp:Panel runat="server" CssClass="col-lg-10">
                                                    <asp:UpdatePanel runat="server" ID="updateAsignar">
                                                        <ContentTemplate>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Font-Bold="true" Text="Soporte"></asp:Label><asp:DropDownList runat="server" ID="cbSoporte" DataTextField="nomCompleto" DataValueField="idUsuario" CssClass="form-control"></asp:DropDownList>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Font-Bold="true" Text="Seguimiento"></asp:Label><asp:DropDownList runat="server" ID="cbSeguimiento" DataTextField="nomCompleto" DataValueField="idUsuario" CssClass="form-control"></asp:DropDownList>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnAsignar" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
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
                            <asp:Panel runat="server" CssClass="modal fade" ID="ModalRecursos" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <asp:Panel runat="server" CssClass="modal-dialog modal-lg">
                                    <asp:Panel runat="server" CssClass="modal-content">
                                        <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button><asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="Label2" Text="Asginar recursos a eventos" />
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-body">
                                            <asp:Panel runat="server" CssClass="form-group">
                                                <asp:Panel runat="server" CssClass="row">
                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                        <asp:Panel runat="server" CssClass="input-group">
                                                            <asp:Label runat="server" CssClass="input-group-addon">Título</asp:Label>
                                                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtTitulo" ReadOnly="true" Style="resize: none" TextMode="MultiLine">
                                                                    </asp:TextBox>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnRecursos" EventName="Click" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Panel runat="server" CssClass="input-group">
                                                                <asp:TextBox runat="server" ID="txtFiltroReq" placeholder="Buscar" CssClass="form-control" />
                                                                <span class="input-group-btn">
                                                                    <asp:Button runat="server" ID="btnFiltrarReq" Text="Fitrar" CssClass="btn btn-default" />
                                                                </span>
                                                            </asp:Panel>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Panel runat="server" CssClass="input-group">
                                                                <asp:Label runat="server" CssClass="input-group-addon" Text="Tipo">
                                                                </asp:Label><asp:DropDownList runat="server" CssClass="form-control">
                                                                    <asp:ListItem Text="Cuantificable"></asp:ListItem>
                                                                    <asp:ListItem Text="No cuantificable"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </asp:Panel>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                </asp:Panel>
                                            </asp:Panel>
                                            <asp:Panel runat="server" CssClass="row">
                                                <asp:Panel runat="server" CssClass="col-lg-6">
                                                    <asp:Panel runat="server" CssClass="form-group" BackColor="White" BorderColor="LightGray" BorderStyle="Solid" BorderWidth="1">
                                                        <table class="table" style="margin-bottom: 0%; background-color: #F2F2F2">
                                                            <tr class="text-center" style="color: black; font-size: larger; border-bottom: LightGray 1px solid">
                                                                <td>Recursos asignados</td>
                                                            </tr>
                                                        </table>
                                                        <asp:Panel runat="server" ID="panel4" ScrollBars="Auto" Height="250">
                                                            <asp:UpdatePanel runat="server" ID="UpdatePanel5" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:GridView ToolTip="Tabla de recursos asignados" runat="server" OnRowCreated="gvEventos_RowCreated" ID="gvRecursosAsignados" AutoGenerateColumns="False" CssClass="table table-condensed " SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                                        ShowHeader="false" DataKeyNames="idRequerimientos" AlternatingRowStyle-BackColor="#F2F2F2" CellPadding="4" GridLines="None">
                                                                        <Columns>
                                                                            <asp:BoundField HeaderText="Recurso" DataField="nomRequerimiento" />
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnRecursos" EventName="Click" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                    <asp:Panel runat="server" CssClass="form-group text-center">
                                                        <asp:LinkButton ID="btnQuitar" runat="server" CssClass="btn btn-primary">
                                                            <span class="glyphicon glyphicon-minus-sign"></span>
                                                            Quitar
                                                        </asp:LinkButton>
                                                    </asp:Panel>
                                                </asp:Panel>
                                                <asp:Panel runat="server" CssClass="col-lg-6">
                                                    <asp:Panel runat="server" CssClass="form-group" BackColor="White" BorderColor="LightGray" BorderStyle="Solid" BorderWidth="1">
                                                        <table class="table" style="margin-bottom: 0%; background-color: #F2F2F2">
                                                            <tr class="text-center" style="color: black; font-size: larger; border-bottom: LightGray 1px solid">
                                                                <td>Recursos no asignados</td>
                                                            </tr>
                                                        </table>
                                                        <asp:Panel runat="server" ID="panelRecursosNoAsignados" ScrollBars="Auto" Height="250">
                                                            <asp:UpdatePanel runat="server" ID="UpdateRecursosNoAsignados" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:GridView ToolTip="Tabla de recursos disponibles" runat="server" ShowHeaderWhenEmpty="true" OnRowCreated="gvEventos_RowCreated" ID="gvRecursosNoAsignados" AutoGenerateColumns="False" CssClass="table table-condensed" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                                        ShowHeader="false" DataKeyNames="idRequerimientos" CellPadding="4" AlternatingRowStyle-BackColor="#F2F2F2" GridLines="none">
                                                                        <HeaderStyle Font-Bold="True" ForeColor="White" Font-Size="12" />
                                                                        <Columns>
                                                                            <asp:BoundField HeaderText="Recurso" DataField="nomRequerimiento" />
                                                                        </Columns>
                                                                        <EditRowStyle />
                                                                    </asp:GridView>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnRecursos" EventName="Click" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                    <asp:Panel runat="server" CssClass="form-group text-center">
                                                        <asp:LinkButton ID="btnAñadir" runat="server" CssClass="btn btn-primary">
                                                            <span class="glyphicon glyphicon-plus-sign"></span>
                                                            Añadir
                                                        </asp:LinkButton>
                                                    </asp:Panel>
                                                </asp:Panel>
                                            </asp:Panel>
                                            <asp:Panel runat="server" CssClass="row">
                                                <asp:Panel runat="server" CssClass="col-lg-12">
                                                    <asp:Panel runat="server" CssClass="form-group">
                                                        <asp:Label runat="server" Font-Bold="true" Text="Comentarios"></asp:Label>
                                                        <asp:TextBox runat="server" ID="txtObservaciones" Height="100" placeholder="Describa instrucciones, sugerencias u observaciones sobre el evento" CssClass="form-control" TextMode="MultiLine" Style="resize: none"></asp:TextBox>
                                                    </asp:Panel>
                                                </asp:Panel>
                                            </asp:Panel>
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-footer">
                                            <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                            <asp:Button runat="server" ID="Button2" CssClass="btn btn-primary" Text="Grabar" />
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
                                <asp:LinkButton runat="server" ID="tabAbierta" OnClientClick="activaTab('0')" href="#abierta" role="tab">Abierta</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton runat="server" ID="tabEnProceso" OnClientClick="activaTab('1')" href="#enProceso" role="tab">En proceso</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton runat="server" ID="tabCerrada" OnClientClick="activaTab('2')" href="#cerrada" role="tab">Cerrada</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton runat="server" ID="tabCancelada" OnClientClick="activaTab('3')" href="#cancelada" role="tab">Cancelada</asp:LinkButton>
                            </li>
                        </ul>

                            <asp:Panel runat="server" ID="myTabContent" CssClass="tab-content">
                                <asp:Panel runat="server" ID="abierta" CssClass="tab-pane fade in active">
                                    <asp:Panel runat="server" ID="contenedorTabla1" ScrollBars="Auto" Height="300" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ToolTip="Asigne el soporte a los eventos" runat="server" OnRowCreated="gvEventos_RowCreated" ID="gvEventos_Abiertos" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" DataKeyNames="idEvento" OnSelectedIndexChanged="gvEventos_SelectedIndexChanged" CellPadding="4" GridLines="Horizontal">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="idEvento" />
                                                        <asp:BoundField HeaderText="Descripción" DataField="descripcion" HeaderStyle-Width="400" />
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" />
                                                        <asp:BoundField HeaderText="Fecha de solicitud" DataField="fecha_Sol" DataFormatString="{0:D}" />
                                                        <asp:BoundField HeaderText="Hora solicitud" DataField="horaIn" DataFormatString="{0:t}" />
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />      
                                                <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />                                        
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="enProceso" CssClass="tab-pane fade">
                                    <asp:Panel runat="server" ID="Panel1" ScrollBars="Auto" Height="300" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ToolTip="Cierre los eventos" runat="server" OnRowCreated="gvEventos_RowCreated" ID="gvEventos_EnProceso" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" DataKeyNames="idEvento" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="gvEventos_SelectedIndexChanged">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="idEvento" />
                                                        <asp:BoundField HeaderText="Descripción" DataField="descripcion" HeaderStyle-Width="400" />
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" />
                                                        <asp:BoundField HeaderText="Fecha de solicitud" DataField="fecha_Sol" DataFormatString="{0:D}" />
                                                        <asp:BoundField HeaderText="Hora solicitud" DataField="horaIn" DataFormatString="{0:t}" />
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="cerrada" CssClass="tab-pane fade">
                                    <asp:Panel runat="server" ID="Panel2" ScrollBars="Auto" Height="300" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView runat="server" OnRowCreated="gvEventos_RowCreated" ID="gvEventos_Cerrados" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" DataKeyNames="idEvento" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="gvEventos_SelectedIndexChanged">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="idEvento" />
                                                        <asp:BoundField HeaderText="Descripción" DataField="descripcion" HeaderStyle-Width="400" />
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" />
                                                        <asp:BoundField HeaderText="Fecha de solicitud" DataField="fecha_Sol" DataFormatString="{0:D}" />
                                                        <asp:BoundField HeaderText="Hora solicitud" DataField="horaIn" DataFormatString="{0:t}" />
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="cancelada" CssClass="tab-pane fade">
                                    <asp:Panel runat="server" ID="Panel3" ScrollBars="Auto" Height="300" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel4" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView runat="server" OnRowCreated="gvEventos_RowCreated" ID="gvEventos_Cancelados" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" DataKeyNames="idEvento" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="gvEventos_SelectedIndexChanged">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="idEvento" />
                                                        <asp:BoundField HeaderText="Descripción" DataField="descripcion" HeaderStyle-Width="400" />
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" />
                                                        <asp:BoundField HeaderText="Fecha de solicitud" DataField="fecha_Sol" DataFormatString="{0:D}" />
                                                        <asp:BoundField HeaderText="Hora solicitud" DataField="horaIn" DataFormatString="{0:t}" />
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />
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
        function mostrarModal(a, opcion) {
                    $('#'+a).modal(opcion);
        }

        function activaTab(index) {
            $('#myTab li:eq(' + index + ') a').tab('show'); // Select third tab (0-indexed)   
            __doPostBack('tabAbierta', index);
        };
    </script>

</body>
</html>
