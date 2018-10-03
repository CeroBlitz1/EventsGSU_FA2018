<%@ Page Title="" Language="C#" MasterPageFile="~/Pay.Master" AutoEventWireup="true" CodeBehind="finalize_payment.aspx.cs" Inherits="EventsGSU_FA2018.Payment.finalize_payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
</div>
  <div class="col-md-10 col-md-offset-1">
       <div class="well">
           <table class="table table-bordered">
               
               <thead>
                   <tr class="Success">
                       <td colspan="3">
                           <h2>Finalize Your Payment</h2>
                       </td>

                   </tr>
               </thead>
               <tbody>
                   <tr>
                       <td>First Name</td>
                       <td>
                           <input type="text" id="txtFN" placeholder="First Name" />
                       </td>
                   </tr>
                   <tr>
                       <td>Last name</td>
                       <td>
                           <input type="text" id="txtLN" placeholder="Last Name" />
                       </td>
                   </tr>
                   <tr>
                       <td>Card Number</td>
                       <td>
                           <input type="text" id="txtCardNumber" placeholder =" Card Number" />
                       </td>
                   </tr>
                   <tr>
                       
                   <td>Card CVV</td>
                       <td>
                           <input type="password" id="txtCVV" placeholder="Please enter Card CVV"   />
                       </td>
                     </tr>
                   <tr>
                       <td>Email</td>
                       <td>
                           <input type="email" id="txtEmail" placeholder="Email"  />
                       </td>
                   </tr>
                   <tr>
                       <td>Phone Number</td>
                       <td>
                           <input type="text" id="txtPhNo" placeholder="Enter Phone number" />
                       </td>

                   </tr>
                    <tr>
                       <td>Address</td>
                       <td>
                           <input type="text" id="txtAddress" placeholder="Please Enter Address" />
                       </td>

                   </tr>
                    <tr>
                       <td>Zip code</td>
                       <td>
                           <input type="text" id="txtzip" placeholder="Please Enter zipcode" />
                       </td>

                   </tr>
                    <tr>
                       <td>State</td>
                       <td>
                           <input type="text" id="txtstate" placeholder="Please Enter state" />
                       </td>

                   </tr>
                   <tr class="Success">
                       
                       <td colspan="3">
                           <input id="btnPayment" class="btn btn-success" type="button" value="Finalize Payment" />
                       </td>
                   </tr>
               </tbody>
           </table>
           <div class="modal fade" tabindex="-1" id="successmodal"
               data-keyboard="false" data-bakcdrop="static">
               <div class="modal-dialouge modal-sm">
                   <div class="modal-content">
                       <div class="modal-header">
                           <button type="button" class="close" data-dismiss="modal">
                               &times;
                               <h3>Success</h3>
                           </button>
                       </div>
                       <div class="modal-body">
                           <h2>Payment successful</h2>
                       </div>
                       <div class ="modal-footer">
                           <button type="button" data-dismiss="modal" class="btn btn-danger">
                               Close
                           </button>
                       </div>
                   </div>
               </div>
           </div>
           <div id="error" class="alert alert-danger collapse">
               <a id="Close" class="close" href="#">&times;</a>
               <div id="ErrorText"></div>
           </div>
       </div>
   </div>
     <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#Close').click(function(){

                $('#error').hide('fade');
            });
            $('#btnPayment').click(function () {

                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/payment/paymentv',
                    method: 'POST',
                    data: {
                        firstname: $('#txtFN').val(),
                        lastname: $('#txtLN').val(),
                        useremail: $('#txtEmail').val(),
                        userphonenumber: $('#txtPhNo').val(),
                        usercardnumber: $('#txtCardNumber').val(),
                        usercardcvv: $('#txtCVV').val(),
                        useraddress: $('#txtAddress').val(),
                        userzipcode: $('#txtzip').val(),
                        userstate: $('#txtstate').val(),
                        userpaymentpaid : $('#Label_description').val()
                    },
                    success: function (s) {
                        $('#successmodal').modal(s);
                        
                    },
                    error: function (jqXHR) {
                        $('#ErrorText').text(jqXHR.responseText);
                        $('#error').show('fade');

                    }
                   
                });
                
            });
        });
    </script>
</asp:Content>

