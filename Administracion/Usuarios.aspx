<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="HelpDeskWeb.Administracion.Usuarios" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Control de usuario</title>
    <link rel="icon" type="image/icon" href="../Imagenes/imca.ico" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/helpdesk-template.css" rel="stylesheet" />
   <!-- <script src="../js/bootstrap.js"></script>-->
    <!--Inicio de Alertify -->
    <link href="../css/alertify.css" rel="stylesheet" />
    <link href="../css/alertify-bootstrap-3.css" rel="stylesheet" />
    <script src="../js/alertify.js"></script>
    <!--Fin de Alertify-->
    <script src="../js/jquery-2.1.1.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/validador.js" type="text/javascript"></script>
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
                        <asp:HyperLink runat="server" NavigateUrl="~/soporte.aspx">Inicio</asp:HyperLink></li>
                </ul>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" CssClass="container">
            <form runat="server" role="form">
                <asp:ScriptManager runat="server" ID="ScriptManager" EnablePartialRendering="true">
                </asp:ScriptManager>
                <asp:Panel runat="server" CssClass="panel-titulo row" HorizontalAlign="Center">
                    <asp:Label runat="server" Text="Control de usuarios" />
                </asp:Panel>
                <asp:Panel runat="server" CssClass="row">
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Panel runat="server" CssClass="col-lg-12">
                            <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                            <asp:Panel runat="server" CssClass="col-lg-6">
                                <div class="form-group">
                                        <asp:TextBox runat="server" ID="txtFiltro" MaxLength="40" OnTextChanged="txtFiltro_TextChanged"  CssClass="form-control" placeholder="Buscar" />
                                </div>
                            </asp:Panel>
                            <asp:Panel runat="server" CssClass="col-lg-4">
                                <div class="form-group">
                                    <asp:UpdatePanel runat="server" ID="updateAcciones" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="btn-group btn-group-justified">
                                                <asp:LinkButton ID="btnNuevo" OnCommand="btnAccionarModal_Command" CommandName="nuevo" runat="server" CssClass="btn btn-primary"><span class="glyphicon glyphicon-plus-sign"></span> Nuevo</asp:LinkButton>
                                                <asp:LinkButton runat="server" ID="btnEditar" OnCommand="btnAccionarModal_Command" CommandName="editar" CssClass="btn btn-primary">
                                    <span class="glyphicon glyphicon-pencil"></span> Editar
                                                </asp:LinkButton>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </asp:Panel>
                            <div class="col-lg-1"></div>
                        </asp:Panel>
                        <asp:Panel runat="server" CssClass="modal fade" ID="ModalNuevo" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <asp:Panel runat="server" CssClass="modal-dialog">
                                <asp:Panel runat="server" CssClass="modal-content">
                                    <asp:UpdatePanel runat="server" ID="updateModal" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                                <asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="lbelTituloModal" Text="Alta de usuarios" />
                                            </asp:Panel>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnEditar" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    <asp:Panel runat="server" ID="panelFormulario" CssClass="modal-body" DefaultButton="btnGrabar">
                                        <asp:Panel runat="server" CssClass="row">
                                            <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                            <asp:Panel runat="server" CssClass="col-lg-10">
                                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>

                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Nombre de usuario" Font-Bold="true" />
                                                            <asp:TextBox runat="server" ID="txtNomUsuario" onkeyup="keyUP(event.keyCode)" onkeydown="return isAlphaNumeric(event.keyCode);" onpaste="return false;" MaxLength="30" CssClass="form-control" />
                                                            <asp:HiddenField runat="server" ID="username" />
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Nombre completo del usuario" Font-Bold="true" />
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">Nombre</span>
                                                                    <asp:TextBox runat="server" ID="txtNombre" onpaste="return false;" onkeydown="return isAlpha(event.keyCode);" MaxLength="40" CssClass="form-control" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">Apellido</span>
                                                                    <asp:TextBox runat="server" ID="txtApellido" onpaste="return false;" onkeydown="return isAlpha(event.keyCode);" MaxLength="40" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>

                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Contraseña" Font-Bold="true" />
                                                            <asp:Panel runat="server" CssClass="row">
                                                                <asp:Panel runat="server" CssClass="col-lg-6">
                                                                    <asp:TextBox runat="server" ID="txtPassword" onpaste="return false;" onkeydown="return isAlphaNumeric(event.keyCode);" MaxLength="24" TextMode="Password" CssClass="form-control" />
                                                                </asp:Panel>
                                                                <asp:Panel runat="server" CssClass="col-lg-6">
                                                                    <asp:TextBox runat="server" ID="txtPasswordVer" onpaste="return false;" onkeydown="return isAlphaNumeric(event.keyCode);" MaxLength="24" TextMode="Password" CssClass="form-control" placeholder="Repita contraseña" />
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Panel runat="server" CssClass="row">
                                                                <asp:Panel runat="server" CssClass="col-lg-6">
                                                                    <asp:Label runat="server" Text="Tipo de usuario" Font-Bold="true" />
                                                                    <asp:DropDownList runat="server" ID="cbTipoUs" CssClass="form-control">
                                                                        <asp:ListItem Text="Soporte" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Solicitante" Value="1"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </asp:Panel>
                                                                <asp:Panel runat="server" CssClass="col-lg-6">
                                                                    <asp:Label runat="server" Text="Extensión Telefonica" Font-Bold="true" />
                                                                    <asp:TextBox runat="server" ID="txtExtension" MaxLength="3" onkeyup="keyUP(event.keyCode)" onpaste="return false;" onkeydown="return isNumeric(event.keyCode);" placeholder="000" CssClass="form-control" />
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                        </asp:Panel>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnEditar" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Institución" Font-Bold="true" />
                                                            <asp:DropDownList runat="server" ID="cbInstitucion" AutoPostBack="true" OnSelectedIndexChanged="cbInstitucion_SelectedIndexChanged" CssClass="form-control" DataTextField="nombre" DataValueField="id" />
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Correo electronico" Font-Bold="true" />
                                                            <div class="input-group">
                                                                <asp:TextBox runat="server" ID="txtCorreo" CssClass="form-control text-right" onpaste="return false;" onkeyup="keyUP(event.keyCode)" onkeydown="return isAlphaNumeric(event.keyCode);" MaxLength="30" />
                                                                <span class="input-group-addon">
                                                                    <asp:Label runat="server" ID="lbelCorreo" Text="@cie.org.mx"></asp:Label></span>
                                                            </div>
                                                        </asp:Panel>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="cbInstitucion" EventName="SelectedIndexChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnEditar" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Coordinación" Font-Bold="true" />
                                                            <asp:DropDownList runat="server" ID="cbCoordinaciones" AutoPostBack="true" CssClass="form-control"
                                                                OnSelectedIndexChanged="cbCoordinaciones_SelectedIndexChanged" DataTextField="nombre" DataValueField="id">
                                                            </asp:DropDownList>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Departamento" Font-Bold="true" />
                                                            <asp:DropDownList runat="server" ID="cbDepto" CssClass="form-control" DataTextField="nombre" DataValueField="id">
                                                            </asp:DropDownList>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Área" Font-Bold="true" />
                                                            <asp:DropDownList runat="server" ID="cbArea" CssClass="form-control" DataTextField="nombre" DataValueField="id">
                                                            </asp:DropDownList>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Puesto" Font-Bold="true" />
                                                            <asp:DropDownList runat="server" ID="cbPuesto" CssClass="form-control" DataTextField="nombre" DataValueField="id">
                                                            </asp:DropDownList>
                                                        </asp:Panel>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="cbCoordinaciones" EventName="SelectedIndexChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnEditar" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </asp:Panel>
                                        </asp:Panel>
                                    </asp:Panel>
                                    <asp:Panel runat="server" CssClass="modal-footer">
                                        <asp:UpdatePanel runat="server" ID="UpdateBtnsModal" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                <asp:Button runat="server" ID="btnGrabar" OnCommand="btnGrabar_Command" CssClass="btn btn-primary" Text="Grabar" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnEditar" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>

                    </asp:Panel>
                    <asp:Panel runat="server" CssClass="row">
                            <asp:Panel runat="server" CssClass="contenedorTablaControl" ScrollBars="Auto" >
                                <asp:UpdatePanel runat="server" ID="update2" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ToolTip="Seleccione el registro a modificar" OnRowCreated="gvUsuarios_RowCreated" runat="server" ID="gvUsuarios" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                            AlternatingRowStyle-BackColor="#e0e0e0" ShowHeaderWhenEmpty="true" DataKeyNames="id" CellPadding="4" GridLines="Horizontal">
                                            <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                            <Columns>
                                                <asp:BoundField HeaderText="Usuario" DataField="nombre_usuario" />
                                                <asp:BoundField HeaderText="Nombre" DataField="nom_completo" />
                                                <asp:BoundField HeaderText="Password" DataField="password" />
                                                <asp:BoundField HeaderText="Tipo de usuario" DataField="nom_tipo" />
                                                <asp:BoundField HeaderText="Extensión" DataField="extension_telefonica" />
                                                <asp:BoundField HeaderText="Correo" DataField="correo" />
                                                <asp:BoundField HeaderText="Institución" DataField="nom_institucion" />
                                                <asp:BoundField HeaderText="Departamento" DataField="nom_depto" />
                                                <asp:BoundField HeaderText="Coordinación" DataField="nom_coordinacion" />
                                                <asp:BoundField HeaderText="Área" DataField="nom_area" />
                                                <asp:BoundField HeaderText="Puesto" DataField="nom_puesto" />
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
                </asp:Panel>
            </form>
    </asp:Panel>

</body>
</html>

