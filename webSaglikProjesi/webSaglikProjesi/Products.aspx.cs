using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webSaglikProjesi.Models;//ekledik.

namespace webSaglikProjesi
{
    public partial class Products : System.Web.UI.Page
    {
        DataModel.SaglikUrunleriEntities ent = new DataModel.SaglikUrunleriEntities();
        cSepet spt = new cSepet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UrunleriGetir();
            }
        }

        private void UrunleriGetir()
        {
            int kno = Convert.ToInt32(Request.QueryString["kno"]);
            int altkno = Convert.ToInt32(Request.QueryString["akno"]);
            if (altkno == 0)
            {
                var Uruns = (from urun in ent.Urunler
                             where urun.urunkategorino == kno && urun.silindi == false
                             select urun).ToList();
                dlstUrunler.DataSource = Uruns;
                dlstUrunler.DataBind();
            }
            else
            {
                var Uruns = (from urun in ent.Urunler
                             where urun.urunkategorino == kno && urun.urunaltkategorino == altkno && urun.silindi == false
                             select urun).ToList();
                dlstUrunler.DataSource = Uruns;
                dlstUrunler.DataBind();
            }
            if (Session["sepet"] != null)//burada sepet boş değilse sepetten eklenen ürün, sepet özeti kısmına ürün adı ve adet bilgileri getirilecek.
            {
                DataTable dt = (DataTable)Session["sepet"];
                GridView gvOzet = (GridView)this.Master.FindControl("gvSepetOzet");
                gvOzet.Columns[0].FooterText = "Toplam";
                gvOzet.Columns[1].FooterText = string.Format("{0:C}", ToplamTutarBul());
                gvOzet.DataSource = dt;
                gvOzet.DataBind();
            }
        }

        protected void dlstUrunler_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "detay")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Details.aspx?urunid=" + id);
            }
            else if (e.CommandName == "sepet")
            {
                if (Session["sepet"] == null)//Eğer session["sepet"] kullanılmamıssa yani boşşa daha önceden oluşturulmamıssa
                {
                    Session["sepet"] = spt.YeniSepet();//yeni sepet oluşturup bunu sepete at.
                }
                DataTable dt = (DataTable)Session["sepet"];//bana öyle bir DataTable yapki session["sepet"] teki gibi bir data table olsun
                DataRow dr;
                int ID = Convert.ToInt32(e.CommandArgument);//CommandArgument olarak tanımlanan ID de tıklananın kini al
                Label UrunAdi = (Label)e.Item.FindControl("lblUrunAd");//tıklananın ürün adını al.
                Label Fiyat = (Label)e.Item.FindControl("lblFiyat");//tıklananın fiyatını al.
                string[] Degerler = Fiyat.Text.Split(' ');//{0:C} formatından dolayı gelen senbolü kaldırmak için
                Fiyat.Text = Degerler[0];
                TextBox Adet = (TextBox)e.Item.FindControl("txtAdet");//tıklananın adetini al.
                bool Varmi = false;//sepete aynı ürün eklendiğinde adeti ve tutarı eklediğimizde aynı ürünü eklemek yerine adetini ve tutarını arttırsın
                //Sepeti(DataTable) kontrol ediyoruz eklenmek istenen ürün önceden seçilmiş mi? 
                foreach (DataRow urun in dt.Rows)
                {
                    if (Convert.ToInt32(urun["UrunID"]) == ID)
                    {
                        Varmi = true;
                        urun["adet"] = Convert.ToInt32(urun["adet"]) + Convert.ToInt32(Adet.Text);
                        urun["tutar"] = Convert.ToDecimal(urun["tutar"]) + (Convert.ToInt32(Adet.Text) * Convert.ToDecimal(Fiyat.Text));
                        break;
                    }
                }
                if (Varmi == false)
                {
                    dr = dt.NewRow();//dt nin yeni bir satırı olucak.
                    dr["urunID"] = ID;//DataRow un kolanlarına ekledik.
                    dr["urunAd"] = UrunAdi.Text;
                    dr["adet"] = Convert.ToInt32(Adet.Text);
                    dr["fiyat"] = Convert.ToDecimal(Fiyat.Text);
                    dr["tutar"] = Convert.ToInt32(Adet.Text) * Convert.ToDecimal(Fiyat.Text);
                    dt.Rows.Add(dr);//eklenen satırları yani rowları datatable a dt ye ekledik.
                }
                Session["sepet"] = dt;//daha sonra bu dt leri sepet sessiona ekledik.
                Response.Redirect("Sepet.aspx");
                //Response.Redirect("Sepet.aspx");
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
    }
}