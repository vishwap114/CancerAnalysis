using System;

namespace CancerAnalysis
{
    public partial class home : System.Web.UI.Page
    {
        DatabaseHandler databaseHandler;

        protected void Page_Load(object sender, EventArgs e)
        {
            databaseHandler = new DatabaseHandler();
        }

        protected void tupleButton_Click(object sender, EventArgs e)
        {
            long count = new DatabaseHandler().GetTupleCount();
            tupleButton.Text = GetTupleCountInWords(count);
        }

        private string GetTupleCountInWords(long count)
        {
            string words = "";
            if ((count / 1000000) > 0)
            {
                words += ((float)count / 1000000.0).ToString().Substring(0, 3) + " million.";
                return words;
            }

            if ((count / 1000) > 0)
            {
                words += (count / 1000) + " thousand.";
                return words;
            }

            return words;
        }

        protected void Page_UnLoad(object sender, EventArgs e)
        {
            databaseHandler.finish();
        }
    }
}