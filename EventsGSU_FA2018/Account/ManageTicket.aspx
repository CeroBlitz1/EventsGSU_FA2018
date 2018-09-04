<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ManageTicket.aspx.cs" Inherits="EventsGSU_FA2018.Account.ManageTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div><h1>Manage Tickets</h1>
       <p>

           <asp:GridView ID="GridView1" runat="server">
           </asp:GridView>

       </p>
    </div>
</asp:Content>
