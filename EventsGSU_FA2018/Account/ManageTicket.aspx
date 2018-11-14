<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageTicket.aspx.cs" Inherits="EventsGSU_FA2018.Account.ManageTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Manage Tickets</h1>
    <table class=" table table-bordered" id="tbldata">
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <%--<th>Email</th>--%>
                <th>Tickets Purchased</th>
                <%--<th>Card Expiration</th>
                        <th>Event Title</th>--%>
                <%--<th>EventType</th>
                        <th>EventLocation</th>
                        <th>EventsDescription</th>
                        <th>TicketID</th>
                        <th>TicketImage</th>
                        <th>TicketPrice</th>
                        <th>TicketQuantity</th>--%>
            </tr>
        </thead>
    </table>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery.cookie-1.4.1.min.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
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
            GetTicketDetails();
             getCookies();
            debugger;
           validateRoles(utId);
            function GetTicketDetails() {

                var queryParams = getQueryParams();

                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/GetTicktsByEventID?eventId=' + queryParams.eventID,
                    method: 'GET',
                    data: {},
                    success: function (response) {
                        writetable(response);
                    },
                    error: function (error) {
                        $('#ErrorText').text(error.responseText);
                        $('#error').show('fade');

                    }
                });


            }
        });
        function writetable(data) {
        var tableOutline = '';

        for (var i = 0; i < data.length; i++) {


            var obj = data[i].TicketsPurchased;

            var objjson = JSON.stringify(obj);

            tableOutline = tableOutline +
                '<tr><td>'
                + data[i].FirstName + '</td><td>'
                + data[i].LastName + '</td><td>'
                + objjson +
                '</td></tr>';  


        }
        tableOutline = tableOutline;
        $('#tbldata').append(tableOutline);
        $('#tbldata').show();
    }

    </script>
</asp:Content>
