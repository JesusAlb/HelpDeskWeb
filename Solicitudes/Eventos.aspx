<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Eventos.aspx.cs" Inherits="HelpDeskWeb.Solicitudes.Eventos" %>

<%@ Import Namespace="HelpDeskWeb.Solicitudes"  %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Atención a eventos</title>
    <link rel="icon" type="image/icon" href="../Imagenes/imca.ico" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/helpdesk-template.css" rel="stylesheet" />
     <!--Inicio de Alertify -->
    <link href="../css/alertify.css" rel="stylesheet" />
    <link href="../css/alertify-bootstrap-3.css" rel="stylesheet" />
    <script src="../js/alertify.js" type="text/javascript"></script>
    <!--Fin de Alertify-->
    <script src="../js/jquery-2.1.1.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/jquery.mask.min.js" type="text/javascript"></script>
    <script src="../js/validador.js" type="text/javascript"></script>
    <script type="text/javascript" lang="js">
        $(function () {
            $("#<%=txtFiltro.ClientID%>").keyup(function () {           
                __doPostBack("txtFiltro", $("#<%=txtFiltro.ClientID%>").val());
            })
        });

        $(function () {
            $("#<%=txtFiltroReq.ClientID%>").keyup(function () {
                        __doPostBack("txtFiltroReq", $("#<%=txtFiltroReq.ClientID%>").val());
            })
        });

    </script>
