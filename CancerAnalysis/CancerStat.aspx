<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancerStat.aspx.cs" Inherits="CancerAnalysis.CancerStat" MasterPageFile="Master.master" %>

<asp:Content id="Content1" ContentPlaceHolderID="StyleContent" runat="server"> 


    <style>
            body {
               font-family: "Times New Roman", Times, serif;
            }
            .container a{
                color:black;
                font-family:"Comic Sans MS", cursive, sans-serif
            }
            .container a:hover{
                color: rebeccapurple;
            }
        </style>
</asp:Content>


<asp:Content id="PageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        var chartColors = ["#4f81bd", "#c0504d", "#9bbb59", "#8064a2", "#4bacc6"];

        function createNewCancerCasesTrendsChart(data) {
            chartManager = new ChartManager();
            chartManager.createNewCancerCasesTrendsPieChart(data);
        }

        function createCancerDeathTrendsChart(data) {
            chartManager = new ChartManager();
            chartManager.createCancerDeathTrendsPieChart(data);
        }

        function createChartforPatientByRace(data){
            chartManager = new ChartManager();
            chartManager.createPatientByRaceBarChart(data);
        }

         function createChartforPatientByYear(data){
            chartManager = new ChartManager();
            chartManager.createPatientByYearBarChart(data);
        }

        function createChartforCancerByAge(data){
            chartManager = new ChartManager();
            chartManager.createChartforCancerByAgeChart(data);
        }

        function createStateWiseIRTrendChart(data) {
            chartManager = new ChartManager();
            chartManager.createStateWiseIRChart(data);
        }

        class ChartManager {
            createNewCancerCasesTrendsPieChart(data) {
                for (var i = 0; i < data.length; i++) {
                    data[i].color = chartColors[i];
                }

                am4core.useTheme(am4themes_material);
                am4core.useTheme(am4themes_animated);

                var chart = am4core.create("newCancerCasesChartDiv", am4charts.PieChart);
                chart.data = data;

                var pieSeries = chart.series.push(new am4charts.PieSeries());
                pieSeries.dataFields.value = "TotalCases";
                pieSeries.dataFields.category = "CancerType";

                pieSeries.slices.template.propertyFields.fill = "color";
                pieSeries.slices.template.stroke = am4core.color("#fff");
                pieSeries.slices.template.strokeWidth = 2;
                pieSeries.slices.template.strokeOpacity = 1;

                // This creates initial animation
                pieSeries.hiddenState.properties.opacity = 1;
                pieSeries.hiddenState.properties.endAngle = -90;
                pieSeries.hiddenState.properties.startAngle = -90;
            }

            createCancerDeathTrendsPieChart(data) {
                am4core.useTheme(am4themes_material);
                am4core.useTheme(am4themes_animated);

                var chart = am4core.create("cancerDeathsChartDiv", am4charts.PieChart);
                chart.data = data;

                var pieSeries = chart.series.push(new am4charts.PieSeries());
                pieSeries.dataFields.value = "TotalDeaths";
                pieSeries.dataFields.category = "CancerType";

                pieSeries.slices.template.propertyFields.fill = "color";
                pieSeries.slices.template.stroke = am4core.color("#fff");
                pieSeries.slices.template.strokeWidth = 2;
                pieSeries.slices.template.strokeOpacity = 1;

                // This creates initial animation
                pieSeries.hiddenState.properties.opacity = 1;
                pieSeries.hiddenState.properties.endAngle = -90;
                pieSeries.hiddenState.properties.startAngle = -90;
            }

            createPatientByRaceBarChart(data) {
                am4core.useTheme(am4themes_material);
                am4core.useTheme(am4themes_animated);

                var chart = am4core.create("patientRaceChartDiv", am4charts.XYChart);
                chart.data = data;
                var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
                categoryAxis.dataFields.category = "Race";
                var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

                // Create series
                var series = chart.series.push(new am4charts.ColumnSeries());
                series.dataFields.valueY = "Num_Patients";
                series.dataFields.categoryX = "Race";
            }
            createPatientByYearBarChart(data) {
                am4core.useTheme(am4themes_material);
                am4core.useTheme(am4themes_animated);

                var chart = am4core.create("TypeYearPatientdiv", am4charts.XYChart);
                chart.data = data;
                var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
                categoryAxis.dataFields.category = "Year";
                var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

                // Create series
                var series = chart.series.push(new am4charts.ColumnSeries());
                series.dataFields.valueY = "Patients";
                series.dataFields.categoryX = "Year";
            }
            createChartforCancerByAgeChart(data) {
                am4core.useTheme(am4themes_material);
                am4core.useTheme(am4themes_animated);

                var chart = am4core.create("CancerAgePatientdiv", am4charts.XYChart);
                chart.data = data;
                var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
                categoryAxis.dataFields.category = "CancerType";
                var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

                // Create series
                var series = chart.series.push(new am4charts.ColumnSeries());
                series.dataFields.valueY = "Patients";
                series.dataFields.categoryX = "CancerType";
            }

            createStateWiseIRChart(data) {
                //var chart = am4core.create("StateIRchartdiv", am4maps.MapChart);

                //// Set map definition
                //chart.geodata = am4geodata_usaLow;

                //// Set projection
                //chart.projection = new am4maps.projections.AlbersUsa();

                //// Create map polygon series
                //var polygonSeries = chart.series.push(new am4maps.MapPolygonSeries());
                //polygonSeries.useGeodata = true;

                //// Configure series
                //var polygonTemplate = polygonSeries.mapPolygons.template;
                //polygonTemplate.tooltipText = "{State}: {IncidenceRate}";
                //polygonTemplate.fill = am4core.color("#74B266");

                am4core.useTheme(am4themes_material);
                am4core.useTheme(am4themes_animated);

                var chart = am4core.create("StateIRchartdiv", am4charts.XYChart);
                chart.data = data;
                var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
                categoryAxis.dataFields.category = "State";
                var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

                // Create series
                var series = chart.series.push(new am4charts.ColumnSeries());
                series.dataFields.valueY = "IncidenceRate";
                series.dataFields.categoryX = "State";

               

                //
            }

        }
    </script>

