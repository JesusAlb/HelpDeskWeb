<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HelpDeskWeb.index"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Centro de servicio</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/signin.css" rel="stylesheet" />

</head>
<body>
    <div class="container"> 
        <center><asp:Image runat="server" ImageUrl="~/Imagenes/IMCA IAP.png" Height="235px" Width="579px"/></center>
        <center><asp:Image runat="server" ImageUrl="~/Imagenes/helpDesk.png" Height="76px" Width="280px" /></center>
        <form class="form-signin" role="form" runat="server">           
            <h2 class="form-signin-heading">Control de acceso</h2>
            <asp:TextBox runat="server" ID="txtUsuario" type="text" class="form-control" placeholder="Usuario" required autofocus />
            <asp:TextBox runat="server" ID="txtPassword" type="password" class="form-control" placeholder="Contraseña" required />
            <asp:Button runat="server" Text="Entrar" ID="entrar" OnClick="entrar_Click" class="btn btn-lg btn-primary btn-block" type="submit"/>
        </form>
        <br />
    </div>
</body>
</html>