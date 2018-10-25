<%@ Page Title="" Language="C#" MasterPageFile="~/Pay.Master" AutoEventWireup="true" CodeBehind="Processing_payment.aspx.cs" Inherits="EventsGSU_FA2018.Payment.Processing_payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
    <div>$</div>
        <div id="ticketAmount"></div>
        <div id="indexTicketid"></div>

    <table>
        <tr>
            <td colspan="3">
                <input id="btnPayment" class="btn btn-success" type="button" value="Finalize Payment" />
            </td>
        </tr>
      
    </table>
      
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
            function getCookies() {
                var userCookie = document.cookie;// "referer=example.com/post?id=22;bcomID=8075; subreturn=example&fuzzy=true&ct=null&autobounce=true; JSESSIONID=6D20570E1EB; mbox=session";

                userCookie.split(/\s*;\s*/).forEach(function (pair) {
                    pair = pair.split(/\s*=\s*/);
                    output[pair[0]] = pair.splice(1).join('=');
                });
            }

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
        });
    </script>
</asp:Content>
