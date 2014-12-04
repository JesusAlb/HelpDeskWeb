<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/principalMaestra.Master" CodeBehind="solicitante.aspx.cs" Inherits="HelpDeskWeb.solicitante" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="icon" type="image/icon" href="../Imagenes/imca.ico" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/helpdesk-template.css" rel="stylesheet" />
    <style type="text/css">
        .medalla{
            background-repeat:no-repeat;
            background-size: 100% 100%;
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
<asp:Content ContentPlaceHolderID="body" Runat="Server">
    <div class="container">
        <div class="container-panel">
            <div class="row" style="margin-top: 2%">
                    <asp:ScriptManager runat="server" EnablePartialRendering="true" ID="script"></asp:ScriptManager>
                    <div class="row" style="margin-top: 5%;">
                        <div class="col-lg-7">
                            <div class="row">
                                <div class="form-group" style="margin-top:2%">
                                    <asp:Image runat="server" ID="imca" ImageUrl="~/Imagenes/IMCA IAP.png" Height="230" Width="550" />
                                </div>
                                <div class="form-group" style="margin-top:5%">
                                    <asp:Label runat="server" Text="Help Desk" style="font-family: Arial; font-weight:bold; color:#6E6E6E; font-size:40px" /><br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-8">
                                    <div class="form-group">
                                        <div class="well" style="background-color: #E6E6E6">
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Solicitudes/Incidentes.aspx" CssClass="btn btn-danger btn-lg btn-block" role="button" Font-Size="18">
                                            <div class="row">
                                               <div class="col-lg-9" >
                                                   Encuestas en incidentes:
                                               </div> 
                                                <div class="col-lg-3">
                                                    <asp:Label runat="server" ID="lbelNumIncidentes" CssClass="text-center" Font-Bold="true" Enabled="false" Text="0" Font-Size="18" style="border-radius:5px; border:1px solid #d43f3a;"  Width="60" BackColor="#E6E6E6" ForeColor="Green"></asp:Label>
                                                </div>
                                                </div>
                                            </asp:HyperLink>
                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Solicitudes/Eventos.aspx" CssClass="btn btn-warning btn-lg btn-block" Font-Size="18">
                                              <div class="row">
                                               <div class="col-lg-9" >
                                                   Encuestas en eventos:
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
                            <div class="panel panel-primary" style="background-color: white; margin-top:12%">
                                <div class="panel-heading" style="font-size:24px; background-color:#E6E6E6; color:black">
                                    Información del usuario
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-4" >
                                            <div class="form-group">
                                                <asp:Image runat="server" ImageUrl="~/Imagenes/solicitante2.png" Width="140" Height="110" />
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
                                           Servicios de soporte solicitados
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
                                                        <asp:Label ID="lbelNumeroIncidentes" runat="server" CssClass="text-center" Enabled="false" Text="1" Height="50" Font-Size="24" ></asp:Label>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="panel panel-warning">
                                                <div class="panel-heading">
                                                    Eventos
                                                </div>
                                                <div class="panel-body">
                                                        <asp:Label ID="lbelNumeroEventos" runat="server" CssClass="text-center" Enabled="false" Text="1" Height="50" Font-Size="24" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
            </div>
        </div>
    </div>
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
</asp:Content>