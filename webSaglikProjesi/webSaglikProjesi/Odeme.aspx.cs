using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSaglikProjesi
{
    public partial class Odeme : System.Web.UI.Page
    {
        DataModel.SaglikUrunleriEntities ent = new DataModel.SaglikUrunleriEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["uye"] != null)
                {
                    int UyeID = Convert.ToInt32(Session["uye"]);
                    var Kullanici = (from user in ent.Kullanicilar
                                     where user.id == UyeID
                                     select user).FirstOrDefault();
                    lblAdi.Text = Kullanici.ad;
                    lblSoyadı.Text = Kullanici.soyad;
                    lblTutar.Text = string.Format("{0:C}", ToplamTutarBul());
                }
            }
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

        protected void btnHavaleEFT_Click(object sender, EventArgs e)
        {
            pnlBankaBilgileri.Visible = true;
        }

        protected void btnDavam_Click(object sender, EventArgs e)
        {
            Session.Remove("sepet");
            Response.Redirect("Default.aspx");
        }

        protected void btnCikis_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Default.aspx");
        }
    }
}