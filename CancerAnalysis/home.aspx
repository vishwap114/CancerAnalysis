<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="CancerAnalysis.home" MasterPageFile="Master.master" %>
<asp:Content id="PageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    
<br>

	<div class="container" style="margin-top:30px">
  		<div class="row">
    		<div class="col-sm-4">
               <img src="cancer2.jpg"/>
      		</div>
            
    	<div class="col-sm-8">
      		<h2>CANCER</h2>
      		<p style="font-size: 16px">Cancer is the name given to a collection of related diseases. In all types of cancer, some of the body’s cells begin to divide without stopping and spread into surrounding tissues.
Cancer can start almost anywhere in the human body, which is made up of trillions of cells. Normally, human cells grow and divide to form new cells as the body needs them. When cells grow old or become damaged, they die, and new cells take their place.</p>
      	<br>
      		<h2>How Cancer Arises?</h2>
      		<p style="font-size: 16px">Cancer is a genetic disease—that is, it is caused by changes to genes that control the way our cells function, especially how they grow and divide.</p>
      		<p style="font-size: 16px">Genetic changes that cause cancer can be inherited from our parents. They can also arise during a person’s lifetime as a result of errors that occur as cells divide or because of damage to DNA caused by certain environmental exposures. Cancer-causing environmental exposures include substances, such as the chemicals in tobacco smoke, and radiation, such as ultraviolet rays from the sun.</p>
    	</div>
  	</div>
</div>
<div class="container" style="margin-top:30px">
    <p style="font-size: 16px">Click here to find out the number of patient records in out database</p>
    <a href="#" onserverclick="numPatients" runat="server" class="btn btn-primary">Number of Patients</a>
</div>
</asp:Content>
        
  