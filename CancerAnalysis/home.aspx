<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="CancerAnalysis.home" MasterPageFile="Master.master" %>

<asp:Content id="Content1" ContentPlaceHolderID="StyleContent" runat="server"> 


    <style>
        body {
               font-family: "Times New Roman", Times, serif;
            }

.flip-card {
  background-color: transparent;
  width: 300px;
  height: 300px;
  perspective: 1000px;
}

.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.6s;
  transform-style: preserve-3d;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
}

.flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}

.flip-card-front, .flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
}

.flip-card-front {
  background-color: #bbb;
  color: black;
}

.flip-card-back {
  background-color: #C0C3D255;
  color: black;
  transform: rotateY(180deg);
}
</style>
</asp:Content>
<asp:Content id="PageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    
<br>

	<div class="container" style="margin-top:30px">
  		<div class="row">

            <div class="col-sm-4">

              <div class="flip-card">
                  <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <%--<h2>CANCER</h2>--%>
                      <img src="whatcancer.png" alt="Avatar" style="width:300px;height:300px;">
                    </div>
                    <div class="flip-card-back">

                        <p style="font-size: 16px">Cancer is the name given to a collection of related diseases. In all types of cancer, some of the body’s cells begin to divide without stopping and spread into surrounding tissues.
Cancer can start almost anywhere in the human body, which is made up of trillions of cells. Normally, human cells grow and divide to form new cells as the body needs them. When cells grow old or become damaged, they die, and new cells take their place.</p>
      	<br>
                    </div>
                  </div>
                </div>
            </div>


    		<div class="col-sm-4">
               <img src="bg.jpg" style="width:100%; height: 120%"/>
      		</div>



              <div class="col-sm-4">
              <div class="flip-card">
                  <div class="flip-card-inner">
                    <div class="flip-card-front">
                       <%-- <h2>How Cancer Arises?</h2>--%>
                      <img src="howcancer.jpg" alt="Avatar" style="width:300px;height:300px;">
                    </div>
                    <div class="flip-card-back">

                        <p style="font-size: 16px">Cancer is a genetic disease—that is, it is caused by changes to genes that control the way our cells function, especially how they grow and divide.
      		Genetic changes that cause cancer can be inherited from our parents. They can also arise during a person’s lifetime as a result of errors that occur as cells divide or because of damage to DNA caused by certain environmental exposures. 
                  Cancer-causing environmental exposures include substances, such as the chemicals in tobacco smoke, and radiation from sun.</p>
  
                    </div>
                  </div>
                </div>
            </div>
            
    	
  	</div>
</div>
<div class="container" style="margin-top:5%; float:left; width: max-content; margin-bottom:2%">
    <p style="font-size: 15px; float:left; margin:2%; color:grey">Click here to find out the number of tuples in our database:</p>
    <asp:Button ID="tupleButton" runat="server" OnClick="tupleButton_Click" Text="Click Me!"  class="btn btn-primary"   style="font-size:15px;color:black; background-color:lightgray; border-color:lightgray; margin: 2%"/>
</div>


</asp:Content>
        
  