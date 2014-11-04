using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb
{
    public partial class solicitante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hdk_utilerias.checarSession(this, true, 1, 0);
        }
    }
}