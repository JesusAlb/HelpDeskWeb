<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HelpDeskWeb.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Help Desk</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/helpdesk-template.css" rel="stylesheet" />
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top" ></div>
<div class="container">
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-lg-12" height: 100%">
                <div class="row" style="height: 80%">

                    <div class="col-lg-2"></div>
                    <div class="col-lg-8" >
                    </div>
                    <div class="col-lg-2"></div>
                </div>
                <div class="row text-center" style="height: 20%">
                    <asp:Label runat="server" Font-Size="Larger" Text="Iniciando..." CssClass="text-center" ID="lbelMensaje"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</div>
 <div class="navbar navbar-fixed-bottom panel-inferior"></div>
</body>
</html>
