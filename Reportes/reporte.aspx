<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reporte.aspx.cs" Inherits="HelpDeskWeb.Reportes.reporte" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Centro de reportes</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/helpdesk-template.css" rel="stylesheet" />
     <script src="../js/bootstrap.js"></script>
    <script src="../js/jquery-2.1.1.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script type="text/javascript">

        $(function () {
            $("#<%=txtFiltroAbierto.ClientID%>").keyup(function () {
                __doPostBack("txtFiltroAbierto", $("#<%=txtFiltroAbierto.ClientID%>").val());
            })
         });

    </script>
</head>
<body>
        <asp:Panel ID="Menu" runat="server" CssClass="navbar navbar-inverse navbar-fixed-top" role="navigation">
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
                    <li runat="server" id="Li1">
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
                        <asp:HyperLink runat="server" NavigateUrl="~/soporte.aspx">Inicio</asp:HyperLink></li>
                </ul>
            </div>
            </div>
        </asp:Panel>
        <asp:Panel runat="server" CssClass="container">
            <div class="box">
                <div class="row">
                    <div class="col-lg-12">
                        <form role="form" runat="server">
                            <asp:ScriptManager runat="server" EnablePartialRendering="true"></asp:ScriptManager>
                            <div class="form-group" style="border-bottom: solid 1px #357ebd">
                                <asp:LinkButton CssClass="btn btn-primary btn-lg btn-block" runat="server" data-toggle="collapse" href="#datosBusqueda" Text="Datos del reporte" />
                                <asp:Panel runat="server" ID="datosBusqueda" class="panel-collapse collapse in active">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-2"></div>
                                            <div class="col-lg-8">
                                                <div class="form-group">
                                                    <h3 class="text-center">Busqueda avanzada</h3>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-4" style="font-weight: bold; font-size: 16px; margin-top: 5px">
                                                            Información a mostrar
                                                        </div>
                                                        <div class="col-lg-5">
                                                            <asp:DropDownList runat="server" ID="cbObjeto" CssClass="form-control" OnSelectedIndexChanged="cbObjeto_SelectedIndexChanged" AutoPostBack="true">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:DropDownList runat="server" ToolTip="status" ID="cbEstatus" CssClass="form-control">
                                                                        <asp:ListItem Text="Todos" Value=""></asp:ListItem>
                                                                        <asp:ListItem Text="Abiertos"></asp:ListItem>
                                                                        <asp:ListItem Text="En proceso"></asp:ListItem>
                                                                        <asp:ListItem Text="Cerrados"></asp:ListItem>
                                                                        <asp:ListItem Text="Cancelados"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="cbObjeto" EventName="SelectedIndexChanged" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-4" style="font-weight: bold; font-size: 16px; margin-top: 5px">Filtro</div>
                                                        <div class="col-lg-8">
                                                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:TextBox runat="server" ID="txtFiltroAbierto" AutoPostBack="true" MaxLength="30" CssClass="form-control" placeholder="Buscar"></asp:TextBox>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="cbObjeto" EventName="SelectedIndexChanged" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-4" style="font-weight: bold; font-size: 16px; margin-top: 5px">Rango de fechas</div>
                                                        <div class="col-lg-8">
                                                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:Panel runat="server" ID="panelRangoFechas" CssClass="input-group">
                                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtFechaInicial" TextMode="Date"></asp:TextBox>
                                                                        <span class="input-group-addon">a </span>
                                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtFechaFinal" TextMode="Date"></asp:TextBox>
                                                                    </asp:Panel>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="cbObjeto" EventName="SelectedIndexChanged" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-12">
                                                        <asp:UpdatePanel runat="server" ID="updateGrid" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Panel runat="server" ID="panelGrid" ScrollBars="auto" Height="150" Visible="false">
                                                                    <asp:GridView ToolTip="Tabla de eventos con recursos asignados" runat="server" OnRowCreated="gvEventos_RowCreated" ID="gvEventos" AutoGenerateColumns="False" CssClass="table table-condensed" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                                        ShowHeaderWhenEmpty="true"  DataKeyNames="id" AlternatingRowStyle-BackColor="#F2F2F2" CellPadding="4" GridLines="none">
                                                                        <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                                                        <Columns>
                                                                            <asp:BoundField HeaderText="Id" DataField="id" />
                                                                            <asp:BoundField HeaderText="Evento" DataField="nombre" />
                                                                            <asp:BoundField HeaderText="Fecha" DataField="fecha_realizacion" DataFormatString="{0:D}" />
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </asp:Panel>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="txtFiltroAbierto" EventName="TextChanged" />
                                                                <asp:AsyncPostBackTrigger ControlID="cbObjeto" EventName="SelectedIndexChanged" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <asp:LinkButton runat="server" CssClass="btn btn-block btn-default" ID="btnGenerar" OnClick="btnGenerarReporte_Click">
                                                                <span class="glyphicon glyphicon-search"></span>
                                                                 Generar                                   
                                                            </asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        <div class="col-lg-2"></div>
                                    </div>
                            </div>
                        </asp:Panel>
                    </div>
                    <asp:Panel runat="server" ID="panelReporte" CssClass="panel panel-default" Visible="false">
                                <div class="panel-heading text-center">
                                    <asp:Label runat="server" Text="Reporte" Font-Size="Larger" Font-Bold="true"></asp:Label>
                                </div>
                                <div class="panel-body">
                                    <rsweb:ReportViewer ID="vt_reporte" runat="server" Height="500px" Width="100%" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                                        <LocalReport ReportEmbeddedResource="HelpDeskWeb.Reportes.Documentos.ReportEquipos.rdlc"></LocalReport>
                                    </rsweb:ReportViewer>
                                </div>
                            </asp:Panel>
                        </form>
                    </div>
                </div>
            </div>
        </asp:Panel>

    <script src="js/bootstrap.js"></script>
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
