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
                                            <asp:TextBox runat="server" ID="txtFiltro" MaxLength="40" placeholder="Buscar" CssClass="form-control" />
                                            <span class="input-group-btn">
                                                <asp:Button runat="server" ID="btnFiltrar" Text="Fitrar" CssClass="btn btn-default" />
                                            </span>
                                        </asp:Panel>
                                    </asp:Panel>
                                    <asp:Panel runat="server" CssClass="col-lg-5">
                                        <asp:Panel runat="server" CssClass="input-group">
                                            <span class="input-group-addon">Tipo</span>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbTipoFiltro" DataTextField="nomTipoIncidente" DataValueField="idTipoIncidente" OnSelectedIndexChanged="cbTipoFiltro_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList>
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
                            <asp:UpdatePanel runat="server" ID="updateAcciones" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel runat="server" CssClass="form-group">
                                        <asp:Panel runat="server" CssClass="row">
                                            <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                <asp:LinkButton ID="btnNuevo" Style="margin-bottom: -8%" runat="server" OnClick="btnNuevo_Click" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="btnCancelar" Style="margin-bottom: -8%" runat="server" OnClick="btnCancelar_Click" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-remove"></span>
                             Cancelar
                                                </asp:LinkButton>
                                            </asp:Panel>
                                        </asp:Panel>
                                    </asp:Panel>
                                    <asp:Panel runat="server" CssClass="form-group">
                                        <asp:Panel runat="server" CssClass="row" Style="margin-top: 2%">
                                            <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                <asp:LinkButton ID="btnCerrar" Style="margin-bottom: -8%" runat="server" OnClick="btnCerrar_Click" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-lock"></span>
                             Cerrar
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="btnAsignar" Style="margin-bottom: -8%" runat="server" OnClick="btnAsignar_Click" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-user"></span>
                             soporte
                                                </asp:LinkButton>
                                            </asp:Panel>
                                            <asp:HiddenField runat="server" ID="idIncidenteSeleccionado" />
                                            <asp:HiddenField runat="server" ID="tabItemSeleccionado" Value="0" />
                                        </asp:Panel>
                                    </asp:Panel>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tabAbierta" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="tabEnProceso" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="tabCerrada" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="tabCancelada" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="gvIncidentes_Abiertos" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="gvIncidentes_EnProceso" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="gvIncidentes_Cerrados" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="gvIncidentes_Cancelados" EventName="SelectedIndexChanged" />
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
                                            <asp:UpdatePanel runat="server" ID="upModalNuevo" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="row">
                                                        <div class="col-lg-1"></div>
                                                        <div class="col-lg-10">
                                                            <asp:Panel runat="server" CssClass="form-group" ID="panelSolcitante" Visible="false">
                                                                <asp:Label runat="server" Text="Solicitante" Font-Bold="true"></asp:Label>
                                                                <asp:DropDownList runat="server" ID="cbSolicitante" DataTextField="nomCompleto" DataValueField="idUsuario" CssClass="form-control"></asp:DropDownList>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Text="Descripción" Font-Bold="true"></asp:Label>
                                                                <asp:TextBox runat="server" ID="txtDescripcion" MaxLength="200" placeholder="Describa su incidente de tal forma que podamos ayudarle." Style="resize: none" Height="125" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                                            </asp:Panel>
                                                        </div>
                                                        <div class="col-lg-1"></div>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-footer">
                                            <asp:UpdatePanel runat="server" ID="UpdateGrabarNuevo" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                    <asp:Button runat="server" ID="btnGuardar" CssClass="btn btn-primary" Text="Grabar" OnClick="btnGuardar_Click" />
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
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                            <asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="Label1" Text="Asignar soporte a incidente" />
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-body">
                                            <asp:UpdatePanel runat="server" ID="UpdateModalAsignar" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Panel runat="server" CssClass="row">
                                                        <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                        <asp:Panel runat="server" CssClass="col-lg-10">
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Panel runat="server" CssClass="row">
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <div class="form-group">
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Tipo" />
                                                                        <asp:DropDownList runat="server" ID="cbTipoIncidente" DataValueField="idTipoIncidente" DataTextField="nomTipoIncidente" CssClass="form-control" />
                                                                        </div>
                                                                    </asp:Panel>
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <div class="form-group">
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Prioridad" />
                                                                        <asp:DropDownList runat="server" ID="cbPrioridad" CssClass="form-control">
                                                                            <asp:ListItem Text="Alta"></asp:ListItem>
                                                                            <asp:ListItem Text="Media"></asp:ListItem>
                                                                            <asp:ListItem Text="Normal"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        </div>
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
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnAsignar" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-footer">
                                            <asp:UpdatePanel runat="server" ID="UpdateGrabarAsignacion" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                    <asp:Button runat="server" ID="BtnGrabarAsignacion" CssClass="btn btn-primary" Text="Grabar" OnClick="BtnGrabarAsignacion_Click" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
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
                                            <div class="row">
                                                <div class="col-lg-1"></div>
                                                <div class="col-lg-10">
                                                    <asp:Panel runat="server" CssClass="form-group">
                                                        <asp:Label runat="server" Text="Acciones" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox runat="server" ID="txtAcciones" MaxLength="200" placeholder="Describa las acciones que realizó para intentar solucionar el incidente." Height="100" Style="resize: none" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                                    </asp:Panel>
                                                    <asp:Panel runat="server" CssClass="form-group">
                                                        <asp:Label runat="server" Text="Solución" Font-Bold="true" />
                                                        <asp:TextBox runat="server" ID="txtSolucion" MaxLength="200" placeholder="Describa lo que realizó para solucionar el incidente" Height="100" Style="resize: none" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                                    </asp:Panel>
                                                </div>
                                                <div class="col-lg-1"></div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-footer">
                                            <asp:UpdatePanel runat="server" ID="UpdateGrabarCerrar" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                    <asp:Button runat="server" ID="btnGrabarCerrar" CssClass="btn btn-primary" Text="Grabar" OnClick="btnGrabarCerrar_Click" />
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
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button><asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="Label3" Text="Asignar recursos a eventos" />
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
                                                                <asp:Panel runat="server" ScrollBars="Auto" Height="220">
                                                                    <asp:UpdatePanel runat="server" ID="updateEncuestas" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:GridView runat="server" ID="gvEncuestas" AutoGenerateColumns="false" DataKeyNames="idPregunta" CssClass="table table-bordered">
                                                                                <Columns>
                                                                                    <asp:BoundField HeaderText="#" DataField="numPregunta" />
                                                                                    <asp:BoundField HeaderText="Aspecto" DataField="txtPregunta" />
                                                                                    <asp:TemplateField HeaderText="Respuestas">
                                                                                        <ItemTemplate>
                                                                                            <asp:DropDownList runat="server" ID="cbRespuesta" OnSelectedIndexChanged="cbRespuesta_SelectedIndexChanged" CssClass="form-control" AutoPostBack="true">
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
                                                                                    <asp:BoundField HeaderText="Respuestas" DataField="valorRespuesta" />
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <table class="table table-bordered">
                                                                    <td style="width: 35%; height: 163px">
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
                                                                        <asp:TextBox runat="server" ID="txtObEncuestas" MaxLength="200" CssClass="form-control" placeholder="Por favor escriba una sugerencia o comentario sobre el servicio otorgado" TextMode="MultiLine" Style="height: 95%; resize: none"></asp:TextBox>
                                                                    </td>
                                                                </table>
                                                            </asp:Panel>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="col-lg-1">
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="gvIncidentes_Cerrados" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-footer">
                                            <asp:UpdatePanel runat="server" ID="upGrabarEncuesta" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                    <asp:LinkButton runat="server" ID="btnGrabarEncuesta" CssClass="btn btn-primary" Text="Grabar" OnClick="btnGrabarEncuesta_Click" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="gvIncidentes_Cerrados" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel runat="server" CssClass="modal fade" ID="ModalNuevoCompleto" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <asp:Panel runat="server" CssClass="modal-dialog modal-md">
                                    <asp:Panel runat="server" CssClass="modal-content">
                                        <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                            <asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="Label4" Text="Registrar incidente completo" />
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-body">
                                            <asp:UpdatePanel runat="server" ID="upIncidenteCompleto" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="row">
                                                        <div class="col-lg-1"></div>
                                                        <div class="col-lg-10">
                                                            <div class="form-group">
                                                                <asp:Label runat="server" Text="Solicitante" Font-Bold="true"></asp:Label>
                                                                <asp:DropDownList runat="server" ID="cbSolicitante2" DataTextField="nomCompleto" DataValueField="idUsuario" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                            <div class="form-group">
                                                                <asp:Label runat="server" Text="Descripción" Font-Bold="true"></asp:Label>
                                                                <asp:TextBox runat="server" ID="txtDescripcion2" MaxLength="200" placeholder="Describa su incidente de tal forma que podamos ayudarle." Style="resize: none" Height="125" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group">
                                                                <asp:Label runat="server" Text="Fecha y hora inicial del incidente" Font-Bold="true">
                                                                </asp:Label>
                                                                <div class="row">
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon">Fecha</span>
                                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtFechaInicio" TextMode="Date"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon">Hora</span>
                                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtHoraInicio" TextMode="Time"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <asp:Label runat="server" Text="Fecha y hora final del incidente" Font-Bold="true">
                                                                </asp:Label>
                                                                <div class="row">
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon">Fecha</span>
                                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtFechaFinal" TextMode="Date"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon">Hora</span>
                                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtHoraFinal" TextMode="Time"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form*group">
                                                                <div class="row">
                                                                    <div class="col-lg-6">
                                                                        <div class="form-group">
                                                                            <asp:Label runat="server" Font-Bold="true" Text="Prioridad" />
                                                                            <asp:DropDownList runat="server" ID="cbPrioridad2" CssClass="form-control">
                                                                                <asp:ListItem Text="Alta"></asp:ListItem>
                                                                                <asp:ListItem Text="Media"></asp:ListItem>
                                                                                <asp:ListItem Text="Normal"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="form-group">
                                                                            <asp:Label runat="server" Font-Bold="true" Text="Tipo" />
                                                                            <asp:DropDownList runat="server" ID="cbTipoIncidente2" DataValueField="idTipoIncidente" DataTextField="nomTipoIncidente" CssClass="form-control" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <asp:Label runat="server" Text="Soporte" Font-Bold="true"></asp:Label>
                                                                <asp:DropDownList runat="server" ID="cbSoporte2" DataTextField="nomCompleto" DataValueField="idUsuario" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                            <div class="form-group">
                                                                <asp:Label runat="server" Text="Seguimiento" Font-Bold="true"></asp:Label>
                                                                <asp:DropDownList runat="server" ID="cbSeguimiento2" DataTextField="nomCompleto" DataValueField="idUsuario" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Text="Acciones" Font-Bold="true"></asp:Label>
                                                                <asp:TextBox runat="server" ID="txtAcciones2" MaxLength="200" placeholder="Describa las acciones que realizó para intentar solucionar el incidente." Height="100" Style="resize: none" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Text="Solución" Font-Bold="true" />
                                                                <asp:TextBox runat="server" ID="txtSolucion2" MaxLength="200" placeholder="Describa lo que realizó para solucionar el incidente" Height="100" Style="resize: none" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                                            </asp:Panel>
                                                        </div>
                                                        <div class="col-lg-1"></div>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnNuevo" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-footer">
                                            <asp:UpdatePanel runat="server" ID="updateGrabarCompleto" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                    <asp:Button runat="server" ID="btnGrabarCompleto" CssClass="btn btn-primary" Text="Grabar" OnClick="btnGrabarCompleto_Click" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
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
                                    <asp:LinkButton runat="server" ID="tabCancelada" OnClientClick="activaTab('3')" href="#cancelada" role="tab">Cancelada</asp:LinkButton></li>
                            </ul>
                            <asp:Panel runat="server" ID="myTabContent" CssClass="tab-content">
                                <asp:Panel runat="server" ID="abierta" CssClass="tab-pane fade in active">
                                    <asp:Panel runat="server" ID="contenedorTabla1" ScrollBars="Auto" Height="300" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="update1" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ToolTip="Asigne el soporte a los incidentes" runat="server" OnRowCreated="gvIncidentes_RowCreated" ID="gvIncidentes_Abiertos" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" DataKeyNames="numIncidente" CellPadding="4" OnSelectedIndexChanged="gvIncidentes_SelectedIndexChanged" GridLines="Horizontal">
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
                                                <asp:AsyncPostBackTrigger ControlID="btnCancelar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="BtnGrabarAsignacion" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="tabAbierta" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="tabEnProceso" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="tabCerrada" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="tabCancelada" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="cbTipoFiltro" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="enProceso" CssClass="tab-pane fade">
                                    <asp:Panel runat="server" ID="Panel1" ScrollBars="Auto" Height="300" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ToolTip="Solucione los incidentes" runat="server" OnRowCreated="gvIncidentes_RowCreated" ID="gvIncidentes_EnProceso" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" OnRowDataBound="gvIncidentes_EnProceso_RowDataBound" DataKeyNames="numIncidente" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="gvIncidentes_SelectedIndexChanged">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="numIncidente" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Tipo" DataField="tipo" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Descripción" DataField="descripcion" ItemStyle-Width="400" ItemStyle-Wrap="true" />
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" ItemStyle-Wrap="false" />
                                                        <asp:TemplateField HeaderText="Prioridad" ItemStyle-CssClass="text-center">
                                                            <ItemTemplate>
                                                                <asp:Image runat="server" ID="imgPrioridad" Height="48" Width="48" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Soporte" DataField="soporte" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Apoyo" DataField="seguimiento" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Fecha solicitud" DataField="fecha_Sol" DataFormatString="{0:D}" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Hora inicial" DataField="horaIn" DataFormatString="{0:t}" ItemStyle-Wrap="false" />
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnGrabarAsignacion" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnCancelar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnGrabarCerrar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="tabAbierta" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="tabEnProceso" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="tabCerrada" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="tabCancelada" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="cbTipoFiltro" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="cerrada" CssClass="tab-pane fade">
                                    <asp:Panel runat="server" ID="Panel2" ScrollBars="Auto" Height="300" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpIncidentesCerrados" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView runat="server" OnRowCreated="gvIncidentes_RowCreated" ID="gvIncidentes_Cerrados" OnRowDataBound="gvIncidentes_Cerrados_RowDataBound" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" DataKeyNames="numIncidente" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="gvIncidentes_SelectedIndexChanged">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" Wrap="true" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="numIncidente" ItemStyle-Wrap="false" />
                                                        <asp:TemplateField HeaderText="Encuesta" ItemStyle-CssClass="text-center">
                                                            <ItemTemplate>
                                                                <asp:ImageButton runat="server" ID="btnEncuesta" OnClick="btnEncuesta_Click" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Tipo" DataField="tipo" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Descripción" DataField="descripcion" ItemStyle-Wrap="true" />
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" ItemStyle-Wrap="false" />
                                                        <asp:TemplateField HeaderText="Prioridad" ItemStyle-CssClass="text-center">
                                                            <ItemTemplate>
                                                                <asp:Image runat="server" ID="imgPrioridad" Height="48" Width="48" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
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
                                                <asp:AsyncPostBackTrigger ControlID="btnGrabarCerrar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="tabAbierta" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="tabEnProceso" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="tabCerrada" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="tabCancelada" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnGrabarEncuesta" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="cbTipoFiltro" />
                                                <asp:AsyncPostBackTrigger ControlID="btnGrabarCompleto" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="cancelada" CssClass="tab-pane fade">
                                    <asp:Panel runat="server" ID="Panel3" ScrollBars="Auto" Height="300" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ToolTip="Solucione los incidentes" runat="server" OnRowCreated="gvIncidentes_RowCreated" ID="gvIncidentes_Cancelados" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" DataKeyNames="numIncidente" ShowHeaderWhenEmpty="true" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="gvIncidentes_SelectedIndexChanged">
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
                                                <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="tabAbierta" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="tabEnProceso" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="tabCerrada" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="tabCancelada" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="cbTipoFiltro" />
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
    <script type="text/javascript">
        function activaTab(index) {
            $('#myTab li:eq(' + index + ') a').tab('show'); // Select third tab (0-indexed)   
            __doPostBack('tabAbierta', index);
        }
     </script>
</body>
</html>
