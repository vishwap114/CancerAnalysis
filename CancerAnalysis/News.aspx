<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="CancerAnalysis.News" MasterPageFile="Master.master" %>
<asp:Content id="Content1" ContentPlaceHolderID="StyleContent" runat="server"> 


    <style>
            body {
               font-family: "Times New Roman", Times, serif;
            }
            
        </style>
</asp:Content>

            <asp:Content id="PageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    
                <div style="text-align:center; height:100%; width:100%">
                <div class="card" style=" padding: 2%; margin: 2%;  float:left; width: 27.5%; height:50%; border:none"   >
                  
                  <div class="card-body">
                    <h5 class="card-title" style="font-size:25px">The Latest Cancer News</h5>
                    <p class="card-text" style="font-size:18px">Read the latest cancer news on topics ranging from prevention to treatment. Also get advice on managing cancer, including research, diagnosis, treatment and recovery.</p>
                    <a href="https://www.usnews.com/topics/subjects/cancer" class="btn btn-primary" target="_blank" style="font-size:18px; color:white; background-color:black; border-color:black"">Read: usnews.com</a>
                  </div>
                </div>

                <div class="card" style="padding: 2%; margin: 2%; float:left; width: 27.5%; border:none" >
                  
                  <div class="card-body">
                    <h5 class="card-title" style="font-size:25px">Cancer Prevention News</h5>
                    <p class="card-text" style="font-size:18px">The Division of Cancer Prevention (DCP) is the division of the National Cancer Institute (NCI) devoted to cancer prevention research. DCP provides funding and administrative support to clinical and laboratory researchers, community and multidisciplinary teams, and collaborative scientific networks.</p>
                    <a href="https://prevention.cancer.gov/news-and-events" class="btn btn-primary" target="_blank" style="font-size:18px; color:white; background-color:black; border-color:black"">Read: prevention.cancer.gov</a>
                  </div>
                </div>

                <div class="card" style="padding: 2%; margin: 2%;  float:left; width: 27.5%; border:none" >
                 
                  <div class="card-body">
                    <h5 class="card-title" style="font-size:25px">Cancer Symptoms News</h5>
                    <p class="card-text" style="font-size:18px">Read about the cancer symptoms you shouldn't ignore!At the American Cancer Society, we're on a mission to free the world from cancer. Until we do, we'll be funding and conducting research, sharing expert information, supporting patients, and spreading the word about prevention. All so you can live longer — and better.</p>
                    <a href="https://www.cancer.org/latest-news/cancer-symptoms-you-shouldnt-ignore.html" class="btn btn-primary" target="_blank"  style="font-size:18px;color:white; background-color:black; border-color:black">Read: cancer.org</a>
                  </div>
                </div>
            </div>


 


</asp:Content>
        
  