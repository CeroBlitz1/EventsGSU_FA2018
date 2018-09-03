<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment_finalize.aspx.cs" Inherits="EventsGSU_FA2018.Payment.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>

        <table class="nav-justified">
            <tr>
                <td style="height: 69px"><h1> Finalizing Payment..</h1></td>
                <td style="height: 69px"></td>
                <td style="height: 69px"></td>
                <td style="height: 69px"></td>
            </tr>
            <tr>
                <td>Description :<br />
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="122px" Width="164px" />
                </td>
                <td>Cart</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <hr />
                </td>
                <td>
                    <hr />
                </td>
                <td>
                    <hr />
                </td>
                <td>
                    <hr />
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total:&nbsp;<hr />
                </td>
                <td>
                    $<asp:Label ID="Label_amount" runat="server" Text="Amount"></asp:Label>
                    <br />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

    </div>
    <div>

        <table class="nav-justified">
            <tr>
                <td><h3>Payment Info</h3></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Name on the Card:</td>
                <td>
                    <asp:TextBox ID="TextBox_CardName" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Card Number:</td>
                <td>
                    <asp:TextBox ID="TextBox_cardNo" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Expiration Date:</td>
                <td>
                    <asp:TextBox ID="TextBox_ExpDate" runat="server" TextMode="Date"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>CVV</td>
                <td>
                    <asp:TextBox ID="TextBox_CVV" runat="server" TextMode="Password" TabIndex="3"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><h3>Billing Address</h3></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>
                    <asp:TextBox ID="TextBox_BillName" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <asp:TextBox ID="TextBox_BillEmail" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Address:</td>
                <td>
                    <asp:TextBox ID="TextBox_BillAddr" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 20px">City:</td>
                <td style="height: 20px">
                    <asp:TextBox ID="TextBox_BillCity" runat="server"></asp:TextBox>
                </td>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
            </tr>
            <tr>
                <td>Zip Code:</td>
                <td>
                    <asp:TextBox ID="TextBox_BillZip" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Sate:</td>
                <td>
                    <asp:DropDownList ID="DropDownList_State" runat="server">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Button_Proceed" runat="server" CssClass="btn-success active" Height="66px" OnClick="Button_Proceed_Click" Text="Proceed to Checkout" Width="245px" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

    </div>
</asp:Content>
