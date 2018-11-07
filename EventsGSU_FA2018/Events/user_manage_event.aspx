<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="user_manage_event.aspx.cs" Inherits="EventsGSU_FA2018.Events.user_manage_event" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-10 col-md-offset-1">
        <div class="well">
            <table class="table table-bordered">

                <thead>
                    <tr class="Success">
                        <td colspan="3">
                            <h2>Update your Event</h2>
                        </td>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Event Title</td>
                        <td>
                            <input type="text" id="txtTitle" placeholder="Title" />
                        </td>
                    </tr>
                    <tr>
                        <td>Event Type</td>
                        <td>
                            <input type="text" id="txtEventType" placeholder="Event Type" />
                        </td>
                    </tr>
                    <%--<tr>
                        <td>Event Image</td>
                        <td>
                            <div>
                                <label for="fileUpload" />
                                Select File to Upload:
                                <input id="fileUpload" type="file" />
                            </div>
                        </td>
                    </tr>--%>
                    <tr>
                        <td>Event Date</td>
                        <td>
                            <input type="text" id="EventDate" />
                        </td>

                    </tr>
                    <tr>
                        <td>Event location</td>
                        <td>
                            <input type="text" id="txtEventLocation" placeholder="Enter location" />
                        </td>

                    </tr>
                    <tr>

                        <td>Event Description</td>
                        <td>
                            <input type="text" id="txtEventDesc" placeholder="Please enter Description" size="700" />
                        </td>
                    </tr>

                    <tr class="Success">
                        <td colspan="3">
                            <h3>Update your ticket</h3>
                        </td>

                    </tr>
                    <%--<tr>

                        <td>Ticket Type</td>
                        <td>

                            <input type="text" id="txtTicketType" placeholder="Please enter Type of ticket" size="400" />
                        </td>

                    </tr>--%>
                    <tr>

                        <td>Ticket Price</td>
                        <td>

                            <input type="text" id="txtTicketPrice" placeholder="Please enter price" size="400" />
                        </td>

                    </tr>
                    <tr>

                        <td>Ticket Quantity</td>
                        <td>

                            <input type="number" id="TicketQuantity" />
                        </td>

                    </tr>
                    <%-- <tr>
                        <td>Ticket Image</td>
                        <td>
                            <input type="file" id="imgTicket" />
                        </td>
                    </tr>--%>
                    <tr class="Success">

                        <td colspan="3">
                            <input id="btnUploadFile" type="button" class="btn btn-success" value="Update Event" />
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
                            <h2>Creating successful</h2>
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
    <script src="../Scripts/jquery.cookie-1.4.1.min.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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

        $(function () {
            $("#EventDate").datepicker();
        });

        $(document).ready(function () {
            $('#btnUploadFile').click(function () {
                var queryParams = getQueryParams();
                debugger;
                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/PostEventDetails?eventId=' + queryParams.eventID,
                    method: 'POST',
                    data: {
                        eventtitle: $('#txtTitle').val(),
                        eventdate: $('#EventDate').val(),
                        eventlocation: $('#txtEventLocation').val(),
                        eventtype: $('#txtEventType').val(),
                        ticketprice: $('#txtTicketPrice').val(),
                        ticketquantity: $('#TicketQuantity').val(),
                        eventsdescription: $('#txtEventDesc').val(),
                    },
                    success: function (a) {
                        alert("Update Completed");
                    },
                    error: function (b) {
                        alert("Problem Updating");
                    }

                });
            });
        });
    </script>
</asp:Content>
