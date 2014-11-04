<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HelpDeskWeb.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Help Desk</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/helpdesk-template.css" rel="stylesheet" />
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top" ></div>
<div class="container">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"  ID="script" EnablePartialRendering="true"></asp:ScriptManager>
        <asp:Timer runat="server" ID="tmIntro" OnTick="tmIntro_Tick" Interval="1200"></asp:Timer>
        <div class="row">
            <div class="col-lg-12">
                <div class="row" >
                    <asp:UpdatePanel runat="server" ID="upImagen" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Image runat="server" ID="imgIntro" style="margin-top:6%; margin-left:auto; margin-right:auto; display:table" ImageUrl="~/Imagenes/intro1.png" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="tmIntro" EventName="Tick" />
                        </Triggers>
                    </asp:UpdatePanel>              
                </div>
                <div class="row">
                    <div class="form-group text-center">
                        <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="upMensaje">
                            <ContentTemplate>
                                <asp:Label runat="server" Font-Size="XX-Large" CssClass="text-center" ID="lbelMensaje" ClientIDMode="Static"></asp:Label>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="tmIntro" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>                     
                    </div>                   
                </div>
            </div>
        </div>
    </form>
    </div>
    <div class="navbar navbar-fixed-bottom panel-inferior"></div>
    <script type="text/javascript">
            var mensajes = ['Iniciando...','Cargando información...','Enviando a la pagina de inicio...'].reverse();
 
            function nextMsg() {
                if (mensajes.length == 0) {
                    $('#lbelMensaje').hide();
            
                    location.href = 'login.aspx';
                } else {
                    $('#lbelMensaje').html(mensajes.pop()).fadeIn(500).delay(1000).fadeOut(500, nextMsg);
                }
            };

            $('#lbelMensaje').hide();
            nextMsg();

    </script>

</body>
</html>
