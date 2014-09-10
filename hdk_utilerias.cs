using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb
{
    public class hdk_utilerias : System.Web.UI.Page
    {
        public void setRowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='none';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                e.Row.ToolTip = "Click para seleccionar el renglon";
                e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink((sender as GridView), "Select$" + e.Row.RowIndex);
            }
        }

        public void limpiarControles(object[] ob)
        {        
            for (int x = 0; x < ob.Length; x++)
            {
                if (ob[x] is TextBox)
                {
                    (ob[x] as TextBox).Text = "";
                }
                else if (ob[x] is DropDownList)
                {
                    (ob[x] as DropDownList).SelectedIndex = -1;
                }
            }
        }
    }
}