<%@ Page Title="" Language="C#" MasterPageFile="~/Pay.Master" AutoEventWireup="true" CodeBehind="finalize_payment.aspx.cs" Inherits="EventsGSU_FA2018.Payment.finalize_payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Finalize Payment</h1>
    <div>
        &nbsp;&nbsp;&nbsp;<table class="nav-justified">
            <tr>
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="127px" Width="187px" />
                </td>
                <td>Description:
                    <asp:Label ID="Label_description" runat="server" Text="Description_Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td></td>
            </tr>
            <tr>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
            </tr>
            <tr>
                <td>
                    <hr />
                </td>
                <td>
                    <hr />
                </td>
                <td>&nbsp;</td>
                <td></td>
            </tr>
            <tr>
                <td style="height: 20px">Total</td>
                <td style="height: 20px"></td>
                <td style="height: 20px">&nbsp;</td>
                <td style="height: 20px">$<asp:Label ID="Label_amount" runat="server" Text="Amunt_label"></asp:Label>
                &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <hr />
                </td>
                <td>
                    <hr />
                </td>
                <td>&nbsp;</td>
                <td></td>
            </tr>
        </table>
&nbsp;<div><h3>Payment Info</h3></div>
    </div>
    <table class="nav-justified">
        <tr>
            <td>Name on the card:<br />
                <asp:TextBox ID="TextBox_Pay_Name" runat="server"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td style="height: 20px">Card Number:<br />
                <asp:TextBox ID="TextBox_pay_cardno" runat="server"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>Card Expiration Date:<br />
                <asp:TextBox ID="TextBox_pay_cardexp" runat="server" TextMode="Date"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>CVV:<br />
                <asp:TextBox ID="TextBox_pay_cvv" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td><h3>Billing address</h3></td>
            
        </tr>
        <tr>
            <td>Name:<br />
                <asp:TextBox ID="TextBox_pay_bill_name" runat="server"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>Email:<br />
                <asp:TextBox ID="TextBox_pay_bill_email" runat="server" TextMode="Email"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td style="height: 20px">Address:<br />
                <asp:TextBox ID="TextBox_pay_bill_addr" runat="server"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
            <td>City:<br />
                <asp:TextBox ID="TextBox_pay_bill_city" runat="server"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>Zip Code:<br />
                <asp:TextBox ID="TextBox_pay_bill_zip" runat="server"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>State :<br />
                <asp:DropDownList ID="DropDownList_state" runat="server">
                </asp:DropDownList>
            </td>
            
        </tr>
        <tr>
            <td>&nbsp;</td>
            
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button_proceed" runat="server" CssClass="btn-success" Height="64px" Text="PROCEED TO CEHCKOUT" Width="664px" />
                &nbsp;</td>
            
        </tr>
        <tr>
            <td>&nbsp;</td>
            
        </tr>
    </table>
</asp:Content>

