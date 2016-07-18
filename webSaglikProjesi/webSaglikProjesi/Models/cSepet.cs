using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace webSaglikProjesi.Models
{
    public class cSepet
    {
        public DataTable YeniSepet()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("sepetID");//sepetID adında bir kolon oluşturduk.
            dt.Columns["sepetID"].DataType = typeof(int);//sepetID nin türünü belirledik int olarak.
            dt.Columns["sepetID"].AutoIncrement = true;//sepetID nin otomatik artış özelliğini açtık veri tabandaki gibi.
            dt.Columns["sepetID"].AutoIncrementSeed = 1;//sepetID nin 1 den başlatıp.
            dt.Columns["sepetID"].AutoIncrementStep = 1;//Artış miktarını da 1 er 1 er yaptık.

            dt.Columns.Add("urunID");
            dt.Columns["urunID"].DataType = typeof(int);

            dt.Columns.Add("urunAd");
            dt.Columns["urunAd"].DataType = typeof(string);

            dt.Columns.Add("adet");
            dt.Columns["adet"].DataType = typeof(int);
            dt.Columns["adet"].DefaultValue = 1;//Adete default değer olarak 1 verdik.

            dt.Columns.Add("fiyat");
            dt.Columns["fiyat"].DataType = typeof(decimal);
            dt.Columns["fiyat"].DefaultValue = 0;

            dt.Columns.Add("tutar");
            dt.Columns["tutar"].DataType = typeof(decimal);
            dt.Columns["tutar"].DefaultValue = 0;

            return dt;
        }
    }
}