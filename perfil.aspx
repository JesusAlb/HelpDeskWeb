<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="HelpDeskWeb.perfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Perfil de usuario</title>
    <link rel="icon" type="image/icon" href="Imagenes/imca.ico" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
     <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/helpdesk-template.css" rel="stylesheet" />
    <!--Inicio de Alertify -->
    <link href="css/alertify.css" rel="stylesheet" />
    <link href="css/alertify-bootstrap-3.css" rel="stylesheet" />
    <script src="js/alertify.js"></script>
    <!--Fin de Alertify-->
    <script src="js/validador.js"></script>
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
    <div class="container">
        <div class="container-panel">
            <div class="row">
                <div class="row" style="margin-top: 1%;">
                    <form role="form" runat="server">
                        <asp:ScriptManager runat="server" ID="scriptManager" EnablePartialRendering="true"></asp:ScriptManager>
                        <div class="col-lg-10 col-lg-offset-1">
                            <div class="panel panel-primary">
                                <div class="panel-heading" style="font-size: 18px">
                                    Perfil de usuario
                                </div>
                                <asp:Panel runat="server" DefaultButton="btnGrabar" class="panel-body">
   
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="form-group text-left">
                                                            <asp:Label runat="server" Text="Nombre(s)" Font-Bold="true"></asp:Label>
                                                            <asp:TextBox runat="server" ID="txtNombre" onpaste="return false;" onkeydown="return isAlpha(event.keyCode);" MaxLength="40" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="form-group text-left">
                                                            <asp:Label runat="server" Text="Apellidos" Font-Bold="true"></asp:Label>
                                                            <asp:TextBox runat="server" ID="txtApellidos" onpaste="return false;" onkeydown="return isAlpha(event.keyCode);" MaxLength="40" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row" style="background-color: #428bca; color: white">
                                                    Datos del usuario
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-lg-4">
                                                        <div class="form-group text-left">
                                                            <asp:Label runat="server" Text="Nombre de usuario" Font-Bold="true"></asp:Label>
                                                            <asp:TextBox runat="server" ID="txtNombreUsuario" Enabled="false" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div class="form-group text-left">
                                                            <asp:Label runat="server" Text="Contraseña" Font-Bold="true"></asp:Label>
                                                            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" onpaste="return false;" onkeydown="return isAlphaNumeric(event.keyCode);" MaxLength="24" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div class="form-group text-left">
                                                            <asp:Label runat="server" Text="Repita contraseña" Font-Bold="true"></asp:Label>
                                                            <asp:TextBox runat="server" ID="txtVerificarPassword" TextMode="Password" onpaste="return false;" onkeydown="return isAlphaNumeric(event.keyCode);" MaxLength="24" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-lg-8">
                                                        <div class="form-group text-left">
                                                            <asp:Label runat="server" Text="Institución" Font-Bold="true"></asp:Label>
                                                            <asp:DropDownList runat="server" AutoPostBack="true" ID="cbInstitucion" OnSelectedIndexChanged="cbInstitucion_SelectedIndexChanged" DataTextField="nombre" DataValueField="id" CssClass="form-control"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div class="form-group text-left">
                                                            <asp:Label runat="server" Text="Extensión telefónica" Font-Bold="true"></asp:Label>
                                                            <asp:TextBox runat="server" TextMode="Number" ID="txtTelefono" MaxLength="3" onkeyup="keyUP(event.keyCode)" onpaste="return false;" onkeydown="return isNumeric(event.keyCode);" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-lg-1"></div>
                                                    <div class="col-lg-4">
                                                        <div class="form-group text-left">
                                                            <asp:Label runat="server" Text="Correo" Font-Bold="true"></asp:Label>
                                                            <asp:UpdatePanel runat="server" ID="updateInsitucion" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <div class="input-group">
                                                                        <asp:TextBox runat="server" ID="txtCorreo" onpaste="return false;" onkeyup="keyUP(event.keyCode)" onkeydown="return isAlphaNumeric(event.keyCode);" MaxLength="30" CssClass="form-control text-right"></asp:TextBox>
                                                                        <span class="input-group-addon">
                                                                            <asp:Label runat="server" ID="lbelInstitucion"></asp:Label></span>
                                                                    </div>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="cbInstitucion" EventName="SelectedIndexChanged" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-1"></div>
                                                    <div class="col-lg-4">
                                                        <div class="form-group text-left">
                                                            <asp:Label runat="server" Text="Tipo de usuario" Font-Bold="true"></asp:Label>
                                                            <asp:DropDownList runat="server" ID="cbTipoUsuario" Enabled="false" CssClass="form-control">
                                                                <asp:ListItem Text="Soporte" Value="0"></asp:ListItem>
                                                                <asp:ListItem Text="Solicitante" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-1"></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row" style="background-color: #428bca; color: white">
                                                    Datos del puesto
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="form-group text-left">
                                                            <asp:Label runat="server" Text="Coordinación" Font-Bold="true"></asp:Label>
                                                            <asp:DropDownList runat="server" ID="cbCoordinacion" AutoPostBack="true" OnSelectedIndexChanged="cbCoordinacion_SelectedIndexChanged" DataTextField="nombre" DataValueField="id" CssClass="form-control"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="form-group text-left">
                                                            <asp:Label runat="server" Text="Departamento" Font-Bold="true"></asp:Label>
                                                            <asp:UpdatePanel runat="server" ID="updateAcciones" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:DropDownList runat="server" DataTextField="nombre" CssClass="form-control" DataValueField="id" ID="cbDepto"></asp:DropDownList>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="cbCoordinacion" EventName="SelectedIndexChanged" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    <div class="form-group">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="form-group text-left">
                                                            <asp:Label runat="server" Text="Área" Font-Bold="true"></asp:Label>
                                                            <asp:DropDownList runat="server" ID="cbArea" DataTextField="nombre" DataValueField="id" CssClass="form-control"></asp:DropDownList>
                                                        </div>

                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="form-group text-left">
                                                            <asp:Label runat="server" Text="Puesto" Font-Bold="true"></asp:Label>
                                                            <asp:DropDownList runat="server" DataTextField="nombre" CssClass="form-control" DataValueField="id" ID="cbPuesto"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row" style="background-color: #E6E6E6; height: 1px"></div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-lg-3 col-lg-offset-6">
                                                    <div class="form-group">
                                                        <asp:LinkButton runat="server" CssClass="btn btn-default btn-block" Text="Cancelar" ID="btnCancelar" OnClick="btnCancelar_Click"></asp:LinkButton>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="form-group">
                                                        <asp:LinkButton runat="server" CssClass="btn btn-primary btn-block" Text="Guardar" ID="btnGrabar" OnClick="btnGrabar_Click"></asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>

                                </asp:Panel>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
