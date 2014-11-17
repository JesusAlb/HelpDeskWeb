<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="catUsuarios.aspx.cs" Inherits="HelpDeskWeb.Catalogos.Usuarios" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Centro de servicio</title>
    <script src="../js/jquery-2.1.1.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/helpdesk-template.css" rel="stylesheet" />
    <script src="../js/ie-emulation-modes-warning.js"></script>
    <script src="../js/ie10-viewport-bug-workaround.js"></script>
    <script src="../js/bootstrap.min.js"></script>

     <!--Inicio de Alertify -->
    <link href="../css/alertify.css" rel="stylesheet" />
    <link href="../css/alertify-bootstrap3.css" rel="stylesheet" />
    <script src="../js/alertify.js"></script>
    <!--Fin de Alertify-->

    <script type="text/javascript">
        $(function () {
            $("#<%=txtFiltroCoord.ClientID%>").keyup(function () {
                __doPostBack("txtFiltroCoord", $("#<%=txtFiltroCoord.ClientID%>").val());
            })
        });

        $(function () {
            $("#<%=txtFiltroDepto.ClientID%>").keyup(function () {
                __doPostBack("txtFiltroDepto", $("#<%=txtFiltroDepto.ClientID%>").val());
            })
        });

        $(function () {
            $("#<%=txtFiltroArea.ClientID%>").keyup(function () {
                __doPostBack("txtFiltroArea", $("#<%=txtFiltroArea.ClientID%>").val());
            })
        });

        $(function () {
            $("#<%=txtFiltroPuesto.ClientID%>").keyup(function () {
                __doPostBack("txtFiltroPuesto", $("#<%=txtFiltroPuesto.ClientID%>").val());
            })
           });
    </script>
    <script src="../js/validador.js"></script>
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
    </div>
    <asp:Panel runat="server" CssClass="container">
        <div class="box">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <asp:Panel runat="server" CssClass="panel panel-default" BorderColor="Gray">
                        <asp:Panel runat="server" CssClass="panel-heading" Font-Size="Large" HorizontalAlign="Center" BackColor="#E6E6E6">
                            Catálogos para usuarios
                       
                        </asp:Panel>
                        <div class="panel-body">
                            <form role="form" runat="server">
                                <asp:ScriptManager runat="server" ID="ScriptManager" EnablePartialRendering="true">
                                </asp:ScriptManager>
                                <div class="form-group">
                                    <ul id="myTab" class="nav nav-tabs" role="tablist">
                                        <li class="active">
                                            <asp:LinkButton runat="server" ID="tabCoordinaciones" OnClientClick="activaTab('0')" href="#coordinaciones" role="tab">Coordinaciones</asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton runat="server" ID="tabDepartamentos" OnClientClick="activaTab('1')" href="#departamentos" role="tab">Departamentos</asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton runat="server" ID="tabAreas" OnClientClick="activaTab('2')" href="#areas" role="tab">Áreas</asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton runat="server" ID="tabPuestos" OnClientClick="activaTab('3')" href="#puestos" role="tab">Puestos</asp:LinkButton></li>
                                    </ul>
                                    <asp:Panel runat="server" CssClass="modal fade" ID="ModalNuevo" TabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <asp:Panel runat="server" CssClass="modal-dialog modal-md">
                                            <asp:Panel runat="server" CssClass="modal-content" DefaultButton="btnGrabar">
                                                <asp:UpdatePanel ID="updateModalNuevo" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Panel runat="server" CssClass="modal-header" HorizontalAlign="Center">
                                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                                            <asp:Label runat="server" CssClass="modal-title" Font-Size="Large" ID="lbelModal" />
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="modal-body">
                                                            <asp:Panel runat="server" CssClass="row">
                                                                <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                                                                <asp:Panel runat="server" CssClass="col-lg-10">
                                                                    <asp:Panel runat="server" ID="panelNombre" CssClass="form-group">
                                                                        <asp:Label runat="server" Text="Nombre" Font-Bold="true"></asp:Label>
                                                                        <asp:TextBox runat="server" ID="txtNombre" onkeydown="return isAlpha(event.keyCode);" MaxLength="59" CssClass="form-control" placeholder="Nombre" />
                                                                    </asp:Panel>
                                                                    <asp:Panel runat="server" ID="panelCoordinaciones" CssClass="form-group" Visible="false">
                                                                        <asp:Label runat="server" Text="Coordinación" Font-Bold="true"></asp:Label>
                                                                        <asp:DropDownList runat="server" ID="cbCoordinaciones" DataTextField="nombre" CssClass="form-control" DataValueField="id">
                                                                        </asp:DropDownList>
                                                                    </asp:Panel>
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" CssClass="modal-footer">
                                                            <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                                                            <asp:LinkButton runat="server" ID="btnGrabar" OnCommand="btnGrabar_Command" CommandName="insertar" CommandArgument="coordinacion" CssClass="btn btn-primary" Text="Grabar" />
                                                        </asp:Panel>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnNuevoCoord" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnEditarCoord" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnNuevoDepto" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnEditarDepto" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnNuevaArea" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnEditarArea" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnNuevoPuesto" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnEditarPuesto" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnGrabar" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </asp:Panel>
                                        </asp:Panel>
                                    </asp:Panel>
                                </div>
                                <asp:Panel runat="server" ID="myTabContent" CssClass="tab-content">
                                    <asp:Panel runat="server" ID="coordinaciones" CssClass="tab-pane fade in active">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-1"></div>
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <asp:TextBox runat="server" ID="txtFiltroCoord" onkeydown="return isAlpha(event.keyCode);" MaxLength="25" CssClass="form-control" placeholder="Buscar" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">

                                                    <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                        <asp:LinkButton ID="btnNuevoCoord" CommandName="abrirNuevaCoord" CommandArgument="coordinacion" OnCommand="btnNuevo_Command" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                                        </asp:LinkButton>
                                                        <asp:LinkButton ID="btnEditarCoord" CommandName="abrirEditarCoord" CommandArgument="coordinacion" OnCommand="btnEditar_Command" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-pencil"></span>
                             Editar
                                                        </asp:LinkButton>
                                                    </asp:Panel>
                                                </div>
                                                <div class="col-lg-1"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-1"></div>
                                                <div class="col-lg-10">
                                                    <asp:Table runat="server" ID="TablaCoordinaciones" class="table" Style="margin-bottom: 0%; background-color: #F2F2F2">
                                                        <asp:TableRow runat="server" Font-Bold="true" class="text-center" BackColor="#006699" ForeColor="White" Font-Size="Larger" Style="border-bottom: LightGray 1px solid">
                                                            <asp:TableCell>Coordinaciones</asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                    <asp:Panel runat="server" Height="290px" ScrollBars="Auto">
                                                        <asp:UpdatePanel runat="server" ID="upGvCoordinaciones" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:GridView OnRowCreated="gv_RowCreated" runat="server" ID="gvCoordinaciones" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeader="false" DataKeyNames="id" CellPadding="4" GridLines="Horizontal">
                                                                    <Columns>
                                                                        <asp:BoundField HeaderText="Coordinaciones" DataField="nombre" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnGrabar" EventName="Click" />
                                                                <asp:AsyncPostBackTrigger ControlID="txtFiltroCoord" EventName="TextChanged" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </asp:Panel>
                                                </div>
                                                <div class="col-lg-1"></div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel runat="server" ID="departamentos" CssClass="tab-pane fade">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-1"></div>
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtFiltroDepto" onkeydown="return isAlpha(event.keyCode);" MaxLength="25" placeholder="Buscar" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:UpdatePanel runat="server" ID="upAccionesDepto" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                                <asp:LinkButton ID="btnNuevoDepto" CommandName="abrirNuevoDepto" CommandArgument="depto" OnCommand="btnNuevo_Command" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                                                </asp:LinkButton>
                                                                <asp:LinkButton ID="btnEditarDepto" CommandName="abrirEditarDepto" CommandArgument="depto" OnCommand="btnEditar_Command" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-pencil"></span>
                             Editar
                                                                </asp:LinkButton>
                                                            </asp:Panel>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnNuevoDepto" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnEditarDepto" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                                <div class="col-lg-1"></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-1"></div>
                                                <div class="col-lg-10">
                                                    <div class="form-group">
                                                        <asp:UpdatePanel runat="server" ID="uPFiltroCoordinacion" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">Coordinación</span>
                                                                    <asp:DropDownList runat="server" ID="cbFiltroCoord" AutoPostBack="true" DataTextField="nombre" CssClass="form-control" DataValueField="id" OnSelectedIndexChanged="cbFiltroCoord_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnGrabar" EventName="Click" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>

                                                    </div>
                                                </div>
                                                <div class="col-lg-1"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-1"></div>
                                                <div class="col-lg-10">
                                                    <asp:Table runat="server" ID="tablaDeptos" class="table" Style="margin-bottom: 0%; background-color: #F2F2F2">
                                                        <asp:TableRow runat="server" Font-Bold="true" class="text-center" BackColor="#006699" ForeColor="White" Font-Size="Larger" Style="border-bottom: LightGray 1px solid">
                                                            <asp:TableCell Width="250">Nombre</asp:TableCell>
                                                            <asp:TableCell Width="250">Coordinación</asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                    <asp:Panel runat="server" Height="290px" ScrollBars="Auto">
                                                        <asp:UpdatePanel runat="server" ID="upGvDeptos" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:GridView OnRowCreated="gv_RowCreated" runat="server" ID="gvDeptos" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeader="false" DataKeyNames="id" CellPadding="4" GridLines="Horizontal">
                                                                    <Columns>
                                                                        <asp:BoundField HeaderText="Departamentos" DataField="nombre" ItemStyle-Width="250" ItemStyle-Wrap="true" />
                                                                        <asp:BoundField HeaderText="Coordinación" DataField="nom_coordinacion" ItemStyle-Width="250" ItemStyle-Wrap="true" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnGrabar" EventName="Click" />
                                                                <asp:AsyncPostBackTrigger ControlID="txtFiltroDepto" EventName="TextChanged" />
                                                                <asp:AsyncPostBackTrigger ControlID="cbFiltroCoord" EventName="SelectedIndexChanged" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </asp:Panel>
                                                </div>
                                                <div class="col-lg-1"></div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel runat="server" ID="areas" CssClass="tab-pane fade">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-1"></div>
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtFiltroArea" onkeydown="return isAlpha(event.keyCode);" MaxLength="25" placeholder="Buscar" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:UpdatePanel runat="server" ID="upAccionesAreas" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                                <asp:LinkButton ID="btnNuevaArea" CommandName="abrirNuevaArea" CommandArgument="area" OnCommand="btnNuevo_Command" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                                                </asp:LinkButton>
                                                                <asp:LinkButton ID="btnEditarArea" CommandName="abrirEditarArea" CommandArgument="area" OnCommand="btnEditar_Command" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-pencil"></span>
                             Editar
                                                                </asp:LinkButton>
                                                            </asp:Panel>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnNuevaArea" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnEditarArea" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                                <div class="col-lg-1"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-1"></div>
                                                <div class="col-lg-10">
                                                    <asp:Table runat="server" ID="tablaAreas" class="table" Style="margin-bottom: 0%; background-color: #F2F2F2">
                                                        <asp:TableRow runat="server" Font-Bold="true" class="text-center" BackColor="#006699" ForeColor="White" Font-Size="Larger" Style="border-bottom: LightGray 1px solid">
                                                            <asp:TableCell>Área</asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                    <asp:Panel runat="server" Height="290px" ScrollBars="Auto">
                                                        <asp:UpdatePanel runat="server" ID="upGvArea" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:GridView OnRowCreated="gv_RowCreated" runat="server" ID="gvAreas" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeader="false" DataKeyNames="id" CellPadding="4" GridLines="Horizontal">
                                                                    <Columns>
                                                                        <asp:BoundField HeaderText="Áreas" DataField="nombre" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnGrabar" EventName="Click" />
                                                                <asp:AsyncPostBackTrigger ControlID="txtFiltroArea" EventName="TextChanged" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </asp:Panel>
                                                </div>
                                                <div class="col-lg-1"></div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel runat="server" ID="puestos" CssClass="tab-pane fade">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-1"></div>
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtFiltroPuesto" onkeydown="return isAlpha(event.keyCode);" MaxLength="25" placeholder="Buscar" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:UpdatePanel runat="server" ID="upAccionesPuestos" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Panel runat="server" CssClass="btn-group btn-group-justified">
                                                                <asp:LinkButton ID="btnNuevoPuesto" CommandName="abrirNuevoPuesto" CommandArgument="puesto" OnCommand="btnNuevo_Command" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                                                                </asp:LinkButton>
                                                                <asp:LinkButton ID="btnEditarPuesto" CommandName="abrirEditarPuesto" CommandArgument="puesto" OnCommand="btnEditar_Command" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-pencil"></span>
                             Editar
                                                                </asp:LinkButton>
                                                            </asp:Panel>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnNuevoPuesto" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnEditarPuesto" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                                <div class="col-lg-1"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-1"></div>
                                                <div class="col-lg-10">
                                                    <asp:Table runat="server" ID="tablaPuestos" class="table" Style="margin-bottom: 0%; background-color: #F2F2F2">
                                                        <asp:TableRow runat="server" Font-Bold="true" class="text-center" BackColor="#006699" ForeColor="White" Font-Size="Larger" Style="border-bottom: LightGray 1px solid">
                                                            <asp:TableCell>Puestos</asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                    <asp:Panel runat="server" Height="290px" ScrollBars="Auto">
                                                        <asp:UpdatePanel runat="server" ID="upGvPuestos" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:GridView OnRowCreated="gv_RowCreated" runat="server" ID="gvPuestos" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                                                    AlternatingRowStyle-BackColor="#e0e0e0" ShowHeader="false" DataKeyNames="id" CellPadding="4" GridLines="Horizontal">
                                                                    <Columns>
                                                                        <asp:BoundField HeaderText="Puestos" DataField="nombre" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnGrabar" EventName="Click" />
                                                                <asp:AsyncPostBackTrigger ControlID="txtFiltroPuesto" EventName="TextChanged" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </asp:Panel>
                                                </div>
                                                <div class="col-lg-1"></div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </asp:Panel>
                            </form>
                        </div>
                    </asp:Panel>
                </div>
                <div class="col-lg-2"></div>
            </div>
        </div>
    </asp:Panel>
    <script type="text/javascript">
        function activaTab(index) {
            $('#myTab li:eq(' + index + ') a').tab('show'); // Select third tab (0-indexed)   
        }
    </script>
</body>
</html>

