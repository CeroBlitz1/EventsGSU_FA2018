<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="EventsGSU_FA2018.Events.Event" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="well">
        <table>
            <tr>
                <td>

                    
                    <img id="indexImage1" src="" style="width: 350px" /></td>
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
                <td></td>

            </tr>
    </div>
    </table>
        <div class="Well">
            <div class="row">


                <div class="column col-xs-9">
                </div>
                <div class="column col-xs-3" id="sidebar">
                    <div id="Indexdescription"></div>
                    <div id="eventTicketID"></div><button id="btnpayment" type="button" class="btn btn-success btn-lg"></button>
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
                    //console.log('window.location: ', window.location);
                    //console.log('window.location.search: ', window.location.search);


                    var queryParams = getQueryParams();
                    //console.log('queryParams: ', queryParams);

                });
            });

            GetEventDetails();


            function GetEventDetails() {


                var queryParams = getQueryParams();

                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/getdetailsbyid?eventId=' + queryParams.eventID,
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
                        $('#Indexdescription').text(response[1].EventsDescription);
                        $('#btnpayment').text(response[2].TicketPrice);
                        $('#indexTicketid').val(response[2].TicketID);
                        var firstItemImageEle = document.getElementById("eventTicketID");
                        firstItemImageEle.setAttribute("data-ticketID", response[2].TicketID);
                        $('#indexTicketid').data('ticketID', response[2].TicketID);

                        $('#btnpayment').click(function () {



                            var clickItemImageEle = document.getElementById("eventTicketID");
                            var TicketID = clickItemImageEle.getAttribute("data-ticketID");



                            window.location.href = "http://localhost/EventsGSU_FA2018/Payment/finalize_payment.aspx?TicketID=" + TicketID;
                        });



                        //$('#indexImage2')[0].src = 'http://localhost/EventsGSU_FA2018/' + response[1].EventImage;
                        //$('#event2Date').text(response[1].EventDate);
                        //$('#event2Location').text(response[1].EventLocation);
                        //$('#event2Title').text(response[1].EventTitle);
                        //$('#indexEventID1').val(response[1].EventID);

                        //$('#indexImage3')[0].src = 'http://localhost/EventsGSU_FA2018/' + response[2].EventImage;
                        //$('#event3Date').text(response[2].EventDate);
                        //$('#event3Location').text(response[2].EventLocation);
                        //$('#event3Title').text(response[2].EventTitle);
                        //$('#indexEventID2').val(response[2].EventID);
                        //if (response.EFlag) {
                        //    window.location.href = "http://localhost/EventsGSU_FA2018/Events/Event.aspx";
                        //}
                        //else {
                        //    $('#ErrorText').text(response.UMessage);
                        //    $('#error').show('fade');
                        //}
                        //$('#successmodal').text(response.UserEmail);
                        //$("#error").show('fade');


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

