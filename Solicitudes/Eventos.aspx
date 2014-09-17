<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Eventos.aspx.cs" Inherits="HelpDeskWeb.Solicitudes.Eventos" %>

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
                    <li class="dropdown">
                        <asp:HyperLink runat="server" ID="menuControl" href="#" CssClass="dropdown-toggle" data-toggle="dropdown">Control</asp:HyperLink>
                        <ul class="dropdown-menu" role="menu">
                            <li><asp:HyperLink runat="server" NavigateUrl="~/Control/Usuarios.aspx">Usuarios</asp:HyperLink></li>
                            <li><asp:HyperLink runat="server" NavigateUrl="~/Control/Equipos.aspx">Equipos</asp:HyperLink></li>
                        </ul>
                    </li>
                    <li class="active dropdown">
                        <asp:HyperLink runat="server" href="#" CssClass="dropdown-toggle" data-toggle="dropdown">Solicitudes</asp:HyperLink>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <asp:HyperLink runat="server" NavigateUrl="~/Solicitudes/Incidentes.aspx">Incidentes</asp:HyperLink></li>
                            <li class="active">
                                <asp:HyperLink runat="server" NavigateUrl="~/Solicitudes/Eventos.aspx">Eventos</asp:HyperLink></li>
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
            <form runat="server">
                <asp:Panel runat="server" CssClass="row panel-titulo">
                    Centro de atención a eventos
                </asp:Panel>
                <asp:Panel runat="server" CssClass="row">
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Panel runat="server" CssClass="col-lg-7">
                            <asp:Panel runat="server" CssClass="col-lg-1"></asp:Panel>
                            <asp:Panel runat="server" CssClass="col-lg-11">
                                <asp:Panel runat="server" CssClass="input-group">
                                    <asp:TextBox runat="server" ID="txtFiltro" placeholder="Buscar" CssClass="form-control" />
                                    <span class="input-group-btn">
                                        <asp:Button runat="server" ID="btnFiltrar" Text="Fitrar" CssClass="btn btn-default" />
                                    </span>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:Panel runat="server" CssClass="col-lg-5">
                            <asp:LinkButton ID="btnNuevo" OnClientClick="mostrarModal(true)" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                             Nuevo
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnCancelar" OnClientClick="mostrarModal(true)" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-remove"></span>
                             Cancelar
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnCerrar" OnClientClick="mostrarModal(true)" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-lock"></span>
                             Cerrar
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnAsignar" OnClientClick="mostrarModal(true)" runat="server" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-user"></span>
                             soporte
                            </asp:LinkButton>
                        </asp:Panel>
                    </asp:Panel>
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Panel runat="server" CssClass="box">
                            <ul id="myTab" class="nav nav-tabs" role="tablist">
                                <li class="active"><a href="#abierta" role="tab" data-toggle="tab">Abierta</a></li>
                                <li><a href="#enProceso" role="tab" data-toggle="tab">En proceso</a></li>
                                <li><a href="#cerrada" role="tab" data-toggle="tab">Cerrada</a></li>
                                <li><a href="#cancelada" role="tab" data-toggle="tab">Cancelada</a></li>
                            </ul>
                            <asp:Panel runat="server" ID="myTabContent" CssClass="tab-content">
                                <asp:Panel runat="server" ID="abierta" CssClass="tab-pane fade in active">
                                    <asp:GridView ToolTip="Asigne el soporte a los eventos" runat="server" OnRowCreated="gvEventos_RowCreated" ID="gvEventos_Abiertos" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                        AlternatingRowStyle-BackColor="#e0e0e0" DataKeyNames="idEvento" CellPadding="4" GridLines="Horizontal">
                                        <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                        <Columns>
                                            <asp:BoundField HeaderText="#" DataField="idEvento" />
                                            <asp:BoundField HeaderText="Descripción" DataField="descripcion" HeaderStyle-Width="400" />
                                            <asp:BoundField HeaderText="Solicitante" DataField="solicitante" />
                                            <asp:BoundField HeaderText="Fecha de solicitud" DataField="fecha_Sol" DataFormatString="{0:D}" />
                                            <asp:BoundField HeaderText="Hora solicitud" DataField="horaIn" DataFormatString="{0:t}" />
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="enProceso" CssClass="tab-pane fade">
                                    <asp:GridView ToolTip="Atienda los eventos" runat="server" OnRowCreated="gvEventos_RowCreated" ID="gvEventos_EnProceso" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                        AlternatingRowStyle-BackColor="#e0e0e0" DataKeyNames="idEvento" CellPadding="4" GridLines="Horizontal">
                                        <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                        <Columns>
                                            <asp:BoundField HeaderText="#" DataField="idEvento" />
                                            <asp:BoundField HeaderText="Descripción" DataField="descripcion" HeaderStyle-Width="400" />
                                            <asp:BoundField HeaderText="Solicitante" DataField="solicitante" />
                                            <asp:BoundField HeaderText="Fecha de solicitud" DataField="fecha_Sol" DataFormatString="{0:D}" />
                                            <asp:BoundField HeaderText="Hora solicitud" DataField="horaIn" DataFormatString="{0:t}" />
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="cerrada" CssClass="tab-pane fade">
                                    <asp:GridView runat="server" OnRowCreated="gvEventos_RowCreated" ID="gvEventos_Cerrados" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                        AlternatingRowStyle-BackColor="#e0e0e0" DataKeyNames="idEvento" CellPadding="4" GridLines="Horizontal">
                                        <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                        <Columns>
                                            <asp:BoundField HeaderText="#" DataField="idEvento" />
                                            <asp:BoundField HeaderText="Descripción" DataField="descripcion" HeaderStyle-Width="400" />
                                            <asp:BoundField HeaderText="Solicitante" DataField="solicitante" />
                                            <asp:BoundField HeaderText="Fecha de solicitud" DataField="fecha_Sol" DataFormatString="{0:D}" />
                                            <asp:BoundField HeaderText="Hora solicitud" DataField="horaIn" DataFormatString="{0:t}" />
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="cancelada" CssClass="tab-pane fade">
                                    <asp:GridView runat="server" OnRowCreated="gvEventos_RowCreated" ID="gvEventos_Cancelados" Style="margin: 1% 1% 1% 1%" AutoGenerateColumns="False" CssClass="table table-bordered" SelectedRowStyle-ForeColor="black" SelectedRowStyle-BackColor="#B0C4DE"
                                        AlternatingRowStyle-BackColor="#e0e0e0" DataKeyNames="idEvento" CellPadding="4" GridLines="Horizontal">
                                        <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699" Font-Size="12" />
                                        <Columns>
                                            <asp:BoundField HeaderText="#" DataField="idEvento" />
                                            <asp:BoundField HeaderText="Descripción" DataField="descripcion" HeaderStyle-Width="400" />
                                            <asp:BoundField HeaderText="Solicitante" DataField="solicitante" />
                                            <asp:BoundField HeaderText="Fecha de solicitud" DataField="fecha_Sol" DataFormatString="{0:D}" />
                                            <asp:BoundField HeaderText="Hora solicitud" DataField="horaIn" DataFormatString="{0:t}" />
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
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
