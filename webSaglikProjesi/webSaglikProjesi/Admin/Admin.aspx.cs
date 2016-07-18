using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSaglikProjesi.Admin
{
    public partial class Admin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Admin"] == null)
                {
                    pnlLogin.Visible = true;
                    Panel pnl = (Panel)this.Master.FindControl("pnlMenu");
                    pnl.Visible = false;
                }
                //else
                //{
                //    pnlLogin.Visible = false;
                //}
            }
        }
    }
}