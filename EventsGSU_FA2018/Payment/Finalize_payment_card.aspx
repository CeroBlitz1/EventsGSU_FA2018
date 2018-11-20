<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="finalize_payment.aspx.cs" Inherits="EventsGSU_FA2018.Payment.finalize_payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        &nbsp;&nbsp;&nbsp;<table class="nav-justified">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>

                                <div id="indexEventID"></div>
                                <img id="indexImage1" src="Images/img1.jpg" style="width: 350px" /></td>
                        </tr>
                        <tr>
                            <td>
                                <div id="event1Date"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="event1Location"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="event1Title"></div>
                            </td>
                        </tr>

                    </table>
                    <%--<asp:ImageButton ID="ImageButton1" runat="server" Height="127px" Width="187px" />--%>
                </td>
                <td>Description:<div id="eventDesc"></div>
                    <%--<asp:Label ID="Label_description" runat="server" Text="Description_Label"></asp:Label>--%>
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
                <td style="height: 20px"></td>
                <td style="height: 20px">
                    <div>$</div>
                    <div id="ticketAmount"></div>
                    <div id="indexTicketid"></div>

                </td>
            </tr>
            <tr>
                <td>
                    <hr />
                </td>
                <td>
                    <hr />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <input type="number" id="Numberticket" style="width: auto"  value="1" /><span id ="TicketMultiplier" hidden></span><br />
        <br />
       
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
                            <input type="text" id="txtFN" placeholder="First Name" disabled/>
                        </td>
                    </tr>
                    <tr>
                        <td>Last name</td>
                        <td>
                            <input type="text" id="txtLN" placeholder="Last Name"disabled />
                        </td>
                    </tr>
                    <tr>
                        <td>Card Number</td>
                        <td>
                            <span id="PaymentID"></span>
                            <input type="text" id="txtCardNumber" placeholder=" Card Number" disabled />
                        </td>
                    </tr>
                    <tr>

                        <td>Card CVV</td>
                        <td>
                            <input type="password" id="txtCVV" placeholder="Please enter Card CVV" disabled/>
                        </td>
                    </tr>
                    <tr>

                        <td>Card Expiration</td>
                        <td>
                            <input type="text" id="txtCardDate" value="mm/dd/yy"disabled />
                        </td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>
                            <input type="email" id="txtEmail" placeholder="Email"disabled />
                        </td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td>
                            <input type="text" id="txtPhNo" placeholder="Enter Phone number"disabled />
                        </td>

                    </tr>
                    <tr>
                        <td>Address</td>
                        <td>
                            <input type="text" id="txtAddress" placeholder="Please Enter Address"disabled />
                        </td>

                    </tr>
                    <tr>
                        <td>Zip code</td>
                        <td>
                            <input type="text" id="txtzip" placeholder="Please Enter zipcode"disabled />
                        </td>

                    </tr>
                    <tr>
                        <td>State</td>
                        <td>
                            <input type="text" id="txtstate" placeholder="Please Enter state"disabled />
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
                        <div class="modal-footer">
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
    <script src="../Scripts/underscore.min.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.js"></script>
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript">
        $(function () {
            $("#txtCardDate").datepicker();
        });
        function getQueryParams(queryString) {
            var query = (queryString || window.location.search).substring(1);
            if (!query) {
                return false;
            }
            return _
                .chain(query.split('&'))
                .map(function (params) {
                    var p = params.split('=');
                    return [p[0], decodeURIComponent(p[1])];
                })
                .object()
                .value();
        }

        $(document).ready(function () {
            getCookies();
            ValidateUserTypeID();
            validateRoles(utId);


            $(function () {
                $(document).ready(function () {

                    GetEventDetails();
                    GetCardDetails();
                });
            });



            function GetEventDetails() {


                var queryParams = getQueryParams();

                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/getdetailsbyid?eventID=' + queryParams.eventID,
                    method: 'GET',
                    data: {
                        EventLocation: "",
                        EventImage: ""
                    },


                    success: function (response) {
                        debugger;

                        $('#indexImage1')[0].src = 'http://localhost/EventsGSUBusinessLibrary/' + response.EventImage;
                        $('#event1Date').text(response.EventDate);
                        $('#event1Location').text(response.EventLocation);
                        $('#event1Title').text(response.EventTitle);
                        $('#indexEventID').val(response.EventID);
                        $('#eventDesc').text(response.EventsDescription);
                        $('#ticketAmount').text(response.TicketPrice);
                        $('#TicketMultiplier').val(response.TicketPrice);
                        $('#indexTicketid').val(response.TicketID);
                        
                        
                       



                    },
                    error: function (error) {
                        $('#ErrorText').text(error.responseText);
                        $('#error').show('fade');


                    }

                });

            }

            





            $('#btnPayment').click(function () {





                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/payment/PaymentWithcard',
                    method: 'POST',
                    data: {
                        firstname: $('#txtFN').val(),
                        lastname: $('#txtLN').val(),
                        useremail: $('#txtEmail').val(),
                        userphonenumber: $('#txtPhNo').val(),
                        usercardnumber: $('#txtCardNumber').val(),
                        usercardcvv: $('#txtCVV').val(),
                        useraddress: $('#txtAddress').val(),
                        usercardexpiration: $('#txtCardDate').val(),
                        userzipcode: $('#txtzip').val(),
                        userstate: $('#txtstate').val(),
                        userpaymentpaid: $('#ticketAmount').text(),
                        eventid: $('#indexEventID').val(),
                        ticketid: $('#indexTicketid').val(),
                        paymentid: $('#PaymentID').val(),
                        ticketspurchased: $('#Numberticket').val(),
                        userid: uID,
                        usertypeid: utId

                    },
                    success: function (response) {

                        $('#ErrorText').text(response.PMessage);
                        $('#error').show('fade');

                    },
                    error: function (jqXHR) {
                        $('#ErrorText').text(jqXHR.responseText);
                        $('#error').show('fade');

                    }

                });

            });

            function GetCardDetails() {


                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/GetCardDetails?UserID=' + uID,
                    method: 'GET',
                    data: {
                        //EventLocation: "",
                        //EventImage: ""
                    },


                    success: function (details) {
                        debugger;
                        $('#txtFN').val(details[0].FirstName);
                        $('#txtLN').val(details[0].LastName);
                        $('#txtCardNumber').val(details[0].UserCardNumber);
                        $('#txtCardDate').val(details[0].UserCardExpiration);
                        $('#txtCVV').val(details[0].UserCardCVV);
                        $('#txtEmail').val(details[0].UserEmail);
                        $('#txtPhNo').val(details[0].UserPhoneNumber);
                        $('#txtAddress').val(details[0].UserAddress);
                        $('#txtzip').val(details[0].UserZipCode);
                        $('#txtstate').val(details[0].UserState);
                        $('#PaymentID').val(details[0].PaymentID);


                    },
                    error: function (error) {
                        $('#ErrorText').text(error.responseText);
                        $('#error').show('fade');


                    }

                });

            }
             $(function () {
                debugger;
                $("#Numberticket").on("input", function () {
                        var value1 = parseFloat($("#Numberticket").val());
                         var value2 = parseFloat($("#TicketMultiplier").val());
                          $("#ticketAmount").text(value1 * value2);
                });
            });

            function ValidateUserTypeID() {
                if (utId == 0) {
                    window.location.href = "http://localhost/EventsGSU_FA2018/Account/Login";
                }
            }
        });
    </script>
</asp:Content>

