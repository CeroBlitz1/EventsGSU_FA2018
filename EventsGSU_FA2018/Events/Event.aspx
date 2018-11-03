﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="EventsGSU_FA2018.Events.Event" %>

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
    
         </table>
        </div>
        <div class="Well">
            <div class="row">


                <div class="column col-xs-9">
                </div>
                <div class="column col-xs-3" id="sidebar">
                    <div id="Indexdescription"></div>
                    <div id="indexEventID"></div><button id="btnpayment" type="button" class="btn btn-success btn-lg"></button>
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

                    //var urlParams = new URLSearchParams(window.location.search);
                    $.urlParam = function (name) {
                        var results = new RegExp('[\?&]' + name + '=([^&#]*)')
                            .exec(window.location.href);
                        if (results == null) {
                            return 0;
                        }
                        return results[1] || 0;
                    }
                    debugger;
                    console.log($.urlParam('eventID')); //edit


                    //var queryParams = getQueryParams();
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

                        $('#indexImage1')[0].src = 'http://localhost/EventsGSUBusinessLibrary/' + response[0].EventImage;
                        $('#event1Date').text(response[0].EventDate);
                        $('#event1Location').text(response[0].EventLocation);
                        $('#event1Title').text(response[0].EventTitle);
                        $('#indexEventID').text(response[0].EventID);
                        $('#Indexdescription').text(response[0].EventsDescription);
                        $('#btnpayment').text(response[0].TicketPrice);
                        $('#indexEventID').val(response[0].EventID);
                        var firstItemImageEle = document.getElementById("indexEventID");
                        firstItemImageEle.setAttribute("data-eventID", response[0].EventID); 
                        $('#indexEventID').data('eventId', response[0].EventID);

                        $('#btnpayment').click(function () {



                            var clickItemImageEle = document.getElementById("indexEventID");
                            var eventID = clickItemImageEle.getAttribute("data-eventID");



                            window.location.href = "http://localhost/EventsGSU_FA2018/Payment/finalize_payment.aspx?eventID=" + eventID;
                        });

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

