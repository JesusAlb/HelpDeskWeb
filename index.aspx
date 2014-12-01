<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HelpDeskWeb.login"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Centro de servicios</title>
    <link rel="icon" type="image/icon" href="Imagenes/imca.ico" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/helpdesk-template.css" rel="stylesheet" />
    <!--Inicio de Alertify -->
    <link href="css/alertify.css" rel="stylesheet" />
    <link href="css/alertify-bootstrap-3.css" rel="stylesheet" />
    <script src="js/alertify.js"></script>
    <!--Fin de Alertify-->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/validador.js"></script>
</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top" ></div>
    <div class="container">
       <div style="margin-left:5%; margin-right:5%;  margin-top:10%; ">
            <div class="row">
                <div class="col-lg-6"  style="border-right: solid 1px #E6E6E6;">
                    <div class="form-group">
                        <div class="row" style="margin: 2% 2% 5% 2%">
                            <asp:Image runat="server" ImageUrl="~/Imagenes/IMCA IAP.png" Height="180px" Width="442px" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row text-center">
                            <asp:Label runat="server"  style="font-family: Arial; font-weight:bold; color:#357ebd; font-size:40px" Text="Centro de servicios"></asp:Label>
                        </div>
                        <div class="row text-center">
                                                        <asp:Label runat="server" Font-Size="Large" style="font-family: Arial; font-weight:bold; color:#DF3A01; font-size:30px" Text="Help desk" ></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <form role="form" runat="server">
                        <asp:ScriptManager runat="server" ID="scriptM" EnablePartialRendering="true"></asp:ScriptManager>
                            <div class="row">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-8">
                                    <div class="form-group text-center"><img src="Imagenes/usuario.png" class="text-center"/></div>
                                    <h3 class="text-center">Control de acceso</h3>
                                    <div class="form-group">
                                         <asp:TextBox runat="server" ID="txtUsuario" type="text" class="form-control" placeholder="Usuario" required autofocus />
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="txtPassword"   type="password" class="form-control" placeholder="Contraseña" required />
                                    </div>
                                    <asp:UpdatePanel runat="server" ID="Update" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Button runat="server" Text="Entrar" ID="entrar" OnClick="entrar_Click" class="btn btn-lg btn-primary btn-block" type="submit" />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="entrar" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="col-lg-2"></div>
                            </div>
                    </form>
                </div>
             </div>
        </div>
    </div>
    <div class="navbar navbar-fixed-bottom panel-inferior"></div>
</body>
</html>
