﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin_Event_manage.aspx.cs" Inherits="EventsGSU_FA2018.Events.admin_Event_manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Admin Event manage Page</h1>
    <h3>This Page is for Admin only</h3>
    <div>
        
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        
        <br />
        <asp:Button ID="Button_Admin_update" runat="server" CssClass="btn-success" Text="Update" />
        
    </div>
</asp:Content>
