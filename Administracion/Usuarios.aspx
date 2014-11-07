<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="HelpDeskWeb.Administracion.Usuarios" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Centro de servicio</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/helpdesk-template.css" rel="stylesheet" />
    <script src="../js/bootstrap.js"></script>
                <!-- include alertify.css -->
    <link rel="stylesheet" href="../css/alertify.css"/>
    <link rel="stylesheet" href="../css/themes/default.css" />
    <link rel="stylesheet" href="../css/alertify.min.css" />
    <!-- include boostrap theme  -->
    <link rel="stylesheet" href="../css/themes/bootstrap.css"/>  
    <!-- include alertify script -->
    <script src="../js/alertify.js"></script>
    <script src="../js/alertify.min.js"></script>
        <script src="../js/jquery-2.1.1.js"></script>
    <script src="../js/bootstrap.min.js"></script>

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
                                    <asp:Panel runat="server" CssClass="input-group">
                                        <asp:TextBox runat="server" ID="txtFiltro" MaxLength="40" OnTextChanged="txtFiltro_TextChanged" AutoPostBack="true" CssClass="form-control" placeholder="Buscar" />
                                        <span class="input-group-btn">
                                            <asp:Button runat="server" Text="Filtrar" OnClick="btnFiltro_Click" ID="btnFiltro" CssClass="btn btn-default" />
                                        </span>
                                    </asp:Panel>
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

                        <!-- Modal -->
                        <asp:Panel runat="server" CssClass="modal fade" ID="ModalNuevo" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <asp:Panel runat="server" CssClass="modal-dialog">
                                <asp:Panel runat="server" CssClass="modal-content">
                                    <asp:UpdatePanel runat="server" ID="updateModal" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                                <asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="lbelTituloModal" Text="Alta de usuarios" />
                                            </asp:Panel>
                                            <asp:Panel runat="server" ID="panelFormulario" CssClass="modal-body">
                                                <asp:Panel runat="server" CssClass="row">
                                                    <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                    <asp:Panel runat="server" CssClass="col-lg-10">
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Nombre de usuario" Font-Bold="true" />
                                                            <asp:TextBox runat="server" ID="txtNomUsuario" MaxLength="30" CssClass="form-control" placeholder="Nombre de usuario"/>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Nombre completo del usuario" Font-Bold="true" />
                                                            <asp:TextBox runat="server" ID="txtNombre" MaxLength="40" CssClass="form-control" placeholder="Nombre(s)"/>
                                                            <asp:TextBox runat="server" ID="txtApellido" MaxLength="40" CssClass="form-control" placeholder="Apellidos" style="margin-top:2%"></asp:TextBox>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Contraseña" Font-Bold="true" />
                                                            <asp:Panel runat="server" CssClass="row">
                                                                <asp:Panel runat="server" CssClass="col-lg-6">
                                                                    <asp:TextBox runat="server" ID="txtPassword" MaxLength="24" TextMode="Password" CssClass="form-control" placeholder="Contraseña" />
                                                                </asp:Panel>
                                                                <asp:Panel runat="server" CssClass="col-lg-6">
                                                                    <asp:TextBox runat="server" ID="txtPasswordVer" MaxLength="24" TextMode="Password" CssClass="form-control" placeholder="Repita contraseña" />
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
                                                                    <asp:TextBox runat="server" ID="txtExtension" MaxLength="3" TextMode="Number" placeholder="000" CssClass="form-control" />
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Institución" Font-Bold="true"/>
                                                            <asp:DropDownList runat="server" ID="cbInstitucion" CssClass="form-control" DataTextField ="nomInstitucion" DataValueField="idInstitucion" />
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Correo electronico" Font-Bold="true" />
                                                            <asp:TextBox runat="server" ID="txtCorreo" TextMode="Email" CssClass="form-control" placeholder="Ejemplo@cie.org.mx" />
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Coordinación" Font-Bold="true" />
                                                            <asp:DropDownList runat="server" ID="cbCoordinaciones" AutoPostBack="true" CssClass="form-control"
                                                                OnSelectedIndexChanged="cbCoordinaciones_SelectedIndexChanged" DataTextField="nomCoordinacion" DataValueField="idCoordinacion" >
                                                            </asp:DropDownList>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Departamento" Font-Bold="true" />
                                                            <asp:DropDownList runat="server" ID="cbDepto" CssClass="form-control"  DataTextField="nomDepto" DataValueField="idDepto">
                                                            </asp:DropDownList>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Área" Font-Bold="true" />
                                                            <asp:DropDownList runat="server" ID="cbArea" CssClass="form-control" DataTextField="nomArea" DataValueField="idArea">
                                                            </asp:DropDownList>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Puesto" Font-Bold="true" />
                                                            <asp:DropDownList runat="server" ID="cbPuesto" CssClass="form-control"  DataTextField="nomPuesto" DataValueField="idPuesto">
                                                            </asp:DropDownList>
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
                                            <asp:AsyncPostBackTrigger ControlID="btnEditar" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="cbCoordinaciones" EventName="SelectedIndexChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>

                    </asp:Panel>
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Panel runat="server" CssClass="box">
                            <asp:Panel runat="server" ID="ContenedorTabla" ScrollBars="Auto" Height="400">
                                <asp:UpdatePanel runat="server" ID="update2" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ToolTip="Seleccione el registro a modificar" OnRowCreated="gvUsuarios_RowCreated" runat="server" ID="gvUsuarios" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                            AlternatingRowStyle-BackColor="#e0e0e0" DataKeyNames="idUsuario" CellPadding="4" GridLines="Horizontal">
                                            <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                            <Columns>
                                                <asp:BoundField HeaderText="Usuario" DataField="username" />
                                                <asp:BoundField HeaderText="Nombre" DataField="nomCompleto" />
                                                <asp:BoundField HeaderText="Password" DataField="password" />
                                                <asp:BoundField HeaderText="Tipo de usuario" DataField="tipoUsuarioString" />
                                                <asp:BoundField HeaderText="Extensión" DataField="exTel" />
                                                <asp:BoundField HeaderText="Correo" DataField="correo" />
                                                <asp:BoundField HeaderText="Institución" DataField="nomInstitucion" />
                                                <asp:BoundField HeaderText="Departamento" DataField="nomDepto" />
                                                <asp:BoundField HeaderText="Coordinación" DataField="nomCoordinacion" />
                                                <asp:BoundField HeaderText="Área" DataField="nomArea" />
                                                <asp:BoundField HeaderText="Puesto" DataField="nomPuesto" />
                                            </Columns>
                                            <RowStyle Wrap="false" />
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnFiltro" EventName="Click" />
                                        <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="btnGrabar" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </asp:Panel>
                        </asp:Panel>
                    </asp:Panel>
                </asp:Panel>
            </form>
        </asp:Panel>
    </asp:Panel>

</body>
</html>

