using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSaglikProjesi
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        DataModel.SaglikUrunleriEntities ent = new DataModel.SaglikUrunleriEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var categories = (from category in ent.Kategoriler
                                  where category.silindi == false
                                  select category).ToList();
                foreach (var kategori in categories)
                {
                    MenuItem mitm = new MenuItem();
                    mitm.Text = kategori.kategoriad;
                    mitm.Value = kategori.ID.ToString();
                    mnuKategoriler.Items.Add(mitm);
                    var subcategories = (from subcategory in ent.AltKategoriler
                                         where subcategory.silindi == false && subcategory.kategorino == kategori.ID
                                         select subcategory).ToList();
                    foreach (var altkategori in subcategories)
                    {
                        MenuItem citm = new MenuItem();
                        citm.Text = altkategori.altkategoriad;
                        citm.Value = altkategori.ID.ToString();
                        mitm.ChildItems.Add(citm);
                    }
                }
            }
        }

        protected void mnuKategoriler_MenuItemClick(object sender, MenuEventArgs e)
        {
            //Response.Write("Kategori : " + e.Item.Text + ", ID : " + e.Item.Value);

            //Response.Write("Yol : " + e.Item.ValuePath);

            string[] Degerler = e.Item.ValuePath.Split('/');
            int altkno = 0;
            if (Degerler.Length > 1)
            {
                altkno = Convert.ToInt32(Degerler[1]);
            }
            Response.Redirect("Products.aspx?kno=" + Degerler[0] + "&akno=" + altkno);
        }
    }
}