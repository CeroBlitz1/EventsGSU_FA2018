﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin_payment_info.aspx.cs" Inherits="EventsGSU_FA2018.Payment.Admin_payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Admin Payment Information Page</h1>
    <h3>This Page is for Admin only</h3>
    <div>

        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>

        <br />
        <asp:Button ID="Button_Admin_update" runat="server" CssClass="btn-success" Text="Update" />

    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            getCookies();
            debugger;
            validateRoles(utId);
        });

    </script>
</asp:Content>

