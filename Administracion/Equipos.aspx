<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Equipos.aspx.cs" Inherits="HelpDeskWeb.Administracion.Equipos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Centro de servicio</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/helpdesk-template.css" rel="stylesheet" />
    <!--Inicio de Alertify -->
    <link href="../css/alertify.css" rel="stylesheet" />
    <link href="../css/alertify-bootstrap3.css" rel="stylesheet" />
    <script src="../js/alertify.js"></script>
    <!--Fin de Alertify-->
    <script src="../js/bootstrap.js"></script>
    <script src="../js/jquery-2.1.1.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/validador.js"></script>
    <script type="text/javascript" lang="js">
        $(function () {
            $("#<%=txtFiltro.ClientID%>").keyup(function () {
                    __doPostBack("txtFiltro", $("#<%=txtFiltro.ClientID%>").val());
                })
        });

    </script>
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
                                <asp:HyperLink runat="server" NavigateUrl="~/perfil.aspx">Perfil</asp:HyperLink></li><li class="divider"></li>
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="~/logout.aspx">Cerrar sesión</asp:HyperLink></li></ul></li><li>
                        <asp:HyperLink runat="server" NavigateUrl="~/soporte.aspx">Inicio</asp:HyperLink></li></ul></div></div></div>
    <asp:Panel runat="server" CssClass="container">
            <form role="form" runat="server">               
                <asp:ScriptManager runat="server" ID="script" EnablePartialRendering="true" ></asp:ScriptManager>
                <asp:Panel runat="server" CssClass="row panel-titulo">
                    <asp:Label runat="server" Text="Control de Equipos"/>
                </asp:Panel>
                    <asp:Panel runat="server" CssClass="row">
                        <div class="col-lg-1"></div>
                        <asp:Panel runat="server" CssClass="col-lg-6">
                            <asp:Panel runat="server" CssClass="form-group">
                                <asp:TextBox runat="server" ID="txtFiltro" MaxLength="40" CssClass="form-control" placeholder="Buscar" />
                            </asp:Panel>
                        </asp:Panel>
                        <asp:Panel runat="server" CssClass="col-lg-4">
                            <div class="form-group">
                            <div class="btn-group btn-group-justified">
                                <asp:LinkButton ID="btnNuevo" OnCommand="btnAccionarModal_Command" CommandName="nuevo" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                </asp:LinkButton><asp:LinkButton runat="server" ID="btnModificar" OnCommand="btnAccionarModal_Command" CommandName="editar" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-pencil"></span> Editar
                                </asp:LinkButton></div></div><asp:Panel runat="server" CssClass="modal fade" ID="ModalNuevo" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <asp:Panel runat="server" CssClass="modal-dialog modal-lg">
                                    <asp:Panel runat="server" CssClass="modal-content">
                                        <asp:UpdatePanel runat="server" ID="updateModal" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button><asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="lbelTituloModal" Text="Alta de equipos" />
                                                </asp:Panel>
                                                <asp:Panel runat="server" ID="ModalContenido" CssClass="modal-body">
                                                    <asp:Panel runat="server" CssClass="row">
                                                        <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                        <asp:Panel runat="server" CssClass="col-lg-10">

                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Panel runat="server" CssClass="row">
                                                                    <asp:Panel runat="server" CssClass="col-lg-8">
                                                                        <asp:Label runat="server" Text="Responsable" Font-Bold="true"></asp:Label><asp:DropDownList runat="server" ID="cbResponsable" DataTextField="nomCompleto" AutoPostBack="true" CssClass="form-control" DataValueField="idUsuario">
                                                                        </asp:DropDownList>
                                                                    </asp:Panel>
                                                                    <asp:Panel runat="server" CssClass="col-lg-4">
                                                                        <asp:Label runat="server" Text="Tipo de equipo" Font-Bold="true"></asp:Label><asp:DropDownList runat="server" CssClass="form-control" ID="cbTipoEquipo" AutoPostBack="true" OnSelectedIndexChanged="cbTipoEquipo_SelectedIndexChanged" DataTextField="nomTipoEquipo" DataValueField="idTipoEquipo"></asp:DropDownList>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Panel runat="server" CssClass="row">
                                                                    <asp:Panel runat="server" CssClass="panel panel-default" ID="panelCapacidad">
                                                                        <asp:Panel runat="server" CssClass="panel-heading text-center">
                                                                            <asp:Label runat="server" Text="Capacidad" Font-Bold="true"></asp:Label></asp:Panel><asp:Panel runat="server" CssClass="panel-body">
                                                                            <asp:Panel runat="server" CssClass="col-lg-4">
                                                                                <asp:Label runat="server" Text="Procesador" Font-Bold="true"></asp:Label><asp:Panel runat="server" CssClass="input-group">
                                                                                    <asp:TextBox runat="server" ID="txtProcesador"  CssClass="form-control" MaxLength="4" onkeyup="validateDecimal(this);" />
                                                                                    <span class="input-group-addon">GHZ</span> </asp:Panel></asp:Panel><asp:Panel runat="server" CssClass="col-lg-4">
                                                                                <asp:Label runat="server" Text="Memoria RAM" MaxLength="4" Font-Bold="true"></asp:Label><asp:Panel runat="server" CssClass="input-group">
                                                                                    <asp:TextBox runat="server" ID="txtRAM" CssClass="form-control" MaxLength="4" onkeyup="keyUP(event.keyCode)" onkeydown="return isNumeric(event.keyCode);" />
                                                                                    <span class="input-group-addon">GB</span> </asp:Panel></asp:Panel><asp:Panel runat="server" CssClass="col-lg-4">
                                                                                <asp:Label runat="server" Text="Almacenamiento" Font-Bold="true"></asp:Label><asp:Panel runat="server" CssClass="input-group">
                                                                                    <asp:TextBox runat="server" ID="txtDD" CssClass="form-control" MaxLength="4" onkeyup="keyUP(event.keyCode)" onkeydown="return isNumeric(event.keyCode);"/>
                                                                                    <span class="input-group-addon">
                                                                                        <asp:DropDownList runat="server" ID="cbDD" Style="background-color: #eee; border-color: transparent">
                                                                                            <asp:ListItem Text="MB" Value="MB"></asp:ListItem><asp:ListItem Text="GB" Selected="True" Value="GB"></asp:ListItem><asp:ListItem Text="TB" Value="TB"></asp:ListItem></asp:DropDownList></span></asp:Panel></asp:Panel></asp:Panel></asp:Panel></asp:Panel></asp:Panel><asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Panel runat="server" CssClass="row">
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Panel runat="server" CssClass="panel panel-default" ID="panelEquipo">
                                                                            <asp:Panel runat="server" CssClass="panel-heading">
                                                                                <asp:Label runat="server" Font-Bold="true" Text="Equipo"></asp:Label></asp:Panel><asp:Panel runat="server" CssClass="panel-body">
                                                                                <asp:Panel runat="server" CssClass="form-group">
                                                                                    <asp:Panel runat="server" CssClass="input-group">
                                                                                        <span runat="server" class="input-group-addon">Marca</span> <asp:DropDownList runat="server" ID="cbMarcaEquipo" DataTextField="nomMarca" DataValueField="idMarca" CssClass="form-control" />
                                                                                    </asp:Panel>
                                                                                </asp:Panel>
                                                                                <asp:Panel runat="server" CssClass="form-group">
                                                                                    <asp:Panel runat="server" CssClass="input-group">
                                                                                        <span runat="server" class="input-group-addon">Serie</span> <asp:TextBox runat="server" ID="txtSerieEquipo" MaxLength="20" onkeyup="keyUP(event.keyCode)" onkeydown="return isAlphaNumeric(event.keyCode);" CssClass="form-control mayusculas" required></asp:TextBox></asp:Panel></asp:Panel></asp:Panel></asp:Panel></asp:Panel><asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Panel runat="server" CssClass="panel panel-default" ID="panelMonitor">
                                                                            <asp:Panel runat="server" CssClass="panel-heading">
                                                                                <asp:Label runat="server" Font-Bold="true" Text="Monitor"></asp:Label></asp:Panel><asp:Panel runat="server" CssClass="panel-body">
                                                                                <asp:Panel runat="server" CssClass="form-group">
                                                                                    <asp:Panel runat="server" CssClass="input-group">
                                                                                        <span runat="server" class="input-group-addon">Marca</span> <asp:DropDownList runat="server" ID="cbMarcaMonitor" DataTextField="nomMarca" DataValueField="idMarca" CssClass="form-control" />
                                                                                    </asp:Panel>
                                                                                </asp:Panel>
                                                                                <asp:Panel runat="server" CssClass="form-group">
                                                                                    <asp:Panel runat="server" CssClass="input-group">
                                                                                        <span runat="server" class="input-group-addon">Serie</span> <asp:TextBox runat="server" ID="txtSerieMonitor" onkeyup="keyUP(event.keyCode)" onkeydown="return isAlphaNumeric(event.keyCode);" MaxLength="20" CssClass="form-control mayusculas" required></asp:TextBox></asp:Panel></asp:Panel></asp:Panel></asp:Panel></asp:Panel></asp:Panel></asp:Panel><asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Panel runat="server" CssClass="row">
                                                                    <asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Panel runat="server" CssClass="panel panel-default" ID="panelTeclado">
                                                                            <asp:Panel runat="server" CssClass="panel-heading">
                                                                                <asp:Label runat="server" Font-Bold="true" Text="Teclado"></asp:Label></asp:Panel><asp:Panel runat="server" CssClass="panel-body">
                                                                                <asp:Panel runat="server" CssClass="form-group">
                                                                                    <asp:Panel runat="server" CssClass="input-group">
                                                                                        <span runat="server" class="input-group-addon">Marca</span> <asp:DropDownList runat="server" ID="cbMarcaTeclado" DataTextField="nomMarca" DataValueField="idMarca" CssClass="form-control" />
                                                                                    </asp:Panel>
                                                                                </asp:Panel>
                                                                                <asp:Panel runat="server" CssClass="form-group">
                                                                                    <asp:Panel runat="server" CssClass="input-group">
                                                                                        <span runat="server" class="input-group-addon">Serie</span> <asp:TextBox runat="server" ID="txtSerieTeclado" onkeyup="keyUP(event.keyCode)" onkeydown="return isAlphaNumeric(event.keyCode);" MaxLength="20" CssClass="form-control mayusculas" required></asp:TextBox></asp:Panel></asp:Panel></asp:Panel></asp:Panel></asp:Panel><asp:Panel runat="server" CssClass="col-lg-6">
                                                                        <asp:Panel runat="server" CssClass="panel panel-default" ID="panelMouse">
                                                                            <asp:Panel runat="server" CssClass="panel-heading">
                                                                                <asp:Label runat="server" Font-Bold="true" Text="Mouse"></asp:Label></asp:Panel><asp:Panel runat="server" CssClass="panel-body">
                                                                                <asp:Panel runat="server" CssClass="form-group">
                                                                                    <asp:Panel runat="server" CssClass="input-group">
                                                                                        <span runat="server" class="input-group-addon">Marca</span> <asp:DropDownList runat="server" ID="cbMarcaMouse" DataTextField="nomMarca" DataValueField="idMarca" CssClass="form-control" />
                                                                                    </asp:Panel>
                                                                                </asp:Panel>
                                                                                <asp:Panel runat="server" CssClass="form-group">
                                                                                    <asp:Panel runat="server" CssClass="input-group">
                                                                                        <span runat="server" class="input-group-addon">Serie</span> <asp:TextBox runat="server" ID="txtSerieMouse" onkeyup="keyUP(event.keyCode)" onkeydown="return isAlphaNumeric(event.keyCode);" MaxLength="20" CssClass="form-control mayusculas" required></asp:TextBox></asp:Panel></asp:Panel></asp:Panel></asp:Panel></asp:Panel></asp:Panel></asp:Panel><asp:Panel runat="server" CssClass="form-group">
                                                                <asp:Panel runat="server" CssClass="row">
                                                                    <asp:Panel runat="server" CssClass="panel panel-default" ID="panelRed">
                                                                        <asp:Panel runat="server" CssClass="panel-heading text-center">
                                                                            <asp:Label runat="server" Text="Red" Font-Bold="true"></asp:Label></asp:Panel><asp:Panel runat="server" CssClass="panel-body">
                                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                                <asp:Panel runat="server" CssClass="row">
                                                                                    <asp:Panel runat="server" CssClass="col-lg-2"></asp:Panel>
                                                                                    <asp:Panel runat="server" CssClass="col-lg-8">
                                                                                        <asp:Label runat="server" Text="Dirección IP" Font-Bold="true"></asp:Label><asp:Panel runat="server" CssClass="input-group">
                                                                                            <asp:TextBox runat="server" ID="txtIP1" CssClass="form-control" onkeyup="keyUP(event.keyCode)" onkeydown="return isNumeric(event.keyCode);" maxlength="3" />
                                                                                            <span runat="server" class="input-group-addon">.</span> <asp:TextBox runat="server" ID="txtIP2" CssClass="form-control" onkeyup="keyUP(event.keyCode)" onkeydown="return isNumeric(event.keyCode);" MaxLength="3"  />
                                                                                            <span runat="server" class="input-group-addon">.</span> <asp:TextBox runat="server" ID="txtIP3" CssClass="form-control" onkeyup="keyUP(event.keyCode)" onkeydown="return isNumeric(event.keyCode);" MaxLength="3"  />
                                                                                            <span runat="server" class="input-group-addon">.</span> <asp:TextBox runat="server" ID="txtIP4" CssClass="form-control" onkeyup="keyUP(event.keyCode)" onkeydown="return isNumeric(event.keyCode);" MaxLength="3"  />
                                                                                        </asp:Panel>
                                                                                    </asp:Panel>
                                                                                    <asp:Panel runat="server" CssClass="col-lg-2"></asp:Panel>
                                                                                </asp:Panel>
                                                                            </asp:Panel>
                                                                            <asp:Panel runat="server" CssClass="form-group">
                                                                                <asp:Panel runat="server" CssClass="row">
                                                                                    <asp:Panel runat="server" CssClass="col-lg-2"></asp:Panel>
                                                                                    <asp:Panel runat="server" CssClass="col-lg-8">
                                                                                        <asp:Label runat="server" Text="Dirección MAC" Font-Bold="true"></asp:Label><asp:Panel runat="server" CssClass="input-group">
                                                                                            <asp:TextBox runat="server" ID="txtMAC1" CssClass="form-control mayusculas" onkeyup="keyUP(event.keyCode)" onkeydown="return isAlphaNumeric(event.keyCode);" MaxLength="2" />
                                                                                            <span runat="server" class="input-group-addon">-</span> <asp:TextBox runat="server" ID="txtMAC2" CssClass="form-control mayusculas" onkeyup="keyUP(event.keyCode)" onkeydown="return isAlphaNumeric(event.keyCode);" MaxLength="2" />
                                                                                            <span runat="server" class="input-group-addon">-</span> <asp:TextBox runat="server" ID="txtMAC3" CssClass="form-control mayusculas" onkeyup="keyUP(event.keyCode)" onkeydown="return isAlphaNumeric(event.keyCode);" MaxLength="2" />
                                                                                            <span runat="server" class="input-group-addon">-</span> <asp:TextBox runat="server" ID="txtMAC4" CssClass="form-control mayusculas" onkeyup="keyUP(event.keyCode)" onkeydown="return isAlphaNumeric(event.keyCode);" MaxLength="2" />
                                                                                            <span runat="server" class="input-group-addon">-</span> <asp:TextBox runat="server" ID="txtMAC5" CssClass="form-control mayusculas" onkeyup="keyUP(event.keyCode)" onkeydown="return isAlphaNumeric(event.keyCode);" MaxLength="2" />
                                                                                            <span runat="server" class="input-group-addon">-</span> <asp:TextBox runat="server" ID="txtMAC6" CssClass="form-control mayusculas" onkeyup="keyUP(event.keyCode)" onkeydown="return isAlphaNumeric(event.keyCode);" MaxLength="2" />
                                                                                        </asp:Panel>
                                                                                    </asp:Panel>
                                                                                    <asp:Panel runat="server" CssClass="col-lg-2"></asp:Panel>
                                                                                </asp:Panel>
                                                                            </asp:Panel>
                                                                        </asp:Panel>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                </asp:Panel>
                                                <asp:Panel runat="server" CssClass="modal-footer">
                                                    <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                    <asp:Button runat="server" ID="btnGrabar" OnCommand="btnGrabar_Command" CssClass="btn btn-primary" Text="Grabar" />
                                                </asp:Panel>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnGrabar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="cbTipoEquipo" EventName="SelectedIndexChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnModificar" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>

                        </asp:Panel>
                        <div class="col-lg-1"></div>
                    </asp:Panel>
                    <asp:Panel runat="server" CssClass="row">
                            <asp:Panel runat="server" ID="ContenedorTabla" ScrollBars="Auto" Height="450">
                                <asp:UpdatePanel runat="server" ID="update2" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ToolTip="Seleccione el registro a modificar" OnRowCreated="gvEquipo_RowCreated" runat="server" ID="gvEquipo" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                            AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" DataKeyNames="idResponEq" CellPadding="4" GridLines="Horizontal">
                                            <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" Wrap="false" />
                                            <Columns>
                                                <asp:BoundField HeaderText="Nombre de usuario" DataField="nomCompleto" />
                                                <asp:BoundField HeaderText="Coordinación" DataField="nomCoordinacion" />
                                                <asp:BoundField HeaderText="Departamento" DataField="nomDepto" />
                                                <asp:BoundField HeaderText="Área" DataField="nomArea" />
                                                <asp:BoundField HeaderText="Puesto" DataField="nomPuesto" />
                                                <asp:BoundField HeaderText="Tipo de equipo" DataField="nomTipoEquipo" />
                                                <asp:BoundField HeaderText="Marca equipo" DataField="nomMarcaEquipo" />
                                                <asp:BoundField HeaderText="Serie equipo" DataField="serieEquipo"/>
                                                <asp:BoundField HeaderText="Memoria RAM" DataField="memoriaRam" />
                                                <asp:BoundField HeaderText="Disco Duro" DataField="discoDuro" />
                                                <asp:BoundField HeaderText="Procesador" DataField="procesador" />
                                                <asp:BoundField HeaderText="Marca monitor" DataField="nomMarcaMonitor" />
                                                <asp:BoundField HeaderText="Serie monitor" DataField="serieMonitor" />
                                                <asp:BoundField HeaderText="Marca teclado" DataField="nomMarcaTeclado" />
                                                <asp:BoundField HeaderText="Serie teclado" DataField="serieTeclado" />
                                                <asp:BoundField HeaderText="Marca mouse" DataField="nomMarcaMouse" />
                                                <asp:BoundField HeaderText="Serie mouse" DataField="serieMouse" />
                                                <asp:BoundField HeaderText="IP" DataField="ip" />
                                                <asp:BoundField HeaderText="MAC" DataField="mac" />
                                            </Columns>
                                            <RowStyle Wrap="false" />
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="btnGrabar" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </asp:Panel>
                    </asp:Panel>
            </form>
    </asp:Panel>
</body>
</html>
