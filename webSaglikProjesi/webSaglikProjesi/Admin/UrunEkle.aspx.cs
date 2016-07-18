using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSaglikProjesi.Admin
{
    public partial class UrunEkle : System.Web.UI.Page
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
                    UrunleriGetir();
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
        private void AltKategorileriGetirByKategorino(int KNo)
        {
            var subcategories = (from ak in ent.AltKategoriler
                                 where ak.silindi == false && ak.kategorino == KNo
                                 select ak).ToList();
            ddlAltkategoriler.DataTextField = "altkategoriad";
            ddlAltkategoriler.DataValueField = "ID";
            ddlAltkategoriler.DataSource = subcategories;
            ddlAltkategoriler.DataBind();
        }
        protected void ddlKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            AltKategorileriGetirByKategorino(Convert.ToInt32(ddlKategoriler.SelectedValue));
            UrunleriGetir();
        }

        protected void ddlAltKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            UrunleriGetir();
        }

        private void UrunleriGetir()
        {
            int kno = Convert.ToInt32(ddlKategoriler.SelectedValue);
            int altkno = Convert.ToInt32(ddlAltkategoriler.SelectedValue);
            var products = (from u in ent.Urunler
                            where u.urunkategorino == kno && u.urunaltkategorino == altkno && u.silindi == false
                            select u).ToList();
            gvUrunler.DataSource = products;
            gvUrunler.DataBind();
        }
        protected void gvUrunler_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlEkle.Visible = true;
            txtUrunKodu.Text = HttpUtility.HtmlDecode(gvUrunler.SelectedRow.Cells[2].Text);
            txtUrunAdi.Text = HttpUtility.HtmlDecode(gvUrunler.SelectedRow.Cells[3].Text);
            txtUrunBilgisi.Text = HttpUtility.HtmlDecode(gvUrunler.SelectedRow.Cells[8].Text);
            txtMiktar.Text = HttpUtility.HtmlDecode(gvUrunler.SelectedRow.Cells[6].Text);
            txtFiyat.Text = HttpUtility.HtmlDecode(gvUrunler.SelectedRow.Cells[7].Text);
            txtMiktar.Focus();
        }

        protected void lbYeniUrun_Click(object sender, EventArgs e)
        {
            pnlEkle.Visible = true;
            gvUrunler.SelectedIndex = -1;
            Temizle();
            btnDegistir.Enabled = false;
            btnSil.Enabled = false;
            btnKaydet.Enabled = true;
            txtUrunKodu.Focus();
        }
        private void Temizle()
        {

            txtUrunKodu.Text = "";
            txtUrunAdi.Text = "";
            txtUrunBilgisi.Text = "";
            txtMiktar.Text = "1";
            txtFiyat.Text = "0";
            txtUrunKodu.Focus();
        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (txtUrunKodu.Text.Trim() != "" && txtUrunAdi.Text.Trim() != "")
            {
                if (fuKucukResim.HasFile)//Bir dosya seçtiyse
                {
                    fuKucukResim.SaveAs(Server.MapPath("/Content/urunimages/images/" + fuKucukResim.FileName));
                }
                if (fuBuyukResim.HasFile)//Bir dosya seçtiyse
                {
                    fuBuyukResim.SaveAs(Server.MapPath("/Content/urunimages/images/buyuk/" + fuBuyukResim.FileName));
                }
                DataModel.Urunler u = new DataModel.Urunler();
                u.urunkodu = txtUrunKodu.Text;
                u.urunad = txtUrunAdi.Text;
                u.urunbilgisi = txtUrunBilgisi.Text;
                u.miktar = Convert.ToInt32(txtMiktar.Text);
                u.urunfiyat = Convert.ToDecimal(txtFiyat.Text);
                u.urunkategorino = Convert.ToInt32(ddlKategoriler.SelectedValue);
                u.urunaltkategorino = Convert.ToInt32(ddlAltkategoriler.SelectedValue);
                u.urunresimyolu1 = "/Content/urunimages/images/" + fuKucukResim.FileName;
                u.urunresimyolu2 = "/Content/urunimages/images/buyuk/" + fuBuyukResim.FileName;
                ent.Urunler.Add(u);
                try
                {
                    ent.SaveChanges();
                    pnlEkle.Visible = false;
                    UrunleriGetir();

                }
                catch (Exception ex)
                {
                    string hata = ex.Message;
                }
            }
        }

        protected void btnDegistir_Click(object sender, EventArgs e)
        {

        }

        protected void btnSil_Click(object sender, EventArgs e)
        {

        }
    }
}