</head>
<body>
    <asp:Panel runat="server" CssClass="navbar navbar-inverse navbar-fixed-top" role="navigation">
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
                                <asp:HyperLink runat="server" NavigateUrl="~/perfil.aspx">Perfil</asp:HyperLink></li>
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
    </asp:Panel>
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
                                    <asp:Panel runat="server" CssClass="form-group">
                                        <asp:TextBox runat="server" ID="txtFiltro" MaxLength="30"  placeholder="Buscar" CssClass="form-control prueba" />
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" CssClass="row">
                                    <asp:Panel runat="server" CssClass="input-group">
                                        <span class="input-group-addon">Filtrar por fecha</span>
                                        <asp:TextBox runat="server" TextMode="Date" ID="txtFechaInicial" CssClass="form-control" MaxLength="10" ></asp:TextBox><span class="input-group-addon">a</span>
                                        <asp:TextBox runat="server" TextMode="Date" ID="txtFechaFinal" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:Panel runat="server" CssClass="col-lg-4">
                            <asp:UpdatePanel runat="server" ID="UpdateBtns" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel runat="server" CssClass="form-group">
                                        <asp:Panel runat="server" CssClass="row">
                                                    <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                        <asp:LinkButton ID="btnNuevo" OnClick="btnNuevo_Click" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                                        </asp:LinkButton><asp:LinkButton ID="btnEditar" OnClick="btnEditar_Click" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-pencil"></span>
                             Editar
                                                        </asp:LinkButton><asp:LinkButton ID="btnCancelar" OnClick="btnCancelar_Click" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-remove"></span>
                             Cancelar
                                                        </asp:LinkButton>
                                                    </asp:Panel>
                                        </asp:Panel>
                                    </asp:Panel>
                                    <asp:Panel runat="server" CssClass="form-group">
                                        <asp:Panel runat="server" CssClass="row">
                                                    <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                        <asp:LinkButton ID="btnAsignar" runat="server" OnClick="btnAsignar_Click" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-user"></span>
                             soporte
                                                        </asp:LinkButton><asp:LinkButton ID="btnRecursos" OnClick="btnRecursos_Click" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-th-large"></span>
                             Recursos
                                                        </asp:LinkButton><asp:LinkButton ID="btnCerrar" OnClick="btnCerrar_Click" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-lock"></span>
                             Cerrar
                                                        </asp:LinkButton>
                                                    </asp:Panel>
                                            <asp:HiddenField runat="server" ID="idEventoSeleccionado" />
                                            <asp:HiddenField runat="server" ID="tabItemSeleccionado" Value="0" />
                                            <asp:HiddenField runat="server" ID="accion" />
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
                                    <asp:Panel runat="server" CssClass="modal-content" DefaultButton="btnGuardar" >
                                        <asp:UpdatePanel runat="server" ID="updateModalNuevo" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                                    <asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="lbelTituloModal" Text="Alta de evento" />
                                                </asp:Panel>
                                                <asp:Panel runat="server" ID="panelModalNuevo" CssClass="modal-body">
                                                    <asp:Panel runat="server" CssClass="row">
                                                        <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                        <asp:Panel runat="server" CssClass="col-lg-10">
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Text="Título" Font-Bold="true"></asp:Label>
                                                                <asp:TextBox runat="server" onpaste="return false;" placeholder="Escriba el nombre del evento" ID="txtTituloNuevo" MaxLength="50" onkeyup="keyUP(event.keyCode)" onkeydown="return isAlphaNumeric(event.keyCode);" Style="resize: none"  CssClass="form-control NumerosLetras">
                                                                </asp:TextBox>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Text="Lugar" Font-Bold="true"></asp:Label><asp:DropDownList runat="server"  CssClass="form-control" ID="cbLugares" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Panel runat="server" CssClass="row">
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Acomodo"></asp:Label>
                                                                        <asp:TextBox runat="server" CssClass="form-control" onpaste="return false;"  ID="txtAcomodo" onkeyup="keyUP(event.keyCode)" onkeydown="return isAlpha(event.keyCode);" MaxLength="30"></asp:TextBox>
                                                                    </asp:Panel>
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Tipo"></asp:Label><asp:DropDownList runat="server" CssClass="form-control"  ID="cbTipo">
                                                                            <asp:ListItem Text="Público" Value="0"></asp:ListItem>
                                                                            <asp:ListItem Text="Privado" Value="1"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Panel runat="server" CssClass="row">
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Asistencia aproximada"></asp:Label>
                                                                        <asp:TextBox runat="server" CssClass="form-control" onpaste="return false;" onkeyup="keyUP(event.keyCode)" onkeydown="return isNumeric(event.keyCode);" MaxLength="5"  ID="txtAsistencia" ></asp:TextBox>
                                                                    </asp:Panel>
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Fecha de realización"></asp:Label>
                                                                        <asp:TextBox runat="server" CssClass="form-control" onpaste="return false;" MaxLength="10" TextMode="Date" ID="txtFecha"></asp:TextBox>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Panel runat="server" CssClass="row">
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Hora de inicio"></asp:Label><asp:TextBox runat="server" CssClass="form-control dateValido" TextMode="Time" MaxLength="15" ID="txtHoraInicial" onpaste="return false;"></asp:TextBox>
                                                                    </asp:Panel>
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Hora de termino"></asp:Label><asp:TextBox runat="server" CssClass="form-control" TextMode="Time" MaxLength="15" ID="txtHoraFinal" onpaste="return false;"></asp:TextBox>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Font-Bold="true" Text="Descripción"></asp:Label>
                                                                <asp:TextBox runat="server" CssClass="form-control" onpaste="return false;" placeholder="Describa el evento" ID="txtDescripcion" onkeypress="if (this.value.length > 250) { alertify.error('Máximo de 250 caractéres');  return false; }" onkeyup="keyUP(event.keyCode)" onkeydown="return isDescription(event.keyCode);"  Height="100" TextMode="MultiLine" Style="resize: none"></asp:TextBox>
                                                            </asp:Panel>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                </asp:Panel>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnEditar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <asp:Panel runat="server" CssClass="modal-footer">
                                            <asp:UpdatePanel runat="server" ID="UpdateGrabar" UpdateMode="Conditional">
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
                                    <asp:Panel runat="server" CssClass="modal-content" DefaultButton="btnGrabarAsignacion">
                                        <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button><asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="Label1" Text="Asignar soporte al evento" />
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-body">
                                            <asp:Panel runat="server" CssClass="row">
                                                <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                <asp:Panel runat="server" CssClass="col-lg-10">
                                                    <asp:UpdatePanel runat="server" ID="updateAsignar" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Font-Bold="true" Text="Soporte"></asp:Label><asp:DropDownList runat="server" ID="cbSoporte" DataTextField="nom_completo" DataValueField="id" CssClass="form-control"></asp:DropDownList>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Font-Bold="true" Text="Seguimiento"></asp:Label><asp:DropDownList runat="server" ID="cbSeguimiento" DataTextField="nom_completo" DataValueField="id" CssClass="form-control"></asp:DropDownList>
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
                                        <asp:UpdatePanel runat="server" ID="UpdateSoporte" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                <asp:LinkButton runat="server" ID="btnGrabarAsignacion" OnClick="btnGrabarAsignacion_Click" CssClass="btn btn-primary" Text="Grabar" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>      
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
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtTitulo" onpaste="return false;" ReadOnly="true" Style="resize: none" TextMode="MultiLine">
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
                                                                <asp:TextBox runat="server" ID="txtFiltroReq" MaxLength="25" placeholder="Buscar" CssClass="form-control" />
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Panel runat="server" CssClass="input-group">
                                                                <asp:Label runat="server" CssClass="input-group-addon" Text="Tipo">
                                                                </asp:Label><asp:DropDownList runat="server" ID="cbCuantificable" CssClass="form-control" OnSelectedIndexChanged="cbCuantificable_SelectedIndexChanged" AutoPostBack="true">
                                                                    <asp:ListItem Text=""></asp:ListItem>
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
                                                        <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Table runat="server" ID="tabla1" class="table" style="margin-bottom: 0%; background-color: #F2F2F2">
                                                                    <asp:TableRow runat="server" Font-Bold="true" class="text-center" BackColor="#006699" ForeColor="White" Font-Size="Larger" style="border-bottom: LightGray 1px solid">                                    
                                                                        <asp:TableCell ID="tblReqAsH1" style="border-right: solid 1px white">Recursos asignados</asp:TableCell>
                                                                        <asp:TableCell ID="tblReqAsH2">Cantidad</asp:TableCell>
                                                                    </asp:TableRow>
                                                                </asp:Table>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnRecursos" EventName="Click" />
                                                                <asp:AsyncPostBackTrigger ControlID="btnQuitar" EventName="Click" />
                                                                <asp:AsyncPostBackTrigger ControlID="btnAñadir" EventName="Click" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                        <asp:Panel runat="server" ID="panelTablaReqA" ScrollBars="Auto" Height="250">
                                                            <asp:UpdatePanel runat="server" ID="UpdatePanel5" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:GridView ToolTip="Tabla de recursos asignados" runat="server" OnRowCreated="gvEventos_RowCreated" ID="gvRecursosAsignados" AutoGenerateColumns="False" CssClass="table table-condensed" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                                        ShowHeader="false" DataKeyNames="idRequerimiento" AlternatingRowStyle-BackColor="#F2F2F2" CellPadding="4" GridLines="none" OnSelectedIndexChanged="gvRecursosAsignados_SelectedIndexChanged">
                                                                        <Columns>
                                                                            <asp:BoundField HeaderText="Recurso" ItemStyle-Width="70%" DataField="nomRequerimiento" />
                                                                            <asp:BoundField HeaderText="Cantidad"  DataField="cantidad" />
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnRecursos" EventName="Click" />
                                                                    <asp:AsyncPostBackTrigger ControlID="btnQuitar" EventName="Click" />
                                                                    <asp:AsyncPostBackTrigger ControlID="btnAñadir" EventName="Click" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                    <asp:Panel runat="server" CssClass="form-group text-center">
                                                        <asp:UpdatePanel runat="server" ID="UpdateBtnQuitar" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Panel runat="server"  CssClass="input-group" DefaultButton="btnQuitar">
                                                                    <span class="input-group-addon">Cantidad</span>
                                                                    <asp:TextBox runat="server" ID="txtCantidadAs" onpaste="return false;" onkeyup="keyUP(event.keyCode)" onkeydown="return isNumeric(event.keyCode);" MaxLength="5" CssClass="form-control" ></asp:TextBox>
                                                                    <div class="input-group-btn">
                                                                        <asp:LinkButton ID="btnQuitar" runat="server" CssClass="btn btn-primary" OnClick="btnQuitar_Click">
                                                            <span class="glyphicon glyphicon-minus-sign"></span>
                                                            Quitar
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                </asp:Panel>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="gvRecursosAsignados" EventName="SelectedIndexChanged" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </asp:Panel>
                                                </asp:Panel>
                                                <asp:Panel runat="server" CssClass="col-lg-6">
                                                    <asp:Panel runat="server" CssClass="form-group" BackColor="White" BorderColor="LightGray" BorderStyle="Solid" BorderWidth="1">
                                                        <asp:Table runat="server" ID="Table1" class="table" Style="margin-bottom: 0%; background-color: #F2F2F2">
                                                            <asp:TableRow runat="server" Font-Bold="true" class="text-center" BackColor="#006699" ForeColor="White" Font-Size="Larger" Style="border-bottom: LightGray 1px solid">
                                                                <asp:TableCell >Recursos asignados</asp:TableCell>
                                                            </asp:TableRow>
                                                        </asp:Table>
                                                        <asp:Panel runat="server" ID="panelRecursosNoAsignados" ScrollBars="Auto" Height="250">
                                                            <asp:UpdatePanel runat="server" ID="UpdateRecursosNoAsignados" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:GridView ToolTip="Tabla de recursos disponibles" runat="server" ShowHeaderWhenEmpty="true" OnRowCreated="gvEventos_RowCreated" ID="gvRecursosNoAsignados" AutoGenerateColumns="False" CssClass="table table-condensed" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                                        ShowHeader="false" DataKeyNames="id" CellPadding="4" AlternatingRowStyle-BackColor="#F2F2F2" GridLines="none" OnSelectedIndexChanged="gvRecursosNoAsignados_SelectedIndexChanged">
                                                                        <HeaderStyle Font-Bold="True" ForeColor="White" Font-Size="12" />
                                                                        <Columns>
                                                                            <asp:BoundField HeaderText="Recurso" DataField="nombre" />
                                                                        </Columns>
                                                                        <EditRowStyle />
                                                                    </asp:GridView>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnRecursos" EventName="Click" />
                                                                    <asp:AsyncPostBackTrigger ControlID="btnAñadir" EventName="Click" />
                                                                    <asp:AsyncPostBackTrigger ControlID="btnQuitar" EventName="Click" />
                                                                    <asp:AsyncPostBackTrigger ControlID="txtFiltroReq" EventName="TextChanged" />
                                                                    <asp:AsyncPostBackTrigger ControlID="cbCuantificable" EventName="SelectedIndexChanged" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                    <asp:Panel runat="server" CssClass="form-group">
                                                        <asp:UpdatePanel runat="server" ID="UpdateBtnAñadir" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Panel runat="server" class="input-group" DefaultButton="btnAñadir">
                                                                    <span class="input-group-addon">Cantidad</span>
                                                                    <asp:TextBox runat="server" ID="txtCantidad" onpaste="return false;" MaxLength="5" Text="1" CssClass="form-control"  onkeyup="keyUP(event.keyCode)" onkeydown="return isNumeric(event.keyCode);"></asp:TextBox>
                                                                    <div class="input-group-btn">
                                                                        <asp:LinkButton ID="btnAñadir" runat="server" OnClick="btnAñadir_Click" CssClass="btn btn-primary">
                                                            <span class="glyphicon glyphicon-plus-sign"></span>
                                                            Añadir
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                </asp:Panel>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="gvRecursosNoAsignados" EventName="SelectedIndexChanged" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </asp:Panel>
                                                </asp:Panel>
                                            </asp:Panel>
                                            <asp:Panel runat="server" CssClass="row">
                                                <asp:Panel runat="server" CssClass="col-lg-12">
                                                    <asp:Panel runat="server" CssClass="form-group">
                                                        <asp:Label runat="server" Font-Bold="true" Text="Comentarios"></asp:Label>
                                                        <asp:TextBox runat="server" ID="txtObservaciones" onkeypress="if (this.value.length > 250) { alertify.error('Máximo de 250 caractéres');  return false; }" onpaste="return false;" Height="100"  placeholder="Describa instrucciones, sugerencias u observaciones sobre el evento" CssClass="form-control" TextMode="MultiLine" Style="resize: none"></asp:TextBox>
                                                    </asp:Panel>
                                                </asp:Panel>
                                            </asp:Panel>
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-footer">   
                                            <asp:UpdatePanel runat="server" ID="UpdateGrabarRecursos" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                    <asp:LinkButton runat="server" ID="btnGrabarRecursos" OnClick="btnGrabarRecursos_Click" CssClass="btn btn-primary" Text="Grabar" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="ModalEncuesta" CssClass="modal fade" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <asp:Panel runat="server" CssClass="modal-dialog modal-md">
                                    <asp:Panel runat="server" CssClass="modal-content">
                                        <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button><asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="Label3" Text="Evaluación del servicio" />
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-body">
                                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Panel runat="server" CssClass="row">
                                                        <asp:Panel runat="server" CssClass="col-lg-1">
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="col-lg-10">
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Panel runat="server" CssClass="input-group">
                                                                    <span class="input-group-addon">Solicitante</span>
                                                                    <asp:TextBox runat="server" ID="txtSolicitante" Enabled="false" CssClass="form-control"></asp:TextBox>
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                               <asp:Label runat="server" Text="Califique el servicio otorgado a traves de las siguientes preguntas"></asp:Label>
                                                               <asp:HiddenField runat="server" ID="idCalidad" />
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Panel runat="server" ScrollBars="Auto" Height="220" >
                                                                <asp:UpdatePanel runat="server" ID="updateEncuestas" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                <asp:GridView runat="server" ID="gvEncuestas" AutoGenerateColumns="false" DataKeyNames="id" CssClass="table table-bordered" >
                                                                    <Columns>
                                                                        <asp:BoundField HeaderText="#" DataField="numero"/>
                                                                        <asp:BoundField HeaderText="Aspecto" DataField="pregunta"/>
                                                                        <asp:TemplateField HeaderText="Respuestas">
                                                                            <ItemTemplate>
                                                                                <asp:DropDownList runat="server" ID="cbRespuesta"  OnSelectedIndexChanged="cbRespuesta_SelectedIndexChanged" CssClass="form-control" AutoPostBack="true">
                                                                                    <asp:ListItem Text="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="2"></asp:ListItem>
                                                                                    <asp:ListItem Text="3"></asp:ListItem>
                                                                                    <asp:ListItem Text="4"></asp:ListItem>
                                                                                    <asp:ListItem Text="5"></asp:ListItem>
                                                                                    <asp:ListItem Text="6"></asp:ListItem>
                                                                                    <asp:ListItem Text="7"></asp:ListItem>
                                                                                    <asp:ListItem Text="8"></asp:ListItem>
                                                                                    <asp:ListItem Text="9"></asp:ListItem>
                                                                                    <asp:ListItem Text="10"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField HeaderText="Respuestas" DataField="valor" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                                </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <table class="table table-bordered">
                                                                    <td style="width: 35%; height:163px">
                                                                        <asp:UpdatePanel runat="server" ID="upResultado" UpdateMode="Conditional">
                                                                            <ContentTemplate>
                                                                                <asp:Image runat="server" ID="imgSatisfaccion" ImageUrl="~/Imagenes/iconos/nivel0.png" />
                                                                                <div class="input-group">
                                                                                    <span class="input-group-addon">Promedio</span>
                                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtPromedio" Text="1" MaxLength="3" Enabled="false"></asp:TextBox>
                                                                                </div>
                                                                            </ContentTemplate>
                                                                            <Triggers>
                                                                                <asp:AsyncPostBackTrigger ControlID="gvEncuestas" />
                                                                            </Triggers>
                                                                        </asp:UpdatePanel>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Observaciones"></asp:Label>
                                                                        <asp:TextBox runat="server" ID="txtObEncuestas" CssClass="form-control" onpaste="return false;" onkeypress="if (this.value.length > 250) { alertify.error('Máximo de 250 caractéres');  return false; }"  placeholder="Por favor escriba una sugerencia o comentario sobre el servicio otorgado" TextMode="MultiLine" Style="height: 95%; resize: none"></asp:TextBox>
                                                                    </td>
                                                                </table>
                                                            </asp:Panel>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="col-lg-1">
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="gvEventos_Cerrados"/>
                                                </Triggers>
                                            </asp:UpdatePanel>
                                                    
                                        </asp:Panel>                                       
                                        <asp:Panel runat="server" CssClass="modal-footer">
                                        <asp:UpdatePanel runat="server" ID="upGrabarEncuesta" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                    <asp:LinkButton runat="server" ID="btnGrabarEncuesta"  CssClass="btn btn-primary" Text="Grabar" OnClick="btnGrabarEncuesta_Click" />
                                                </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="gvEventos_Cerrados" />
                                            </Triggers>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>
                    </asp:Panel>
                <asp:Panel runat="server" CssClass="row">
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
                                    <asp:Panel runat="server" ID="contenedorTabla1" CssClass="contenedorTablaSolicitudes" ScrollBars="Auto" Height="340" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ToolTip="Asigne el soporte a los eventos" runat="server" OnRowCreated="gvEventos_RowCreated" ID="gvEventos_Abiertos" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" Width="2000" DataKeyNames="id" OnSelectedIndexChanged="gvEventos_SelectedIndexChanged" CellPadding="4" GridLines="Horizontal">
                                                    <HeaderStyle Font-Bold="True"  ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="id" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Título" DataField="nombre" ItemStyle-Wrap="true" ItemStyle-Width="300" />
                                                        <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="text-left" ItemStyle-Wrap="true" ItemStyle-Width="400">
                                                            <ItemTemplate>
                                                                <%#((string)Eval("descripcion")).Replace("\n", "<br/>") %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Lugar" DataField="lugar" ItemStyle-Wrap="true" ItemStyle-Width="250"/>
                                                        <asp:BoundField HeaderText="Fecha" DataField="fecha_realizacion" DataFormatString="{0:D}" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Hora Inicial" DataField="hora_inicial" DataFormatString="{0:t}" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Hora Final" DataField="hora_final" DataFormatString="{0:t}" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Acomodo" DataField="acomodo" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Asistencia" DataField="asistencia" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Tipo" DataField="tipo" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Fecha de solicitud" DataField="fecha_solicitud" DataFormatString="{0:D}" ItemStyle-Wrap="false"/>
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />  
                                                <asp:AsyncPostBackTrigger ControlID="btnCancelar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnGrabarAsignacion" EventName="Click" />    
                                                <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="tabAbierta" EventName="Click"/> 
                                                <asp:AsyncPostBackTrigger ControlID="tabEnProceso" EventName="Click"/> 
                                                <asp:AsyncPostBackTrigger ControlID="tabCerrada" EventName="Click"/>     
                                                <asp:AsyncPostBackTrigger ControlID="tabCancelada" EventName="Click"/>                                            
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="enProceso" CssClass="tab-pane fade">
                                    <asp:Panel runat="server" ID="Panel1" CssClass="contenedorTablaSolicitudes" ScrollBars="Auto" Height="340" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ToolTip="Cierre los eventos" runat="server" OnRowCreated="gvEventos_RowCreated" ID="gvEventos_EnProceso" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" Width="2200" DataKeyNames="id" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="gvEventos_SelectedIndexChanged">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="id" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Título" DataField="nombre" ItemStyle-Wrap="true" ItemStyle-Width="300" />
                                                        <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="text-left" ItemStyle-Wrap="true" ItemStyle-Width="400">
                                                            <ItemTemplate>
                                                                <%#((string)Eval("descripcion")).Replace("\n", "<br/>") %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Soporte" DataField="soporte" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Apoyo" DataField="apoyo" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Lugar" DataField="lugar" ItemStyle-Wrap="true" ItemStyle-Width="250"/>
                                                        <asp:BoundField HeaderText="Fecha" DataField="fecha_realizacion" DataFormatString="{0:D}" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Hora Inicial" DataField="hora_inicial" DataFormatString="{0:t}" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Hora Final" DataField="hora_final" DataFormatString="{0:t}" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Acomodo" DataField="acomodo" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Asistencia" DataField="asistencia" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Tipo" DataField="tipo" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Fecha de solicitud" DataField="fecha_solicitud" DataFormatString="{0:D}" ItemStyle-Wrap="false"/>
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnCancelar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnCerrar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnGrabarAsignacion" EventName="Click" /> 
                                                <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="tabAbierta" EventName="Click"/> 
                                                <asp:AsyncPostBackTrigger ControlID="tabEnProceso" EventName="Click"/>
                                                <asp:AsyncPostBackTrigger ControlID="tabCerrada" EventName="Click"/>     
                                                <asp:AsyncPostBackTrigger ControlID="tabCancelada" EventName="Click"/>   
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="cerrada" CssClass="tab-pane fade">
                                    <asp:Panel runat="server" ID="Panel2" CssClass="contenedorTablaSolicitudes" ScrollBars="Auto" Height="340" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpGvEventosCerrados" UpdateMode="Conditional" >
                                            <ContentTemplate>
                                                <asp:GridView runat="server" OnRowDataBound="gvEventos_Cerrados_RowDataBound" OnRowCreated="gvEventos_RowCreated" ID="gvEventos_Cerrados" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" Width="2300"  DataKeyNames="id" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="gvEventos_SelectedIndexChanged">
                                                    <HeaderStyle Font-Bold="True" CssClass="DataGridFixedHeader" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="id" ItemStyle-Wrap="false" />
                                                        <asp:TemplateField HeaderText="Encuesta" ItemStyle-CssClass="text-center" ItemStyle-Wrap="false">
                                                            <ItemTemplate>
                                                                         <asp:ImageButton runat="server" ID="btnEncuesta" OnClick="btnEncuesta_Click" />                                                        
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Título" DataField="nombre" ItemStyle-Wrap="true" ItemStyle-Width="300"/>
                                                        <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="text-left" ItemStyle-Wrap="true" ItemStyle-Width="400">
                                                            <ItemTemplate>
                                                                <%#((string)Eval("descripcion")).Replace("\n", "<br/>") %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Soporte" DataField="soporte" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Apoyo" DataField="apoyo" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Lugar" DataField="lugar" ItemStyle-Wrap="true" ItemStyle-Width="250"/>
                                                        <asp:BoundField HeaderText="Fecha" DataField="fecha_realizacion" DataFormatString="{0:D}" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Hora Inicial" DataField="hora_inicial" DataFormatString="{0:t}" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Hora Final" DataField="hora_final" DataFormatString="{0:t}" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Acomodo" DataField="acomodo" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Asistencia" DataField="asistencia" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Tipo" DataField="tipo" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Fecha de solicitud" DataField="fecha_solicitud" DataFormatString="{0:D}" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Fecha de cierre" DataField="fecha_cierre" DataFormatString="{0:D}" ItemStyle-Wrap="false"/>
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="tabAbierta" EventName="Click"/> 
                                                <asp:AsyncPostBackTrigger ControlID="tabEnProceso" EventName="Click"/>  
                                                <asp:AsyncPostBackTrigger ControlID="tabCerrada" EventName="Click"/>    
                                                <asp:AsyncPostBackTrigger ControlID="tabCancelada" EventName="Click"/>  
                                                <asp:AsyncPostBackTrigger ControlID="btnGrabarEncuesta" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="cancelada" CssClass="tab-pane fade">
                                    <asp:Panel runat="server" ID="Panel3" CssClass="contenedorTablaSolicitudes" ScrollBars="Auto" Height="340" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel4" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView runat="server" OnRowCreated="gvEventos_RowCreated" ID="gvEventos_Cancelados" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" DataKeyNames="id" Width="2000" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="gvEventos_SelectedIndexChanged">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                     <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="id" ItemStyle-Wrap="false"  />
                                                        <asp:BoundField HeaderText="Título" DataField="nombre" ItemStyle-Wrap="true" ItemStyle-Width="300" />
                                                        <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="text-left" ItemStyle-Wrap="true" ItemStyle-Width="400">
                                                            <ItemTemplate>
                                                                <%#((string)Eval("descripcion")).Replace("\n", "<br/>") %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Lugar" DataField="lugar" ItemStyle-Wrap="true" ItemStyle-Width="250" />
                                                        <asp:BoundField HeaderText="Acomodo" DataField="acomodo" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Tipo" DataField="tipo" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Fecha de inicio" DataField="fecha_realizacion" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Hora Inicial" DataField="hora_inicial" ItemStyle-Wrap="false"/>
                                                        <asp:BoundField HeaderText="Hora Final" DataField="hora_final" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Fecha de solicitud" DataField="fecha_solicitud" DataFormatString="{0:D}" ItemStyle-Wrap="false"/>
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="tabAbierta" EventName="Click"/> 
                                                <asp:AsyncPostBackTrigger ControlID="tabCerrada" EventName="Click"/>     
                                                <asp:AsyncPostBackTrigger ControlID="tabEnProceso" EventName="Click"/>  
                                                 <asp:AsyncPostBackTrigger ControlID="tabCancelada" EventName="Click"/> 
                                            </Triggers>
                                        </asp:UpdatePanel>                                         
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>
                    </asp:Panel>              
            </form>
        </asp:Panel>
    </asp:Panel>
    <script type="text/javascript">
        function activaTab(index) {
            $('#myTab li:eq(' + index + ') a').tab('show'); // Select third tab (0-indexed)   
            __doPostBack('tabAbierta', index);
        }
    </script>
</body>
</html>
