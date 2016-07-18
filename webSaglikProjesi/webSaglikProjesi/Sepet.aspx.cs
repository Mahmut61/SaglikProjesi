using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webSaglikProjesi.Models;

namespace webSaglikProjesi
{
    public partial class Sepet : System.Web.UI.Page
    {
        cSepet spt = new cSepet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["sepet"] != null)
                {
                    DataTable dt = (DataTable)Session["sepet"];
                    SepetGoster(dt);
                    //gvSepet.FooterRow.Cells[1].Text = "Toplam Adet:";
                    //gvSepet.FooterRow.Cells[2].Text = ToplamAdetBul().ToString();
                    //gvSepet.FooterRow.Cells[3].Text = ToplamTutarBul().ToString();
                }
                else
                {
                    DataTable dt = spt.YeniSepet();
                    Session["sepet"] = dt;
                    gvSepet.DataSource = dt;
                    gvSepet.DataBind();
                }
            }
        }
        private void SepetGoster(DataTable dt)
        {
            gvSepet.Columns[1].FooterText = "Toplam:";
            gvSepet.Columns[1].FooterStyle.HorizontalAlign = HorizontalAlign.Right;
            gvSepet.Columns[2].FooterText = ToplamAdetBul().ToString();
            gvSepet.Columns[2].FooterStyle.HorizontalAlign = HorizontalAlign.Center;
            gvSepet.Columns[3].FooterText = string.Format("{0:C}", ToplamTutarBul());
            gvSepet.Columns[3].FooterStyle.HorizontalAlign = HorizontalAlign.Right;
            gvSepet.DataSource = dt;
            gvSepet.DataBind();
        }
        private int ToplamAdetBul()
        {
            int ToplamAdet = 0;
            DataTable dt = (DataTable)Session["sepet"];
            foreach (DataRow dr in dt.Rows)
            {
                ToplamAdet += Convert.ToInt32(dr["adet"]);
            }
            return ToplamAdet;
        }
        private decimal ToplamTutarBul()
        {
            decimal ToplamTutar = 0;
            DataTable dt = (DataTable)Session["sepet"];
            foreach (DataRow dr in dt.Rows)
            {
                ToplamTutar += Convert.ToDecimal(dr["tutar"]);
            }
            return ToplamTutar;
        }

        protected void btnDevam_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnSepetiBosalt_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["sepet"];//sessionda bulunan sepetimiz.
            dt.Rows.Clear();
            Session["sepet"] = dt;
            SepetGoster(dt);
        }

        protected void gvSepet_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = (DataTable)Session["sepet"];//sessionda bulunan sepetimiz.
            dt.Rows.RemoveAt(e.RowIndex);
            Session["sepet"] = dt;
            SepetGoster(dt);
        }

        protected void btnSatınAl_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["sepet"];//sessionda bulunan sepetimiz.
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("Adres.aspx");
            }

        }
    }
}