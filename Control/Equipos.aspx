<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Equipos.aspx.cs" Inherits="HelpDeskWeb.Control.Equipos" %>

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
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
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
    </div>
    <asp:Panel runat="server" CssClass="container">
            <asp:Panel runat="server" Style="margin: 2% 2% 2% 2%">
            <form id="form1" runat="server">               
                <asp:ScriptManager runat="server" ID="script" EnablePartialRendering="true" ></asp:ScriptManager>
                <asp:Panel runat="server" CssClass="row panel-titulo">
                    <asp:Label runat="server" Text="Control de Equipos"/>
                </asp:Panel>
                <section>
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Panel runat="server" CssClass="col-lg-8">
                            <asp:Panel runat="server" CssClass="col-lg-2"></asp:Panel>
                            <asp:Panel runat="server" CssClass="input-group">
                                <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" placeholder="Buscar" />
                                <span class="input-group-btn">
                                    <asp:Button runat="server" Text="Filtrar" ID="btnFiltro" CssClass="btn btn-default" />
                                </span>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:LinkButton ID="btnNuevo" OnClientClick="mostrarModal(true)" OnClick="btnNuevo_Click" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                        </asp:LinkButton>
                           <asp:Panel runat="server" CssClass="modal fade" ID="myModal" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <asp:Panel runat="server" CssClass="modal-dialog modal-lg">
                                <asp:Panel runat="server" CssClass="modal-content">
                                    <asp:UpdatePanel runat="server" ID="updateForm1" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                                <asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="lbelTituloModal" Text="Alta de equipos" />
                                            </asp:Panel>
                                            <asp:Panel runat="server" CssClass="modal-body">
                                                <asp:Panel runat="server" CssClass="row">
                                                    <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                    <asp:Panel runat="server" CssClass="col-lg-10">
                                                        <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Panel runat="server" CssClass="form-group">
                                                                    <asp:Panel runat="server" CssClass="row">
                                                                        <asp:Panel runat="server" CssClass="col-lg-8">
                                                                            <asp:Label runat="server" Text="Responsable" Font-Bold="true"></asp:Label>
                                                                            <asp:DropDownList runat="server" ID="cbResponsable" DataTextField="nomCompleto" CssClass="form-control" DataValueField="idUsuario">
                                                                            </asp:DropDownList>
                                                                        </asp:Panel>
                                                                        <asp:Panel runat="server" CssClass="col-lg-4">
                                                                            <asp:Label runat="server" Text="Tipo de equipo" Font-Bold="true"></asp:Label>
                                                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbTipoEquipo" AutoPostBack="true" OnSelectedIndexChanged="cbTipoEquipo_SelectedIndexChanged" DataTextField="nomTipoEquipo" DataValueField="idTipoEquipo"></asp:DropDownList>
                                                                        </asp:Panel>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                                <asp:Panel runat="server" CssClass="form-group">
                                                                    <asp:Panel runat="server" CssClass="row">
                                                                        <asp:Panel runat="server" CssClass="panel panel-default">
                                                                            <asp:Panel runat="server" CssClass="panel-heading text-center">
                                                                                <asp:Label runat="server" Text="Capacidad" Font-Bold="true"></asp:Label>
                                                                            </asp:Panel>
                                                                            <asp:Panel runat="server" CssClass="panel-body">
                                                                                <asp:Panel runat="server" CssClass="col-lg-4">
                                                                                    <asp:Label runat="server" Text="Procesador" Font-Bold="true"></asp:Label>
                                                                                    <asp:Panel runat="server" CssClass="input-group">
                                                                                        <asp:TextBox runat="server" ID="txtProcesador" CssClass="form-control" TextMode="Number" step="0.01" min="0" />
                                                                                        <span class="input-group-addon">GHZ</span>
                                                                                    </asp:Panel>
                                                                                </asp:Panel>
                                                                                <asp:Panel runat="server" CssClass="col-lg-4">
                                                                                    <asp:Label runat="server" Text="Memoria RAM" Font-Bold="true"></asp:Label>
                                                                                    <asp:Panel runat="server" CssClass="input-group">
                                                                                        <asp:TextBox runat="server" ID="txtRAM" CssClass="form-control" TextMode="Number" min="1" />
                                                                                        <span class="input-group-addon">GB</span>
                                                                                    </asp:Panel>
                                                                                </asp:Panel>
                                                                                <asp:Panel runat="server" CssClass="col-lg-4">
                                                                                    <asp:Label runat="server" Text="Almacenamiento" Font-Bold="true"></asp:Label>
                                                                                    <asp:Panel runat="server" CssClass="input-group">
                                                                                        <asp:TextBox runat="server" ID="txtDD" CssClass="form-control" TextMode="Number" min="1" />
                                                                                        <span class="input-group-addon">
                                                                                            <asp:DropDownList runat="server" ID="cbDD" Style="background-color: #eee; border-color: transparent">
                                                                                                <asp:ListItem Text="GB" Value="GB"></asp:ListItem>
                                                                                                <asp:ListItem Text="TB" Value="TB"></asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                        </span>
                                                                                    </asp:Panel>
                                                                                </asp:Panel>
                                                                            </asp:Panel>
                                                                        </asp:Panel>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                                <asp:Panel runat="server" CssClass="form-group">
                                                                    <asp:Panel runat="server" CssClass="row">
                                                                        <asp:Panel runat="server" CssClass="col-lg-6">
                                                                            <asp:Panel runat="server" CssClass="panel panel-default" ID="panelEquipo">
                                                                                <asp:Panel runat="server" CssClass="panel-heading">
                                                                                    <asp:Label runat="server" Font-Bold="true" Text="Equipo"></asp:Label>
                                                                                </asp:Panel>
                                                                                <asp:Panel runat="server" CssClass="panel-body">
                                                                                    <asp:Panel runat="server" CssClass="form-group">
                                                                                        <asp:Panel runat="server" CssClass="input-group">
                                                                                            <span runat="server" class="input-group-addon">Marca</span>
                                                                                            <asp:DropDownList runat="server" ID="cbMarcaEquipo" DataTextField="nomMarca" DataValueField="idMarca" CssClass="form-control" />
                                                                                        </asp:Panel>
                                                                                    </asp:Panel>
                                                                                    <asp:Panel runat="server" CssClass="form-group">
                                                                                        <asp:Panel runat="server" CssClass="input-group">
                                                                                            <span runat="server" class="input-group-addon">Serie</span>
                                                                                            <asp:TextBox runat="server" ID="txtSerieEquipo" CssClass="form-control" placeholder="0000-0000-0000" required></asp:TextBox>
                                                                                        </asp:Panel>
                                                                                    </asp:Panel>
                                                                                </asp:Panel>
                                                                            </asp:Panel>
                                                                        </asp:Panel>
                                                                        <asp:Panel runat="server" CssClass="col-lg-6">
                                                                            <asp:Panel runat="server" CssClass="panel panel-default" ID="panelMonitor">
                                                                                <asp:Panel runat="server" CssClass="panel-heading">
                                                                                    <asp:Label runat="server" Font-Bold="true" Text="Monitor"></asp:Label>
                                                                                </asp:Panel>
                                                                                <asp:Panel runat="server" CssClass="panel-body">
                                                                                    <asp:Panel runat="server" CssClass="form-group">
                                                                                        <asp:Panel runat="server" CssClass="input-group">
                                                                                            <span runat="server" class="input-group-addon">Marca</span>
                                                                                            <asp:DropDownList runat="server" ID="cbMarcaMonitor" DataTextField="nomMarca" DataValueField="idMarca" CssClass="form-control" />
                                                                                        </asp:Panel>
                                                                                    </asp:Panel>
                                                                                    <asp:Panel runat="server" CssClass="form-group">
                                                                                        <asp:Panel runat="server" CssClass="input-group">
                                                                                            <span runat="server" class="input-group-addon">Serie</span>
                                                                                            <asp:TextBox runat="server" ID="txtSerieMonitor" CssClass="form-control" placeholder="0000-0000-0000" required></asp:TextBox>
                                                                                        </asp:Panel>
                                                                                    </asp:Panel>
                                                                                </asp:Panel>
                                                                            </asp:Panel>
                                                                        </asp:Panel>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                                <asp:Panel runat="server" CssClass="form-group">
                                                                    <asp:Panel runat="server" CssClass="row">
                                                                        <asp:Panel runat="server" CssClass="col-lg-6">
                                                                            <asp:Panel runat="server" CssClass="panel panel-default" ID="panelTeclado">
                                                                                <asp:Panel runat="server" CssClass="panel-heading">
                                                                                    <asp:Label runat="server" Font-Bold="true" Text="Teclado"></asp:Label>
                                                                                </asp:Panel>
                                                                                <asp:Panel runat="server" CssClass="panel-body">
                                                                                    <asp:Panel runat="server" CssClass="form-group">
                                                                                        <asp:Panel runat="server" CssClass="input-group">
                                                                                            <span runat="server" class="input-group-addon">Marca</span>
                                                                                            <asp:DropDownList runat="server" ID="cbMarcaTeclado" DataTextField="nomMarca" DataValueField="idMarca" CssClass="form-control" />
                                                                                        </asp:Panel>
                                                                                    </asp:Panel>
                                                                                    <asp:Panel runat="server" CssClass="form-group">
                                                                                        <asp:Panel runat="server" CssClass="input-group">
                                                                                            <span runat="server" class="input-group-addon">Serie</span>
                                                                                            <asp:TextBox runat="server" ID="txtSerieTeclado" CssClass="form-control" placeholder="0000-0000-0000" required></asp:TextBox>
                                                                                        </asp:Panel>
                                                                                    </asp:Panel>
                                                                                </asp:Panel>
                                                                            </asp:Panel>
                                                                        </asp:Panel>
                                                                        <asp:Panel runat="server" CssClass="col-lg-6">
                                                                            <asp:Panel runat="server" CssClass="panel panel-default" ID="panelMouse">
                                                                                <asp:Panel runat="server" CssClass="panel-heading">
                                                                                    <asp:Label runat="server" Font-Bold="true" Text="Mouse"></asp:Label>
                                                                                </asp:Panel>
                                                                                <asp:Panel runat="server" CssClass="panel-body">
                                                                                    <asp:Panel runat="server" CssClass="form-group">
                                                                                        <asp:Panel runat="server" CssClass="input-group">
                                                                                            <span runat="server" class="input-group-addon">Marca</span>
                                                                                            <asp:DropDownList runat="server" ID="cbMarcaMouse" DataTextField="nomMarca" DataValueField="idMarca" CssClass="form-control" />
                                                                                        </asp:Panel>
                                                                                    </asp:Panel>
                                                                                    <asp:Panel runat="server" CssClass="form-group">
                                                                                        <asp:Panel runat="server" CssClass="input-group">
                                                                                            <span runat="server" class="input-group-addon">Serie</span>
                                                                                            <asp:TextBox runat="server" ID="txtSerieMouse" CssClass="form-control" placeholder="0000-0000-0000" required></asp:TextBox>
                                                                                        </asp:Panel>
                                                                                    </asp:Panel>
                                                                                </asp:Panel>
                                                                            </asp:Panel>
                                                                        </asp:Panel>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                                <asp:Panel runat="server" CssClass="form-group">
                                                                    <asp:Panel runat="server" CssClass="row">
                                                                        <asp:Panel runat="server" CssClass="panel panel-default" ID="panelRed">
                                                                            <asp:Panel runat="server" CssClass="panel-heading text-center">
                                                                                <asp:Label runat="server" Text="Red" Font-Bold="true"></asp:Label>
                                                                            </asp:Panel>
                                                                            <asp:Panel runat="server" CssClass="panel-body">
                                                                                <asp:Panel runat="server" CssClass="form-group">

                                                                                    <asp:Panel runat="server" CssClass="row">
                                                                                        <asp:Panel runat="server" CssClass="col-lg-2"></asp:Panel>
                                                                                        <asp:Panel runat="server" CssClass="col-lg-8">
                                                                                            <asp:Label runat="server" Text="Dirección IP" Font-Bold="true"></asp:Label>
                                                                                            <asp:Panel runat="server" CssClass="input-group">
                                                                                                <asp:TextBox runat="server" ID="txtIP1" CssClass="form-control" TextMode="Number" min="0" max="255" />
                                                                                                <span runat="server" class="input-group-addon">.</span>
                                                                                                <asp:TextBox runat="server" ID="txtIP2" CssClass="form-control" TextMode="Number" min="0" max="255" />
                                                                                                <span runat="server" class="input-group-addon">.</span>
                                                                                                <asp:TextBox runat="server" ID="txtIP3" CssClass="form-control" TextMode="Number" min="0" max="255" />
                                                                                                <span runat="server" class="input-group-addon">.</span>
                                                                                                <asp:TextBox runat="server" ID="txtIP4" CssClass="form-control" TextMode="Number" min="0" max="255" />
                                                                                            </asp:Panel>
                                                                                        </asp:Panel>
                                                                                        <asp:Panel runat="server" CssClass="col-lg-2"></asp:Panel>
                                                                                    </asp:Panel>
                                                                                </asp:Panel>
                                                                                <asp:Panel runat="server" CssClass="form-group">
                                                                                    <asp:Panel runat="server" CssClass="row">
                                                                                        <asp:Panel runat="server" CssClass="col-lg-2"></asp:Panel>
                                                                                        <asp:Panel runat="server" CssClass="col-lg-8">
                                                                                            <asp:Label runat="server" Text="Dirección MAC" Font-Bold="true"></asp:Label>
                                                                                            <asp:Panel runat="server" CssClass="input-group">
                                                                                                <asp:TextBox runat="server" ID="txtMAC1" CssClass="form-control" />
                                                                                                <span runat="server" class="input-group-addon">-</span>
                                                                                                <asp:TextBox runat="server" ID="txtMAC2" CssClass="form-control" />
                                                                                                <span runat="server" class="input-group-addon">-</span>
                                                                                                <asp:TextBox runat="server" ID="txtMAC3" CssClass="form-control" />
                                                                                                <span runat="server" class="input-group-addon">-</span>
                                                                                                <asp:TextBox runat="server" ID="txtMAC4" CssClass="form-control" />
                                                                                                <span runat="server" class="input-group-addon">-</span>
                                                                                                <asp:TextBox runat="server" ID="txtMAC5" CssClass="form-control" />
                                                                                                <span runat="server" class="input-group-addon">-</span>
                                                                                                <asp:TextBox runat="server" ID="txtMAC6" CssClass="form-control" />
                                                                                            </asp:Panel>
                                                                                        </asp:Panel>
                                                                                        <asp:Panel runat="server" CssClass="col-lg-2"></asp:Panel>
                                                                                    </asp:Panel>
                                                                                </asp:Panel>
                                                                            </asp:Panel>
                                                                        </asp:Panel>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="cbTipoEquipo" EventName="SelectedIndexChanged" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </asp:Panel>
                                                </asp:Panel>
                                            </asp:Panel>
                                            <asp:Panel runat="server" CssClass="modal-footer">
                                                <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                <asp:Button runat="server" ID="btnGuardar" OnClick="btnGuardar_Click" CssClass="btn btn-primary" Text="Grabar" />
                                            </asp:Panel>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnModificar" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:LinkButton runat="server" ID="btnModificar" OnClientClick="mostrarModal(true)" OnClick="btnModificar_Click" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-pencil"></span> Editar
                        </asp:LinkButton>
                    </asp:Panel>
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Panel runat="server" CssClass="box">
                            <asp:Panel runat="server" ID="ContenedorTabla" ScrollBars="Auto" Height="400">
                                <asp:UpdatePanel runat="server" ID="update2" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ToolTip="Seleccione el registro a modificar" OnRowCreated="gvEquipo_RowCreated" runat="server" ID="gvEquipo" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                            AlternatingRowStyle-BackColor="#e0e0e0" DataKeyNames="idResponEq" CellPadding="4" GridLines="Horizontal">
                                            <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
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
                                        <asp:AsyncPostBackTrigger ControlID="btnFiltro" EventName="Click" />
                                        <asp:AsyncPostBackTrigger ControlID="txtFiltro" EventName="TextChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </asp:Panel>
                        </asp:Panel>
                    </asp:Panel>
                </section>
            </form>
            </asp:Panel>
    </asp:Panel>
    <asp:Panel CssClass="navbar navbar-fixed-bottom panel-inferior" runat="server">
        
    </asp:Panel>
    <script>
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
