<% 
    Session.Abandon()
    Response.Cookies.Add(New HttpCookie("ASP.NET_SessionId", ""))
    Response.Redirect("login.aspx")
%>