﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pay.Master" AutoEventWireup="true" CodeBehind="finalize_payment.aspx.cs" Inherits="EventsGSU_FA2018.Payment.finalize_payment" %>

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
                    <%--<asp:Label ID="Label_amount" runat="server" Text="Amunt_label"></asp:Label>--%>
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
                <td></td>
            </tr>
        </table>
        <div class="well  ">
            
                
                        <img src="../Content/cancel.png" />
              
                        <div  id="CardNumber">1</div>
              
                        <div id="CardExpiration">1</div>
               
                        <div id="FirstName" class="">1</div>
              
                        <div id="LastName" class="">1</div>
               
                        <div id="CardCVV" class="">1</div>
           
        </div>
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
                            <input type="text" id="txtCardNumber" placeholder=" Card Number" />
                        </td>
                    </tr>
                    <tr>

                        <td>Card CVV</td>
                        <td>
                            <input type="password" id="txtCVV" placeholder="Please enter Card CVV" />
                        </td>
                    </tr>
                    <tr>

                        <td>Card Expiration</td>
                        <td>
                            <input type="date" id="txtCardDate" />
                        </td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>
                            <input type="email" id="txtEmail" placeholder="Email" />
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
    <script type="text/javascript">
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
            $(function () {
                $(document).ready(function () {

                    GetEventDetails();
                    GetCardDetails();



                    $.urlParam = function (name) {
                        var results = new RegExp('[\?&]' + name + '=([^&#]*)')
                            .exec(window.location.href);
                        if (results == null) {
                            return 0;
                        }
                        return results[1] || 0;
                    }
                    debugger;
                    console.log($.urlParam('eventID'));





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

                        $('#indexImage1')[0].src = 'http://localhost/EventsGSU_FA2018/' + response[0].EventImage;
                        $('#event1Date').text(response[0].EventDate);
                        $('#event1Location').text(response[0].EventLocation);
                        $('#event1Title').text(response[0].EventTitle);
                        $('#indexEventID').text(response[0].EventID);
                        $('#eventDesc').text(response[0].EventsDescription);
                        $('#ticketAmount').text(response[0].TicketPrice);
                        $('#indexTicketid').text(response[0].TicketID);


                    },
                    error: function (error) {
                        $('#ErrorText').text(error.responseText);
                        $('#error').show('fade');


                    }

                });

            }

            var output = {};
            debugger;
            function getCookies() {
                var userCookie = document.cookie;// "referer=example.com/post?id=22;bcomID=8075; subreturn=example&fuzzy=true&ct=null&autobounce=true; JSESSIONID=6D20570E1EB; mbox=session";

                userCookie.split(/\s*;\s*/).forEach(function (pair) {
                    pair = pair.split(/\s*=\s*/);
                    output[pair[0]] = pair.splice(1).join('=');
                });
            }
            debugger;

            $('#btnPayment').click(function () {

                getCookies()
                {
                    var utID = output["UserTypeID"];
                    var uID = output["UserID"];
                };

                debugger;


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
                        usercardexpiration: $('#txtCardDate').val(),
                        userzipcode: $('#txtzip').val(),
                        userstate: $('#txtstate').val(),
                        userpaymentpaid: $('#ticketAmount').text(),
                        eventid: $('#indexEventID').text(),
                        ticketid: $('#indexTicketid').text(),
                        userid: uID,
                        usertypeid: utID

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
            function GetCardDetails() {

                getCookies()
                {
                    var uID = output["UserID"];
                };
                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/GetCardDetails?UserID=' + uID,
                    method: 'GET',
                    data: {
                        //EventLocation: "",
                        //EventImage: ""
                    },


                    success: function (details) {
                        debugger;

                        $('#CardNumber').text(details[0].UserCardNumber);
                        $('#CardExpiration').text(details[0].UserCardExpiration);
                        $('#FirstName').text(details[0].FirstName);
                        $('#LastName').text(details[0].LastName);
                        $('#CardCVV').text(details[0].UserCardCVV);


                    },
                    error: function (error) {
                        $('#ErrorText').text(error.responseText);
                        $('#error').show('fade');


                    }

                });

            }
        });
    </script>
</asp:Content>

