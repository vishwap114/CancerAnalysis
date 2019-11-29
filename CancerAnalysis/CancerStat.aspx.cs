using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CancerAnalysis
{
    public partial class CancerStat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void onClickT1(object sender, EventArgs e)
        {
            QueryMultiView.SetActiveView(Trend1);
        }
        protected void onClickT2(object sender, EventArgs e)
        {
            QueryMultiView.SetActiveView(Trend2);
        }
        protected void onClickF1(object sender, EventArgs e)
        {
            QueryMultiView.SetActiveView(Fact1);
        }
        protected void onClickF2(object sender, EventArgs e)
        {
            QueryMultiView.SetActiveView(Fact2);
        }
        protected void onClickF3(object sender, EventArgs e)
        {
            QueryMultiView.SetActiveView(Fact3);
        }
        protected void onClickF4(object sender, EventArgs e)
        {
            QueryMultiView.SetActiveView(Fact4);
        }
    }
}