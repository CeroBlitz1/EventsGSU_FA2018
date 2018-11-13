<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="EventsGSU_FA2018.Account.Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>You have been successfully logged out</h1>
   <script type="text/javascript">
       $(document).ready(function ()
       {
           getCookies();
            debugger;
           validateRoles(utId);
           destroycookies();
       });
       
   </script>
</asp:Content>
