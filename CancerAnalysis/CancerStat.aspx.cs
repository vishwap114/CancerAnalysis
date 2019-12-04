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

        protected void GetNumPatientByRace(object sender, EventArgs e)
        {
            DatabaseHandler databaseHandler = new DatabaseHandler();
            List<PatientRace> data = databaseHandler.GetPatientRace();

            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:createChartforPatientByRace(" + response + "); ", true);

            QueryMultiView.SetActiveView(RaceFact);
        }
        protected void GetNumPatientByYear(object sender, EventArgs e)
        {
            string cancer = CancerTypeddl.SelectedValue;
            DatabaseHandler databaseHandler = new DatabaseHandler();
            List<TypeYearPatient> data = databaseHandler.GetPatientByYear(cancer);

            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:createChartforPatientByYear(" + response + "); ", true);

            QueryMultiView.SetActiveView(YearPatient);
        }

        protected void GetCancerByAge(object sender, EventArgs e)
        {
            int age = int.Parse(AgeGroupddl.SelectedValue);
            DatabaseHandler databaseHandler = new DatabaseHandler();
            List<Agewise> data = databaseHandler.GetTopCancerByAge(age);

            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:createChartforCancerByAge(" + response + "); ", true);

            QueryMultiView.SetActiveView(CancerAge);
        }

        protected void GetStateWiseIR(object sender, EventArgs e)
        {
            DatabaseHandler databaseHandler = new DatabaseHandler();
            List<StateWiseIR> data = databaseHandler.GetStateWiseIR();
            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:createStateWiseIRTrendChart(" + response + "); ", true);
            QueryMultiView.SetActiveView(StateIR);
        }



        protected void onClickT1(object sender, EventArgs e)
        {
            //QueryMultiView.SetActiveView(Trend1);
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
//            QueryMultiView.SetActiveView(Fact2);
        }
        
        protected void onClickYearPatient(object sender, EventArgs e)
        {
            QueryMultiView.SetActiveView(YearPatient);
            //int x = int.Parse(CancerTypeddl.SelectedValue);
            //if (x == 1)
               
            
                
        }
        
        protected void onClickF4(object sender, EventArgs e)
        {
            QueryMultiView.SetActiveView(Fact4);
        }
    }
}