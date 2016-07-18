using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSaglikProjesi.Admin
{
    public partial class KategoriEkle : System.Web.UI.Page
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
                }
            }
        }
        private void KategorileriGetir()
        {
            var categories = (from k in ent.Kategoriler
                              where k.silindi == false
                              select k).ToList();
            gvKategoriler.DataSource = categories;
            gvKategoriler.DataBind();
        }
        protected void lbYeniKategori_Click(object sender, EventArgs e)
        {
            pnlEkle.Visible = true;
            gvKategoriler.SelectedIndex = -1;
            Temizle();
            txtKategori.Focus();
        }
        protected void gvKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlEkle.Visible = true;
            txtKategori.Text = HttpUtility.HtmlDecode(gvKategoriler.SelectedRow.Cells[1].Text);
            txtAciklama.Text = HttpUtility.HtmlDecode(gvKategoriler.SelectedRow.Cells[2].Text);
            txtKategori.Focus();
        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (txtKategori.Text.Trim() != "")
            {
                DataModel.Kategoriler k = new DataModel.Kategoriler();
                k.kategoriad = txtKategori.Text;
                k.aciklama = txtAciklama.Text;
                ent.Kategoriler.Add(k);
                try
                {
                    ent.SaveChanges();
                    pnlEkle.Visible = false;
                    KategorileriGetir();

                }
                catch (Exception ex)
                {
                    string hata = ex.Message;
                }
            }
        }
        private void Temizle()
        {
            txtKategori.Text = "";
            txtAciklama.Text = "";
        }

        protected void btnDegistir_Click(object sender, EventArgs e)
        {
            int degisenID = Convert.ToInt32(gvKategoriler.SelectedValue);
            var degisen = (from k in ent.Kategoriler
                           where k.ID == degisenID
                           select k).FirstOrDefault();
            degisen.kategoriad = txtKategori.Text;
            degisen.aciklama = txtAciklama.Text;
            try
            {
                ent.SaveChanges();
                pnlEkle.Visible = false;
                KategorileriGetir();

            }
            catch (Exception ex)
            {
                string hata = ex.Message;
            }
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            int silinenID = Convert.ToInt32(gvKategoriler.SelectedValue);
            var silinen = (from k in ent.Kategoriler
                           where k.ID == silinenID
                           select k).FirstOrDefault();
            //ent.Kategoriler.Remove(silinen);
            //Gerçekten silmek yerinen silindi kolonunun değeri değiştirilirse,
            silinen.silindi = true;
            try
            {
                ent.SaveChanges();
                pnlEkle.Visible = false;
                KategorileriGetir();

            }
            catch (Exception ex)
            {
                string hata = ex.Message;
            }
        }
    }
}