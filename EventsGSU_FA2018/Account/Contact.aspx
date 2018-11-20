<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="EventsGSU_FA2018.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Contact us:</h1>
    <p>
        If you have any doubts please you can contact us:
        </p>
    <p>
        Abdul hannan
+1(224)-415-4768
    </p>
    <p>
        Keral Patel
+1(773)-742-4271
           </p>
    <p>
        Isaac Villuri
+1(213)-263-8696
    </p>





    
    <script type="text/javascript">
       $(document).ready(function ()
       {
           getCookies();
           validateRoles(utId);
       });
       
   </script>

</asp:Content>
