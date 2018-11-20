<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="EventsGSU_FA2018.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>About Us</h1>
   <p>
        We have created common ground with GSUEventPortal to bring people together.
       In our portal, anyone can be users, organizers and visitors.
       Visitor can browse events, user can buy events and organizer can create events.
   </p>
<p>
    Contact us:
If you have any doubts please you can contact us:
Abdul hannan
+1(224)-415-4768

Keral Patel
+1(773)-742-4271

Isaac Villuri
+1(213)-263-8696

			

If you have any question please give us a call.
</p>

  <script type="text/javascript">
       $(document).ready(function ()
       {
           getCookies();
           
           validateRoles(utId);
       });
       
   </script>
    
</asp:Content>
