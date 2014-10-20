<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/paginaMaestra.Master" CodeBehind="principal.aspx.cs" Inherits="HelpDeskWeb.principal" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/helpdesk-template.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/styles2.css" rel="stylesheet" />
    <link href="css/printstyles.css" rel="stylesheet" />
    <style type="text/css">
        .medalla {
            background: url(Imagenes/medallaN.png);
            background-size: 100% 100%;
            background-repeat: no-repeat;
        }

        .centrado-Horizontal {
            margin-left: auto;
            margin-right: auto;
            display: table;
        }

        .centrado-vertical {
            display: table-cell;
            vertical-align: middle;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="Main" Runat="Server">
    <div class="container">
        <div class="container-panel">
            <div class="row" style="margin-top: 2%">
                <form runat="server" role="form">
                    <asp:ScriptManager runat="server" EnablePartialRendering="true" ID="script"></asp:ScriptManager>
                    <div class="row" style="margin-top: 1%">
                        <div class="col-lg-7">
                            <div class="row">
                                <div class="form-group">
                                    <asp:Image runat="server" ID="imca" ImageUrl="~/Imagenes/IMCA IAP.png" Height="230" Width="550" />
                                </div>
                                <div class="form-group" style="margin-top:5%">
                                    <asp:Label runat="server" Text="Help Desk" Font-Bold="true"  style="font-family:'Comic Sans MS'; font-size:40px" /><br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-8">
                                    <div class="form-group">
                                        <div class="well" style="background-color: #E6E6E6">
                                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-danger btn-lg btn-block" role="button" Font-Size="18">
                                            <div class="row">
                                               <div class="col-lg-9" >
                                                   Número de incidentes:
                                               </div> 
                                                <div class="col-lg-3">
                                                    <asp:Label runat="server" ID="lbelNumIncidentes" CssClass="text-center" Font-Bold="true" Enabled="false" Text="0" Font-Size="18" style="border-radius:5px; border:1px solid #d43f3a;"  Width="60" BackColor="#E6E6E6" ForeColor="Green"></asp:Label>
                                                </div>
                                                </div>
                                            </asp:HyperLink>
                                            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-warning btn-lg btn-block" Font-Size="18">
                                              <div class="row">
                                               <div class="col-lg-9" >
                                                   Número de eventos:
                                               </div> 
                                                <div class="col-lg-3">
                                                    <asp:Label runat="server" ID="lbelNumEventos" CssClass="text-center" Font-Bold="true" Enabled="false" Text="0" Font-Size="18" style="border-radius:5px; border:1px solid #eea236;"  Width="60" BackColor="#E6E6E6" ForeColor="green"></asp:Label>
                                                </div>
                                                </div>
                                            </asp:HyperLink>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2"></div>
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="panel panel-primary" style="background-color: white">
                                <div class="panel-heading" style="font-size:24px; background-color:#E6E6E6; color:black">
                                    Información del usuario
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-4" >
                                            <div class="form-group">
                                                <asp:Image runat="server" ImageUrl="~/Imagenes/soporte.png" Width="120" Height="120" />
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="row" style="border-bottom:solid 1px #428bca">
                                                <div class="form-group">
                                                    <asp:Label runat="server" ID="lbelNomUsuario" Font-Size="14" />
                                                </div>
                                            </div>
                                            <div class="row" style="border-bottom:solid 1px #428bca">
                                                <div class="form-group" >
                                                    <asp:Label runat="server" ID="lbelCargo"  Font-Size="14" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group">
                                                    <asp:Label runat="server" ID="lbelInstitucion" Font-Size="14"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="text-center" style="font-size:20px; background-color:#E6E6E6; color:black; margin-bottom:2%">
                                            Calificaciones
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group">
                                        <div class="col-lg-6">
                                            
                                            <div class="panel panel-danger">
                                                <div class="panel-heading">
                                                    Incidentes
                                                </div>
                                                <div class="panel-body">
                                                        <asp:Label ID="lbelCalificacionIncidentes" runat="server" CssClass="text-center" Enabled="false" Text="1" Height="50" Font-Size="24" ></asp:Label>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="panel panel-warning">
                                                <div class="panel-heading">
                                                    Eventos
                                                </div>
                                                <div class="panel-body">
                                                        <asp:Label ID="lbelCalificacionEventos" runat="server" CssClass="text-center" Enabled="false" Text="1" Height="50" Font-Size="24" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="text-center" style="font-size:16px; background-color:#E6E6E6; color:black; margin-bottom:2%">
                                            Total
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-lg-6">
                                                <asp:Panel runat="server" CssClass="medalla centrado-Horizontal" Height="120" Width="120">
                                                    <asp:Label runat="server" ID="lbelPosicion" CssClass="centrado-vertical" Text="5" Font-Size="40"></asp:Label>
                                                </asp:Panel>                                                
                                            </div>
                                            <div class="col-lg-6">
                                                <asp:Label runat="server" ID="lbelPromedioGeneral" Text="Sin calificación" Font-Size="60" Height="120" CssClass="text-center" style="border-bottom:5px solid Green"  Enabled="false"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="js/bootstrap.js"></script>
        <script src="js/jquery-2.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
</asp:Content>