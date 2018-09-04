<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="EventsGSU_FA2018.Account.MyProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div><h1>My Profile</h1>
        <table class="nav-justified">
            <tr>
                <td>Name:</td>
                <td>
                    <asp:Label ID="Label_Name" runat="server" Text="Name printed from database"></asp:Label>
                    /Session</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <asp:Label ID="Label_Email" runat="server" Text="Email printed from Database/Session"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Phone Number:</td>
                <td>
                    <asp:Label ID="Label_PhoneNo" runat="server" Text="Phone Number Printer from Database/Session"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="nav-justified">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 20px">Name:<br />
&nbsp;<asp:TextBox ID="TextBox_Profile_Name" runat="server"></asp:TextBox>
                </td>
                <td style="height: 20px"></td>
            </tr>
            <tr>
                <td>Email:<br />
&nbsp;<asp:TextBox ID="TextBox1" runat="server" TextMode="Email"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Phone Number:<br />
                    <asp:TextBox ID="TextBox_Profile_Number" runat="server" TextMode="Phone"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Button_profile_Update" runat="server" CssClass="btn-success" Text="Update Profile" />
                </td>
            </tr>
        </table>
</div>
</asp:Content>
