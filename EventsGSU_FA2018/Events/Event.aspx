<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="EventsGSU_FA2018.Events.Event" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table class="nav-justified">
            <tr>
                <td>
        <asp:ImageButton ID="ImageButton1" runat="server" Height="133px" ImageUrl="~/Site Images/GSUlogo.png" Width="229px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server">Date/Content</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Description"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
