<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="HelpDeskWeb.Control.Usuarios" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Centro de servicio</title>
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
                    <li class="active dropdown">
                        <asp:HyperLink runat="server" ID="menuControl" href="#" CssClass="dropdown-toggle" data-toggle="dropdown">Control</asp:HyperLink>
                        <ul class="dropdown-menu" role="menu">
                            <li class="active"><a href="#">Usuarios</a></li>
                            <li><a href="#">Equipos</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <asp:HyperLink runat="server" href="#" CssClass="dropdown-toggle" data-toggle="dropdown">Solicitudes</asp:HyperLink>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <asp:HyperLink runat="server" href="#">Incidentes</asp:HyperLink></li>
                            <li>
                                <asp:HyperLink runat="server" href="#">Eventos</asp:HyperLink></li>
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
                <asp:ScriptManager runat="server" ID="ScriptManager" EnablePartialRendering="true">
                </asp:ScriptManager>
                <asp:Panel runat="server" CssClass="panel-titulo row" HorizontalAlign="Center">
                    <asp:Label runat="server" Text="Control de usuarios" />
                </asp:Panel>
                <asp:Panel runat="server" CssClass="row">
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Panel runat="server" CssClass="col-lg-8">
                            <asp:Panel runat="server" CssClass="col-lg-2"></asp:Panel>
                            <asp:Panel runat="server" CssClass="input-group">
                                <asp:TextBox runat="server" ID="txtFiltro" OnTextChanged="txtFiltro_TextChanged" AutoPostBack="true" CssClass="form-control" placeholder="Buscar" />
                                <span class="input-group-btn">
                                    <asp:Button runat="server" Text="Filtrar" OnClick="btnFiltro_Click" ID="btnFiltro" CssClass="btn btn-default" />
                                </span>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:LinkButton ID="btnNuevo" OnClientClick="mostrarModal(true)" OnClick="btnNuevo_Click" runat="server" CssClass="btn btn-primary"><span class="glyphicon glyphicon-plus-sign"></span> Nuevo</asp:LinkButton>
                        <!-- Modal -->
                        <asp:Panel runat="server" CssClass="modal fade" ID="myModal" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <asp:Panel runat="server" CssClass="modal-dialog">
                                <asp:Panel runat="server" CssClass="modal-content">
                                    <asp:UpdatePanel runat="server" ID="updateForm1" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                                <asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="lbelTituloModal" Text="Alta de usuarios" />
                                            </asp:Panel>
                                            <asp:Panel runat="server" CssClass="modal-body">
                                                <asp:Panel runat="server" CssClass="row">
                                                    <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                    <asp:Panel runat="server" CssClass="col-lg-10">
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Nombre de usuario" Font-Bold="true" />
                                                            <asp:TextBox runat="server" ID="txtNomUsuario" CssClass="form-control" placeholder="Nombre de usuario" required />
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Nombre completo del usuario" Font-Bold="true" />
                                                            <asp:TextBox runat="server" ID="txtNomCompleto" CssClass="form-control" placeholder="Nombre completo" required />
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Contraseña" Font-Bold="true" />
                                                            <asp:Panel runat="server" CssClass="row">
                                                                <asp:Panel runat="server" CssClass="col-lg-6">
                                                                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Contraseñas" required />
                                                                </asp:Panel>
                                                                <asp:Panel runat="server" CssClass="col-lg-6">
                                                                    <asp:TextBox runat="server" ID="txtPasswordVer" TextMode="Password" CssClass="form-control" placeholder="Repita contraseña" required />
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
                                                                    <asp:TextBox runat="server" ID="txtExtension" TextMode="Number" placeholder="000" CssClass="form-control" />
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group-sm">
                                                            <asp:Label runat="server" txt="Institución" Font-Bold="true"/>
                                                            <asp:DropDownList runat="server" ID="cbInstitucion" CssClass="form-control" DataTextField ="nomInstitucion" DataValueField="idInstitucion" required/>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Correo electronico" Font-Bold="true" />
                                                            <asp:TextBox runat="server" ID="txtCorreo" TextMode="Email" CssClass="form-control" placeholder="Ejemplo@cie.org.mx" />
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Coordinación" Font-Bold="true" />
                                                            <asp:DropDownList runat="server" ID="cbCoordinaciones" AutoPostBack="true" CssClass="form-control"
                                                                OnSelectedIndexChanged="cbCoordinaciones_SelectedIndexChanged" DataTextField="nomCoordinacion" DataValueField="idCoordinacion" required>
                                                            </asp:DropDownList>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Departamento" Font-Bold="true" />
                                                            <asp:DropDownList runat="server" ID="cbDepto" CssClass="form-control" required DataTextField="nomDepto" DataValueField="idDepto">
                                                            </asp:DropDownList>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Área" Font-Bold="true" />
                                                            <asp:DropDownList runat="server" ID="cbArea" CssClass="form-control" required DataTextField="nomArea" DataValueField="idArea">
                                                            </asp:DropDownList>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="form-group">
                                                            <asp:Label runat="server" Text="Puesto" Font-Bold="true" />
                                                            <asp:DropDownList runat="server" ID="cbPuesto" CssClass="form-control" required DataTextField="nomPuesto" DataValueField="idPuesto">
                                                            </asp:DropDownList>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                </asp:Panel>
                                            </asp:Panel>
                                            <asp:Panel runat="server" CssClass="modal-footer">
                                                <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                <asp:Button runat="server" ID="btnGuardar" OnClick="btnGuardar_Click" CssClass="btn btn-primary" OnClientClick="mostrarModal(false)" Text="Grabar" />
                                            </asp:Panel>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnModificar" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="cbCoordinaciones" EventName="SelectedIndexChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:LinkButton runat="server" ID="btnModificar" OnClientClick="mostrarModal(true)" OnClick="btnModificar_Click" CssClass="btn btn-primary" >
                                    <span class="glyphicon glyphicon-pencil"></span> Editar
                        </asp:LinkButton>
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
                                                <asp:BoundField HeaderText="Usuario" DataField="nomUsuario" />
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
                                        <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
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
             if (a == true) {
                 $('#myModal').modal('show');
             } else {
                 $('#myModal').modal('hide');
             }
         }

    </script>
    <script src="../js/jquery-2.1.1.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>

