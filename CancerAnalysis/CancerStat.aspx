<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancerStat.aspx.cs" Inherits="CancerAnalysis.CancerStat" MasterPageFile="Master.master" %>

<asp:Content id="PageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
        
  