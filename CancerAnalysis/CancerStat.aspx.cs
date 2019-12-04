using System;
using System.Collections.Generic;
using CancerAnalysis.Model;
using System.Web.Script.Serialization;

namespace CancerAnalysis
{
    public partial class CancerStat : System.Web.UI.Page
    {
        DatabaseHandler databaseHandler;

        protected void Page_Load(object sender, EventArgs e)
        {
            databaseHandler = new DatabaseHandler();

            GetNewCancerCasesTrends(null, null);
        }

        protected void GetNewCancerCasesTrends(object sender, EventArgs e)
        {
            List<CancerCase> data = databaseHandler.GetNewCancerCases();

            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:createNewCancerCasesTrendsChart(" + response + "); ", true);

            QueryMultiView.SetActiveView(NewCancerCasesTrends);
        }

        protected void GetCancerDeathsTrends(object sender, EventArgs e)
        {
            List<CancerCase> data = databaseHandler.GetCancerDeaths();

            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:createCancerDeathTrendsChart(" + response + "); ", true);

            QueryMultiView.SetActiveView(CancerDeathsTrends);
        }

        protected void GetNumPatientByRace(object sender, EventArgs e)
        {
            List<PatientRace> data = databaseHandler.GetPatientRace();

            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:createChartforPatientByRace(" + response + "); ", true);

            QueryMultiView.SetActiveView(RaceFact);
        }
        protected void GetNumPatientByYear(object sender, EventArgs e)
        {
            string cancer = CancerTypeddl.SelectedValue;
            List<TypeYearPatient> data = databaseHandler.GetPatientByYear(cancer);

            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:createChartforPatientByYear(" + response + "); ", true);

            QueryMultiView.SetActiveView(YearPatient);
        }

        protected void GetCancerByAge(object sender, EventArgs e)
        {
            int age = int.Parse(AgeGroupddl.SelectedValue);
            List<Agewise> data = databaseHandler.GetTopCancerByAge(age);

            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:createChartforCancerByAge(" + response + "); ", true);

            QueryMultiView.SetActiveView(CancerAge);
        }

        protected void GetStateWiseIR(object sender, EventArgs e)
        {
            List<StateWiseIR> data = databaseHandler.GetStateWiseIR();
            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:createStateWiseIRTrendChart(" + response + "); ", true);
            QueryMultiView.SetActiveView(StateIR);
        }

        protected void GetOccuranceOfCancerTypeByRace(object sender, EventArgs e)
        {
            List<PatientRace> data = databaseHandler.GetCancerTypeByRace();
            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:showCancerTypeByRace(" + response + "); ", true);
            QueryMultiView.SetActiveView(CancerTypeByRaceView);
        }

        protected void GetSurvivalRateAfterSurgery(object sender, EventArgs e)
        {
            List<CancerCase> data = databaseHandler.GetSurvivalRateAfterSurgery();
            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:showSurvivalRateGrid(" + response + "); ", true);
            QueryMultiView.SetActiveView(SurvivalRateGrid);
        }

        protected void GetNumberOfPatientByCancerType(object sender, EventArgs e)
        {
            List<CancerCase> data = databaseHandler.GetPatientCountForCancerType();
            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:showPatientCountForCancerTypeGrid(" + response + "); ", true);
            QueryMultiView.SetActiveView(PatientCountByCancerType);
        }

        protected void GetMostCommonOriginByCancerType(object sender, EventArgs e)
        {
            List<CancerCase> data = databaseHandler.GetOriginByCancerType();
            var response = new JavaScriptSerializer().Serialize(data);
            ClientScript.RegisterStartupScript(GetType(), "Javascript",
                "javascript:showOriginByCancerTypeGrid(" + response + "); ", true);
            QueryMultiView.SetActiveView(OriginByCancerType);
        }

        protected void Page_UnLoad(object sender, EventArgs e)
        {
            databaseHandler.finish();
        }
    }
}