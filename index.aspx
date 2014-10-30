<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HelpDeskWeb.index1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Help Desk</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="row">
            <div class="col-lg-12" style="background-color:red; height:700px">
                <div class="col-lg-2"></div>
                <div class="col-lg-8" style="background-color:orangered; height:500px">

                <div class="text-center">
                    <asp:Label runat="server" Text="Iniciando..." CssClass="text-center" ID="lbelMensaje"></asp:Label>
                </div>       
                    </div>
                <div class="col-lg-2"></div>
            </div>
    </div>
    </form>
</body>
</html>
