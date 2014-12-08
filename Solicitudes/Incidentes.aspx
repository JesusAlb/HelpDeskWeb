<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Incidentes.aspx.cs" Inherits="HelpDeskWeb.Solicitudes.Incidentes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Centro de incidentes</title>
    <link rel="icon" type="image/icon" href="../Imagenes/imca.ico" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/helpdesk-template.css" rel="stylesheet" />
     <!--Inicio de Alertify -->
    <link href="../css/alertify.css" rel="stylesheet" />
    <link href="../css/alertify-bootstrap-3.css" rel="stylesheet" />
    <script src="../js/alertify.js" type="text/javascript"></script>
    <!--Fin de Alertify-->
    <link rel="stylesheet" href="../css/themes/bootstrap.css"/>  
    <script src="../js/jquery-2.1.1.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/jquery.mask.min.js" type="text/javascript"></script>
     <script type="text/javascript" lang="js">
         $(function () {
             $("#<%=txtFiltro.ClientID%>").keyup(function () {
                __doPostBack("txtFiltro", $("#<%=txtFiltro.ClientID%>").val());
            })
         });
    </script>
    <script src="../js/validador.js" type="text/javascript"></script>
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
                                <asp:HyperLink runat="server" NavigateUrl="~/perfil.aspx">Perfil</asp:HyperLink></li><li class="divider"></li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="~/logout.aspx">Cerrar sesión</asp:HyperLink></li></ul></li><li>
                        <asp:HyperLink runat="server" NavigateUrl="~/principal.aspx">Inicio</asp:HyperLink></li></ul></div></div></asp:Panel><asp:Panel runat="server" CssClass="container">
        <asp:Panel runat="server" CssClass="box">
            <form runat="server" role="form">
                <asp:ScriptManager runat="server" ID="script" EnablePartialRendering="true"></asp:ScriptManager>
                <asp:Panel runat="server" CssClass="row panel-titulo">
                    Centro de atención a incidencias </asp:Panel><asp:Panel runat="server" CssClass="row">
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Panel runat="server" CssClass="col-lg-8">
                            <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                            <asp:Panel runat="server" CssClass="col-lg-11">
                                <asp:Panel runat="server" CssClass="row">
                                    <asp:Panel runat="server" CssClass="col-lg-7">
                                        <asp:Panel runat="server" CssClass="form-group">
                                            <asp:TextBox runat="server" ID="txtFiltro" MaxLength="40" placeholder="Buscar" CssClass="form-control" />
                                        </asp:Panel>
                                    </asp:Panel>
                                    <asp:Panel runat="server" CssClass="col-lg-5">
                                        <div class="form-group">
                                        <asp:Panel runat="server" CssClass="input-group">
                                            <span class="input-group-addon">Tipo</span> <asp:DropDownList runat="server" CssClass="form-control" ID="cbTipoFiltro" DataTextField="nombre" DataValueField="id" OnSelectedIndexChanged="cbTipoFiltro_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList>
                                        </asp:Panel>
                                        </div>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" CssClass="row">
                                    <asp:Panel runat="server" CssClass="col-lg-12">
                                        <div class="form-group">
                                            <asp:Panel runat="server" CssClass="input-group">
                                                <span class="input-group-addon">Filtrar por fecha</span> <asp:TextBox runat="server" TextMode="Date" ID="filtroFechaInicial" CssClass="form-control"></asp:TextBox><span class="input-group-addon">a</span> <asp:TextBox runat="server" TextMode="Date" ID="filtroFechaFinal" CssClass="form-control"></asp:TextBox></asp:Panel></div></asp:Panel></asp:Panel></asp:Panel></asp:Panel><asp:Panel runat="server" CssClass="col-lg-3">
                            <asp:UpdatePanel runat="server" ID="updateAcciones" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel runat="server" CssClass="form-group">
                                        <asp:Panel runat="server" CssClass="row">
                                            <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                <asp:LinkButton ID="btnNuevo" Style="margin-bottom: -8%" runat="server" OnClick="btnNuevo_Click" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                                </asp:LinkButton><asp:LinkButton ID="btnCancelar" Style="margin-bottom: -8%" runat="server" OnClick="btnCancelar_Click" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-remove"></span>
                             Cancelar
                                                </asp:LinkButton></asp:Panel></asp:Panel></asp:Panel><asp:Panel runat="server" CssClass="form-group">
                                        <asp:Panel runat="server" CssClass="row" Style="margin-top: 2%">
                                            <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                <asp:LinkButton ID="btnCerrar" Style="margin-bottom: -8%" runat="server" OnClick="btnCerrar_Click" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-lock"></span>
                             Cerrar
                                                </asp:LinkButton><asp:LinkButton ID="btnAsignar" Style="margin-bottom: -8%" runat="server" OnClick="btnAsignar_Click" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-user"></span>
                             soporte
                                                </asp:LinkButton></asp:Panel><asp:HiddenField runat="server" ID="idIncidenteSeleccionado" />
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
                                    <asp:Panel runat="server" CssClass="modal-content" DefaultButton="btnGuardar">
                                        <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button><asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="lbelTituloModal" Text="Alta de incidente" />
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-body">
                                            <asp:UpdatePanel runat="server" ID="upModalNuevo" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="row">
                                                        <div class="col-lg-1"></div>
                                                        <div class="col-lg-10">
                                                            <asp:Panel runat="server" CssClass="form-group" ID="panelSolcitante" Visible="false">
                                                                <asp:Label runat="server" Text="Solicitante" Font-Bold="true"></asp:Label><asp:DropDownList runat="server" ID="cbSolicitante" DataTextField="nom_completo" DataValueField="id" CssClass="form-control"></asp:DropDownList>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Text="Descripción" Font-Bold="true"></asp:Label><asp:TextBox runat="server" ID="txtDescripcion" onkeypress="if (this.value.length > 249) { alertify.error('Máximo de 250 caractéres');  return false; }" onpaste="return false;" placeholder="Describa su incidente de tal forma que podamos ayudarle." Style="resize: none" Height="125" TextMode="MultiLine" CssClass="form-control "></asp:TextBox></asp:Panel></div><div class="col-lg-1"></div>
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
                                    <asp:Panel runat="server" CssClass="modal-content" DefaultButton="BtnGrabarAsignacion">
                                        <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button><asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="Label1" Text="Asignar soporte a incidente" />
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
                                                                        <asp:DropDownList runat="server" ID="cbTipoIncidente" DataValueField="id" DataTextField="nombre" CssClass="form-control" />
                                                                        </div>
                                                                    </asp:Panel>
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <div class="form-group">
                                                                        <asp:Label runat="server" Font-Bold="true" Text="Prioridad" />
                                                                            <asp:DropDownList runat="server" ID="cbPrioridad" CssClass="form-control">
                                                                                <asp:ListItem Text="Alta" Value="2"></asp:ListItem>
                                                                                <asp:ListItem Text="Media" Value="1"></asp:ListItem>
                                                                                <asp:ListItem Text="Normal" Value="0"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Font-Bold="true" Text="Soporte"></asp:Label><asp:DropDownList runat="server" ID="cbSoporte" DataTextField="nom_completo" DataValueField="id" CssClass="form-control"></asp:DropDownList>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Font-Bold="true" Text="Seguimiento"></asp:Label><asp:DropDownList runat="server" ID="cbSeguimiento" DataTextField="nom_completo" DataValueField="id" CssClass="form-control"></asp:DropDownList>
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
                                    <asp:Panel runat="server" CssClass="modal-content" DefaultButton="btnGrabarCerrar">
                                        <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button><asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="Label2" Text="Cerrar incidente" />
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-body">
                                            <div class="row">
                                                <div class="col-lg-1"></div>
                                                <div class="col-lg-10">
                                                    <asp:Panel runat="server" CssClass="form-group">
                                                        <asp:Label runat="server" Text="Acciones" Font-Bold="true"></asp:Label><asp:TextBox runat="server" ID="txtAcciones" onpaste="return false;" onkeyup="keyUP(event.keyCode)" onkeypress="if (this.value.length > 249) { alertify.error('Máximo de 250 caractéres');  return false; }" onkeydown="return isDescription(event.keyCode);"  MaxLength="200" placeholder="Describa las acciones que realizó para intentar solucionar el incidente." Height="100" Style="resize: none" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></asp:Panel><asp:Panel runat="server" CssClass="form-group">
                                                        <asp:Label runat="server" Text="Solución" Font-Bold="true" />
                                                        <asp:TextBox runat="server" ID="txtSolucion" onkeypress="if (this.value.length > 249) { alertify.error('Máximo de 250 caractéres');  return false; }" onpaste="return false;" placeholder="Describa lo que realizó para solucionar el incidente" Height="100" Style="resize: none" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></asp:Panel></div><div class="col-lg-1"></div>
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
                                    <asp:Panel runat="server" CssClass="modal-content" DefaultButton="btnGrabarEncuesta">
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
                                                                    <span class="input-group-addon">Solicitante</span> <asp:TextBox runat="server" ID="txtSolicitante" Enabled="false" CssClass="form-control"></asp:TextBox></asp:Panel></asp:Panel><asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Text="Califique el servicio otorgado a través de las siguientes preguntas"></asp:Label><asp:HiddenField runat="server" ID="idCalidad" />
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Panel runat="server" ScrollBars="Auto" Height="220">
                                                                    <asp:UpdatePanel runat="server" ID="updateEncuestas" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:GridView runat="server" ID="gvEncuestas" AutoGenerateColumns="false" DataKeyNames="id" CssClass="table table-bordered">
                                                                                <Columns>
                                                                                    <asp:BoundField HeaderText="#" DataField="numero" />
                                                                                    <asp:BoundField HeaderText="Aspecto" DataField="pregunta" />
                                                                                    <asp:TemplateField HeaderText="Respuestas">
                                                                                        <ItemTemplate>
                                                                                            <asp:DropDownList runat="server" ID="cbRespuesta" OnSelectedIndexChanged="cbRespuesta_SelectedIndexChanged" CssClass="form-control" AutoPostBack="true">
                                                                                                <asp:ListItem Text="1"></asp:ListItem><asp:ListItem Text="2"></asp:ListItem><asp:ListItem Text="3"></asp:ListItem><asp:ListItem Text="4"></asp:ListItem><asp:ListItem Text="5"></asp:ListItem><asp:ListItem Text="6"></asp:ListItem><asp:ListItem Text="7"></asp:ListItem><asp:ListItem Text="8"></asp:ListItem><asp:ListItem Text="9"></asp:ListItem><asp:ListItem Text="10"></asp:ListItem></asp:DropDownList></ItemTemplate></asp:TemplateField><asp:BoundField HeaderText="Respuestas" DataField="valor" />
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <table class="table table-bordered">
                                                                    <tr><td style="width: 35%; height: 163px"><asp:UpdatePanel ID="upResultado" runat="server" UpdateMode="Conditional"><ContentTemplate><asp:Image ID="imgSatisfaccion" runat="server" ImageUrl="~/Imagenes/iconos/nivel0.png" /><div class="input-group"><span class="input-group-addon">Promedio</span> <asp:TextBox ID="txtPromedio" runat="server" CssClass="form-control" Enabled="false" MaxLength="3" Text="1"></asp:TextBox></div></ContentTemplate><Triggers><asp:AsyncPostBackTrigger ControlID="gvEncuestas" /></Triggers></asp:UpdatePanel></td><td><asp:Label runat="server" Font-Bold="true" Text="Observaciones"></asp:Label><asp:TextBox ID="txtObEncuestas" runat="server" onpaste="return false;" onkeypress="if (this.value.length > 250) { alertify.error('Máximo de 250 caractéres');  return false; }" CssClass="form-control" MaxLength="200" placeholder="Por favor escriba una sugerencia o comentario sobre el servicio otorgado" Style="height: 95%; resize: none" TextMode="MultiLine"></asp:TextBox></td></tr></table></asp:Panel></asp:Panel><asp:Panel runat="server" CssClass="col-lg-1">
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
                                    <asp:Panel runat="server" CssClass="modal-content" DefaultButton="btnGrabarCompleto">
                                        <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button><asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="Label4" Text="Registrar incidente completo" />
                                        </asp:Panel>
                                        <asp:Panel runat="server" CssClass="modal-body">
                                            <asp:UpdatePanel runat="server" ID="upIncidenteCompleto" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="row">
                                                        <div class="col-lg-1"></div>
                                                        <div class="col-lg-10">
                                                            <div class="form-group">
                                                                <asp:Label runat="server" Text="Solicitante" Font-Bold="true"></asp:Label><asp:DropDownList runat="server" ID="cbSolicitante2" DataTextField="nom_completo" DataValueField="id" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                            <div class="form-group">
                                                                <asp:Label runat="server" Text="Descripción" Font-Bold="true"></asp:Label><asp:TextBox runat="server" ID="txtDescripcion2" onpaste="return false;" onkeypress="if (this.value.length > 249) { alertify.error('Máximo de 250 caractéres');  return false; }" placeholder="Describa su incidente de tal forma que podamos ayudarle." Style="resize: none" Height="125" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group">
                                                                <asp:Label runat="server" Text="Fecha y hora inicial del incidente" Font-Bold="true">
                                                                </asp:Label><div class="row">
                                                                    <div class="col-lg-6">
                                                                        <div class="form-group">
                                                                            <div class="input-group">
                                                                                <span class="input-group-addon">Fecha</span>
                                                                                <asp:TextBox runat="server" CssClass="form-control" onpaste="return false;" ID="txtFechaInicio" TextMode="Date"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon">Hora</span>
                                                                            <asp:TextBox runat="server" CssClass="form-control" onpaste="return false;" ID="txtHoraInicio" TextMode="Time"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <asp:Label runat="server" Text="Fecha y hora final del incidente" Font-Bold="true">
                                                                </asp:Label><div class="row">
                                                                    <div class="col-lg-6">
                                                                        <div class="form-group">
                                                                            <div class="input-group">
                                                                                <span class="input-group-addon">Fecha</span>
                                                                                <asp:TextBox runat="server" CssClass="form-control" onpaste="return false;" ID="txtFechaFinal" TextMode="Date"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon">Hora</span>
                                                                            <asp:TextBox runat="server" CssClass="form-control" onpaste="return false;" ID="txtHoraFinal" TextMode="Time"></asp:TextBox>
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
                                                                                <asp:ListItem Text="Alta" Value="2"></asp:ListItem>
                                                                                <asp:ListItem Text="Media" Value="1"></asp:ListItem>
                                                                                <asp:ListItem Text="Normal" Value="0"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="form-group">
                                                                            <asp:Label runat="server" Font-Bold="true" Text="Tipo" />
                                                                            <asp:DropDownList runat="server" ID="cbTipoIncidente2" DataValueField="id" DataTextField="nombre" CssClass="form-control" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <asp:Label runat="server" Text="Soporte" Font-Bold="true"></asp:Label><asp:DropDownList runat="server" ID="cbSoporte2" DataTextField="nom_completo" DataValueField="id" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                            <div class="form-group">
                                                                <asp:Label runat="server" Text="Seguimiento" Font-Bold="true"></asp:Label><asp:DropDownList runat="server" ID="cbSeguimiento2" DataTextField="nom_completo" DataValueField="id" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Text="Acciones" Font-Bold="true"></asp:Label><asp:TextBox runat="server" ID="txtAcciones2" onpaste="return false;" onkeypress="if (this.value.length > 249) { alertify.error('Máximo de 250 caractéres');  return false; }" placeholder="Describa las acciones que realizó para intentar solucionar el incidente." Height="100" Style="resize: none" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></asp:Panel><asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Label runat="server" Text="Solución" Font-Bold="true" />
                                                                <asp:TextBox runat="server" ID="txtSolucion2" onpaste="return false;" onkeypress="if (this.value.length > 249) { alertify.error('Máximo de 250 caractéres');  return false; }"  placeholder="Describa lo que realizó para solucionar el incidente" Height="100" Style="resize: none" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></asp:Panel></div><div class="col-lg-1"></div>
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
                            <ul id="myTab" class="nav nav-tabs" role="tablist">
                                <li class="active">
                                    <asp:LinkButton runat="server" ID="tabAbierta" OnClientClick="activaTab('0')" href="#abierta" role="tab">Abierta</asp:LinkButton></li><li>
                                    <asp:LinkButton runat="server" ID="tabEnProceso" OnClientClick="activaTab('1')" href="#enProceso" role="tab">En proceso</asp:LinkButton></li><li>
                                    <asp:LinkButton runat="server" ID="tabCerrada" OnClientClick="activaTab('2')" href="#cerrada" role="tab">Cerrada</asp:LinkButton></li><li>
                                    <asp:LinkButton runat="server" ID="tabCancelada" OnClientClick="activaTab('3')" href="#cancelada" role="tab">Cancelada</asp:LinkButton></li></ul><asp:Panel runat="server" ID="myTabContent" CssClass="tab-content">
                                <asp:Panel runat="server" ID="abierta" CssClass="tab-pane fade in active">
                                    <asp:Panel runat="server" ID="contenedorTabla1" CssClass="contenedorTablaSolicitudes" ScrollBars="auto" Height="340" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="update1" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ToolTip="Asigne el soporte a los incidentes" runat="server" OnRowCreated="gvIncidentes_RowCreated" ID="gvIncidentes_Abiertos"  AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" DataKeyNames="id" CellPadding="4" OnSelectedIndexChanged="gvIncidentes_SelectedIndexChanged" GridLines="Horizontal">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="id" ItemStyle-Wrap="false" />
                                                        <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="text-left" ItemStyle-Wrap="true" ItemStyle-Width="500">
                                                            <ItemTemplate>
                                                                <%#((string)Eval("descripcion")).Replace("\n", "<br/>") %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Fecha solicitud" DataField="fecha_solicitud" DataFormatString="{0:D}" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Hora inicial" DataField="hora_inicial" DataFormatString="{0:t}" ItemStyle-Wrap="false" />
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
                                    <asp:Panel runat="server" ID="Panel1" CssClass="contenedorTablaSolicitudes" ScrollBars="Auto" Height="340" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ToolTip="Solucione los incidentes" runat="server" OnRowCreated="gvIncidentes_RowCreated" ID="gvIncidentes_EnProceso" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" OnRowDataBound="gvIncidentes_EnProceso_RowDataBound" DataKeyNames="id" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="gvIncidentes_SelectedIndexChanged">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="id" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Tipo" DataField="tipo" ItemStyle-Wrap="false" />
                                                        <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="text-left" ItemStyle-Wrap="true" ItemStyle-Width="400">
                                                            <ItemTemplate>
                                                                <%#((string)Eval("descripcion")).Replace("\n", "<br/>") %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" ItemStyle-Wrap="false" />
                                                        <asp:TemplateField HeaderText="Prioridad" ItemStyle-CssClass="text-center">
                                                            <ItemTemplate>
                                                                <asp:Image runat="server" ID="imgPrioridad" Height="48" Width="48" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Soporte" DataField="soporte" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Seguimiento" DataField="apoyo" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Fecha solicitud" DataField="fecha_solicitud" DataFormatString="{0:D}" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Hora inicial" DataField="hora_inicial" DataFormatString="{0:t}" ItemStyle-Wrap="false" />
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnGrabarAsignacion" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnCancelar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnGrabarCerrar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="cbTipoFiltro" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="cerrada" CssClass="tab-pane fade">
                                    <asp:Panel runat="server" ID="Panel2" CssClass="contenedorTablaSolicitudes" ScrollBars="Auto" Height="340" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpIncidentesCerrados" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView runat="server" OnRowCreated="gvIncidentes_RowCreated" ID="gvIncidentes_Cerrados" OnRowDataBound="gvIncidentes_Cerrados_RowDataBound" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" Width="2200" DataKeyNames="id" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="gvIncidentes_SelectedIndexChanged">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="id" ItemStyle-Wrap="false" />
                                                        <asp:TemplateField HeaderText="Encuesta" ItemStyle-CssClass="text-center">
                                                            <ItemTemplate>
                                                                <asp:ImageButton runat="server" ID="btnEncuesta" OnClick="btnEncuesta_Click" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Tipo" DataField="tipo" ItemStyle-Wrap="false" />
                                                        <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="text-left" ItemStyle-Wrap="true" ItemStyle-Width="400">
                                                            <ItemTemplate>
                                                                <%#((string)Eval("descripcion")).Replace("\n", "<br/>") %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" ItemStyle-Wrap="false" />
                                                        <asp:TemplateField HeaderText="Prioridad" ItemStyle-CssClass="text-center" ItemStyle-Wrap="false">
                                                            <ItemTemplate>
                                                                <asp:Image runat="server" ID="imgPrioridad" Height="48" Width="48" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Soporte" DataField="soporte" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Seguimiento" DataField="apoyo" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Fecha solicitud" DataField="fecha_solicitud" DataFormatString="{0:D}" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Hora inicial" DataField="hora_inicial" DataFormatString="{0:t}" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Fecha cierre" DataField="fecha_cierre" DataFormatString="{0:D}" ItemStyle-Wrap="false" />
                                                        <asp:BoundField HeaderText="Hora final" DataField="hora_final" DataFormatString="{0:t}" ItemStyle-Wrap="false" />
                                                        <asp:TemplateField HeaderText="Acciones" ItemStyle-CssClass="text-left" ItemStyle-Wrap="true" ItemStyle-Width="400">
                                                            <ItemTemplate>
                                                                <%#((string)Eval("acciones")).Replace("\n", "<br/>") %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Solución" ItemStyle-CssClass="text-left" ItemStyle-Wrap="true" ItemStyle-Width="400">
                                                            <ItemTemplate>
                                                                <%#((string)Eval("solucion")).Replace("\n", "<br/>") %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
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
                                    <asp:Panel runat="server" ID="Panel3" CssClass="contenedorTablaSolicitudes" ScrollBars="Auto" Height="340" Style="margin-top: 1%">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ToolTip="Solucione los incidentes" runat="server" OnRowCreated="gvIncidentes_RowCreated" ID="gvIncidentes_Cancelados" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                    AlternatingRowStyle-BackColor="#e0e0e0" DataKeyNames="id" ShowHeaderWhenEmpty="true" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="gvIncidentes_SelectedIndexChanged">
                                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="#" DataField="id" />
                                                        <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="text-left" ItemStyle-Wrap="true" ItemStyle-Width="500">
                                                            <ItemTemplate>
                                                                <%#((string)Eval("descripcion")).Replace("\n", "<br/>") %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Solicitante" DataField="solicitante" />
                                                        <asp:BoundField HeaderText="Fecha de solicitud" DataField="fecha_solicitud" DataFormatString="{0:D}" />
                                                        <asp:BoundField HeaderText="Hora solicitud" DataField="hora_inicial" DataFormatString="{0:t}" />
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
