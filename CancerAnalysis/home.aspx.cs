using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CancerAnalysis
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DatabaseHandler db = new DatabaseHandler();
            var temp = db.GetNewCancerCases();
        }
        //protected void allPatients(object sender, EventArgs e)
        //{

        //}
    }
}