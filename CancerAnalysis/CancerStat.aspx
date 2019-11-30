<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancerStat.aspx.cs" Inherits="CancerAnalysis.CancerStat" MasterPageFile="Master.master" %>

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
        }
    </script>

<div class="container" style="margin-top:30px" runat="server">
  		<div class="row">
    		<div class="col-sm-4">
      			<h3>Some Links</h3>
      			<p>Lorem ipsum dolor sit ame.</p>
                <div runat="server"> Trends
      			<ul class="nav nav-pills flex-column">
        			<li class="nav-item">
          			<a class="nav-link" href="#"  onServerClick="onClickT1" runat="server">Occurence of Cancer Type according to Race</a>
        			</li>
        			<li class="nav-item">
			          <a class="nav-link" href="#" onServerClick="onClickT2" runat="server" >Survival rate after a surgery for cancer</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="#">Link</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link disabled" href="#">Disabled</a>
			        </li>
			    </ul>
                </div>
                <div runat="server"> Facts
      			<ul class="nav nav-pills flex-column">
        			<li class="nav-item">
          			    <a class="nav-link" href="#" onServerClick="GetNewCancerCasesTrends" runat="server">New cancer cases trend this year</a>
        			</li>
                    <li class="nav-item">
          			    <a class="nav-link" href="#" onServerClick="GetCancerDeathsTrends" runat="server">Cancer deaths trend this year</a>
        			</li>
                    <li class="nav-item">
          			<a class="nav-link" href="#" onServerClick="onClickF1" runat="server">New cancer cases trend this year</a>
        			</li>
                    <li class="nav-item">
          			<a class="nav-link" href="#" onServerClick="onClickF1" runat="server">Number of patients for each race</a>
        			</li>
        			<li class="nav-item">
			          <a class="nav-link" href="#" onServerClick="onClickF2" runat="server">Number of patients for each cancer type</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="#" onServerClick="onClickF3" runat="server">Patient count for cancer type according to year of diagnosis</a>
			        </li>
                    <li class="nav-item">
			          <a class="nav-link" href="#" onServerClick="onClickF4" runat="server">Most common Origin accoring to cancer type</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link disabled" href="#">Disabled</a>
			        </li>
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
                <asp:View id="Fact1" runat="server">
                   
                <div class="Login"> hello3 </div>
                </asp:View>
                <asp:View id="Fact2" runat="server">
                   
                <div class="Login"> hello3 </div>
                </asp:View>
                  <asp:View id="Fact3" runat="server">
                   
                <div class="Login"> hello3 </div>
                </asp:View>
                <asp:View id="Fact4" runat="server">
                   
                <div class="Login"> hello3 </div>
                </asp:View>

      		</asp:MultiView>
    	</div>
  	</div>

</div>


</asp:Content>
        
  