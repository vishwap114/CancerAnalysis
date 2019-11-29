using System;
using System.Collections.Generic;
using CancerAnalysis.Model;
using System.Web.Script.Serialization;

namespace CancerAnalysis
{
    public partial class CancerStat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GetNewCancerCasesTrends(object sender, EventArgs e)
        {
            DatabaseHandler databaseHandler = new DatabaseHandler();
            List<CancerCase> data = databaseHandler.GetNewCancerCases();

            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:createNewCancerCasesTrendsChart(" + response + "); ", true);

            QueryMultiView.SetActiveView(NewCancerCasesTrends);
        }

        protected void GetCancerDeathsTrends(object sender, EventArgs e)
        {
            DatabaseHandler databaseHandler = new DatabaseHandler();
            List<CancerCase> data = databaseHandler.GetCancerDeaths();

            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:createCancerDeathTrendsChart(" + response + "); ", true);

            QueryMultiView.SetActiveView(CancerDeathsTrends);
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