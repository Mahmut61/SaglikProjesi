using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSaglikProjesi.Admin
{
    public partial class AltKategoriEkle : System.Web.UI.Page
    {
        DataModel.SaglikUrunleriEntities ent = new DataModel.SaglikUrunleriEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Admin"] == null)
                {
                    Response.Redirect("Admin.aspx");
                }
                else
                {
                    KategorileriGetir();
                    AltKategorileriGetirByKategorino(Convert.ToInt32(ddlKategoriler.SelectedValue));
                }
            }
        }
        private void KategorileriGetir()
        {
            var categories = (from k in ent.Kategoriler
                              where k.silindi == false
                              select k).ToList();
            ddlKategoriler.DataTextField = "kategoriad";
            ddlKategoriler.DataValueField = "ID";
            ddlKategoriler.DataSource = categories;
            ddlKategoriler.DataBind();
        }
        protected void ddlKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            AltKategorileriGetirByKategorino(Convert.ToInt32(ddlKategoriler.SelectedValue));
        }
        private void AltKategorileriGetirByKategorino(int KNo)
        {
            var subcategories = (from ak in ent.AltKategoriler
                                 where ak.silindi == false && ak.kategorino == KNo
                                 select ak).ToList();
            gvAltKategoriler.DataSource = subcategories;
            gvAltKategoriler.DataBind();
        }
        protected void gvAltKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlEkle.Visible = true;
            txtAltKategori.Text = HttpUtility.HtmlDecode(gvAltKategoriler.SelectedRow.Cells[1].Text);
            txtAciklama.Text = HttpUtility.HtmlDecode(gvAltKategoriler.SelectedRow.Cells[2].Text);
            txtAltKategori.Focus();
        }
        protected void lbYeniAltKategori_Click(object sender, EventArgs e)
        {
            pnlEkle.Visible = true;
            gvAltKategoriler.SelectedIndex = -1;
            Temizle();
            txtAltKategori.Focus();
        }
        private void Temizle()
        {
            txtAltKategori.Text = "";
            txtAciklama.Text = "";
        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (txtAltKategori.Text.Trim() != "")
            {
                DataModel.AltKategoriler ak = new DataModel.AltKategoriler();
                ak.altkategoriad = txtAltKategori.Text;
                ak.aciklama = txtAciklama.Text;
                ak.kategorino = Convert.ToInt32(ddlKategoriler.SelectedValue);
                ent.AltKategoriler.Add(ak);
                try
                {
                    ent.SaveChanges();
                    pnlEkle.Visible = false;
                    AltKategorileriGetirByKategorino(Convert.ToInt32(ddlKategoriler.SelectedValue));

                }
                catch (Exception ex)
                {
                    string hata = ex.Message;
                }
            }
        }

        protected void btnDegistir_Click(object sender, EventArgs e)
        {
            int degisenID = Convert.ToInt32(gvAltKategoriler.SelectedValue);
            var degisen = (from k in ent.AltKategoriler
                           where k.ID == degisenID
                           select k).FirstOrDefault();
            degisen.altkategoriad = txtAltKategori.Text;
            degisen.aciklama = txtAciklama.Text;
            try
            {
                ent.SaveChanges();
                pnlEkle.Visible = false;
                AltKategorileriGetirByKategorino(Convert.ToInt32(ddlKategoriler.SelectedValue));

            }
            catch (Exception ex)
            {
                string hata = ex.Message;
            }
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            int silinenID = Convert.ToInt32(gvAltKategoriler.SelectedValue);
            var silinen = (from k in ent.AltKategoriler
                           where k.ID == silinenID
                           select k).FirstOrDefault();
            //ent.Kategoriler.Remove(silinen);
            //Gerçekten silmek yerinen silindi kolonunun değeri değiştirilirse,
            silinen.silindi = true;
            try
            {
                ent.SaveChanges();
                pnlEkle.Visible = false;
                AltKategorileriGetirByKategorino(Convert.ToInt32(ddlKategoriler.SelectedValue));

            }
            catch (Exception ex)
            {
                string hata = ex.Message;
            }
        }
    }
}