<div class="container" style="margin-top:30px; color:black" runat="server">
  		<div class="row">
    		<div class="col-sm-4">
      			<h2 style="font-weight:900; text-decoration:underline">Cancer Statistics and Trends in USA</h2>
  
                <div runat="server"> <h3 style="font-weight:800">Trends:</h3>
      			<ul class="nav nav-pills flex-column" style="font-size:15px; color:black">
        			<li class="nav-item">
          			<a class="nav-link" href="#"  onServerClick="onClickT1" runat="server" >Occurence of Cancer Type according to Race</a>
        			</li>
        			<li class="nav-item">
			          <a class="nav-link" href="#" onServerClick="onClickT2" runat="server" >Survival rate after a surgery for cancer</a>
			        </li>
                     <li class="nav-item">
			          <a class="nav-link" href="#" runat="server" >Popular cancer type according to different age groups
                           <asp:DropDownList ID="AgeGroupddl" runat="server" OnSelectedIndexChanged="GetCancerByAge" AutoPostBack="true">
                                <asp:ListItem Value="Please select Age Group:">  </asp:ListItem>
                                <asp:ListItem Value="1"> 0 to 20 years </asp:ListItem>
                                <asp:ListItem Value="2"> 20 to 40 years </asp:ListItem>
                               <asp:ListItem Value="3"> 40 to 60 years </asp:ListItem>
                               <asp:ListItem Value="4"> 60 plus years </asp:ListItem>

                            </asp:DropDownList>
			          </a>
			        </li>
                    <li class="nav-item">
			          <a class="nav-link" href="#" runat="server">Patient count for cancer type according to year of diagnosis
                        <asp:DropDownList ID="CancerTypeddl" runat="server" style="float:left" OnSelectedIndexChanged="GetNumPatientByYear" AutoPostBack="true">
                            <asp:ListItem Value="Please select Cancer Type">  </asp:ListItem>
                            <asp:ListItem Value="Acute Lymphocytic Leukemia"></asp:ListItem>
                            <asp:ListItem Value="Acute Monocytic Leukemia"></asp:ListItem>
                            <asp:ListItem Value="Acute Myeloid Leukemia"></asp:ListItem>
                            <asp:ListItem Value="Aleukemic, Subleukemic and NOS"></asp:ListItem>
                            <asp:ListItem Value="Appendix"></asp:ListItem>
                            <asp:ListItem Value="Ascending Colon"></asp:ListItem>
                            <asp:ListItem Value="Breast"></asp:ListItem>
                            <asp:ListItem Value="Cecum"></asp:ListItem>
                            <asp:ListItem Value="Chronic Lymphocytic Leukemia"></asp:ListItem>
                            <asp:ListItem Value="Chronic Myeloid Leukemia"></asp:ListItem>
                            <asp:ListItem Value="Descending Colon"></asp:ListItem>
                            <asp:ListItem Value="Hepatic Flexure"></asp:ListItem>
                            <asp:ListItem Value="Kidney and Renal Pelvis"></asp:ListItem>
                            <asp:ListItem Value="Large Intestine, NOS"></asp:ListItem>
                            <asp:ListItem Value="Liver"></asp:ListItem>
                            <asp:ListItem Value="Lung and Bronchus"></asp:ListItem>
                            <asp:ListItem Value="Melanoma of the Skin"></asp:ListItem>
                            <asp:ListItem Value="Other Acute Leukemia"></asp:ListItem>
                            <asp:ListItem Value="Other Lymphocytic Leukemia"></asp:ListItem>
                            <asp:ListItem Value="Other Myeloid/Monocytic Leukemia"></asp:ListItem>
                            <asp:ListItem Value="Pancreas"></asp:ListItem>
                            <asp:ListItem Value="Prostate"></asp:ListItem>
                            <asp:ListItem Value="Rectosigmoid Junction"></asp:ListItem>
                            <asp:ListItem Value="Rectum"></asp:ListItem>
                            <asp:ListItem Value="Sigmoid Colon"></asp:ListItem>
                            <asp:ListItem Value="Splenic Flexure"></asp:ListItem>
                            <asp:ListItem Value="Stomach"></asp:ListItem>
                            <asp:ListItem Value="Thyroid"></asp:ListItem>
                            <asp:ListItem Value="Transverse Colon"></asp:ListItem>
                            <asp:ListItem Value="Urinary Bladder"></asp:ListItem>

                        </asp:DropDownList>
                          </a>
			        </li>
			       
			     
			    </ul>
                </div>
                <div runat="server" style="margin-top:3%" > <h3 style="font-weight:800">Facts:</h3>
      			<ul class="nav nav-pills flex-column"  style="font-size:15px; color:black">
        			<li class="nav-item">
          			    <a class="nav-link" href="#" onServerClick="GetNewCancerCasesTrends" runat="server">New cancer cases trend this year</a>
        			</li>
                    <li class="nav-item">
          			    <a class="nav-link" href="#" onServerClick="GetCancerDeathsTrends" runat="server">Cancer deaths trend this year</a>
        			</li>
                    <li class="nav-item">
          			<a class="nav-link" href="#" onServerClick="GetNumPatientByRace" runat="server">Number of patients for each race</a>
        			</li>
                      <li class="nav-item">
			          <a class="nav-link" href="#" onServerClick="GetStateWiseIR" runat="server">State Wise Incidence Rate</a>
			        </li>
        			<li class="nav-item">
			          <a class="nav-link" href="#" onServerClick="onClickF2" runat="server">Number of patients for each cancer type</a>
			        </li>
			        
                    <li class="nav-item">
			          <a class="nav-link" href="#" onServerClick="onClickF4" runat="server">Most common Origin accoring to cancer type</a>
			        </li>
			        <%--<li class="nav-item">
			          <a class="nav-link disabled" href="#">Disabled</a>
			        </li>--%>
			    </ul>
                </div>
      			<hr class="d-sm-none">
    		</div>
    	<div class="col-sm-8">
      		<asp:MultiView runat="server" id="QueryMultiView">
                <asp:View id="NewCancerCasesTrends" runat="server">
                    <div style="width:100%;height:100%;float:left;margin-bottom:30px;">
                        <div style="text-align:center;font-size:2em;font-weight:bold;color:#333;margin-bottom:.5em;">New Cancer Cases, 2016</div>
                        <div id="newCancerCasesChartDiv" style="display:inline-block;position:relative;width:100%;height:80%;vertical-align:middle;overflow:hidden;"/>
                    </div>
                </asp:View>

                <asp:View id="CancerDeathsTrends" runat="server">
                    <div style="width:100%;height:100%;float:left;margin-bottom:30px;">
                        <div style="text-align:center;font-size:2em;font-weight:bold;color:#333;margin-bottom:.5em;">Cancer Deaths, 2016</div>
                        <div id="cancerDeathsChartDiv" style="display:inline-block;position:relative;width:100%;height:80%;vertical-align:middle;overflow:hidden;"/>
                    </div>
                </asp:View>
               
                <asp:View id="Trend1" runat="server">
                    
                <div class="Login"> hello   </div>
                </asp:View>
                <asp:View id="Trend2" runat="server">
                   
                <div class="Login"> hello2 </div>
                </asp:View>
                  
                <asp:View id="RaceFact" runat="server">
                    <div style="width:100%;height:100%;float:left;margin-bottom:30px;">
                        <div style="text-align:center;font-size:2em;font-weight:bold;color:#333;margin-bottom:.5em;">Number of Patient Grouped by Race</div>
                        <div id="patientRaceChartDiv" style="display:inline-block;position:relative;width:100%;height:80%;vertical-align:middle;overflow:hidden;"/>
                    </div>
                </asp:View>

                <asp:View id="Fact1" runat="server">
                   
                <div class="Login"> hello3 </div>
                </asp:View>
                
                <asp:View id="YearPatient" runat="server">
                   
                   <div style="width:100%;height:100%;float:left;margin-bottom:30px;">
                            <div style="text-align:center;font-size:2em;font-weight:bold;color:#333;margin-bottom:.5em;">Number of Patients according to Year</div>
                            <div id="TypeYearPatientdiv" style="display:inline-block;position:relative;width:100%;height:80%;vertical-align:middle;overflow:hidden;"/>
                        </div>
                </asp:View>
                 <asp:View id="CancerAge" runat="server">
                   
                   <div style="width:100%;height:100%;float:left;margin-bottom:30px;">
                            <div style="text-align:center;font-size:2em;font-weight:bold;color:#333;margin-bottom:.5em;">Top 5 Cancers by Age Group</div>
                            <div id="CancerAgePatientdiv" style="display:inline-block;position:relative;width:100%;height:80%;vertical-align:middle;overflow:hidden;"/>
                        </div>
                </asp:View>

                  <asp:View id="StateIR" runat="server">
                    <div style="width:100%;height:100%;float:left;margin-bottom:30px;">
                        <div style="text-align:center;font-size:2em;font-weight:bold;color:#333;margin-bottom:.5em;">State Wise Incidence Rate</div>
                        <div id="StateIRchartdiv" style="display:inline-block;position:relative;width:100%;height:80%;vertical-align:middle;overflow:hidden;"/>
                    </div>
                </asp:View>
                  <asp:View id="Fact3Type2" runat="server">
                   
                <div class="Login"> hello2 </div>
                </asp:View>
                <asp:View id="Fact4" runat="server">
                   
                <div class="Login"> hello3 </div>
                </asp:View>

      		</asp:MultiView>
    	</div>
  	</div>

</div>


</asp:Content>
        
  