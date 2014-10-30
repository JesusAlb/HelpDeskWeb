<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HelpDeskWeb.login"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Centro de servicio</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/helpdesk-template.css" rel="stylesheet" />
            <!-- include alertify.css -->
    <link rel="stylesheet" href="css/alertify.css"/>

    <!-- include boostrap theme  -->
    <link rel="stylesheet" href="css/themes/bootstrap.css"/>

    <!-- include alertify script -->
    <script src="js/alertify.js"></script>
</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top" ></div>
    <div class="container">
       <div style="margin-left:5%; margin-right:5%;  margin-top:10%; ">
            <div class="row">
                <div class="col-lg-6" style="border-right:solid LightGray 2px">
                    <div class="row" style="margin:2% 2% 5% 2%" >
                        <asp:Image runat="server" ImageUrl="~/Imagenes/IMCA IAP.png" Height="180px" Width="442px" />
                    </div>
                    <div class="row" >
                        <h1 class="text-center" style="font-family:Aharoni;">HelpDesK V2.0</h1>
                    </div>
                </div>
                <div class="col-lg-6" >
                    <form role="form" runat="server">
                        <asp:ScriptManager runat="server" ID="scriptM" EnablePartialRendering="true"></asp:ScriptManager>
                            <div class="row">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-8">
                                    <h2 class="text-center">Control de acceso</h2>
                                    <div class="form-group">
                                         <asp:TextBox runat="server" ID="txtUsuario" type="text" class="form-control" placeholder="Usuario" required autofocus />
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="txtPassword" type="password" class="form-control" placeholder="Contraseña" required />
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
