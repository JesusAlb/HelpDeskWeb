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
                e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink((sender as GridView), "Select$" + e.Row.RowIndex);
            }
        }

        public void limpiarControles(object[] ob)
        {
            foreach (object x in ob)
            {
                if (x is TextBox)
                {
                    (x as TextBox).Text = "";
                }
                else if (x is DropDownList)
                {
                    (x as DropDownList).SelectedIndex = -1;
                }
            }
        }


        public bool verificarCamposVacios(TextBox[] controles)
        {
            foreach (TextBox control in controles)
            {
                    if (String.IsNullOrWhiteSpace(control.Text))
                    {
                        return false;
                    }
                    else if(control.TextMode == TextBoxMode.Date || control.TextMode == TextBoxMode.Time)
                    {
                        try
                        {
                            Convert.ToDateTime(control.Text); 
                        }
                        catch
                        {
                            return false;
                        }
                    }                
             }

            return true;
        }
    }

}