<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin_ticket_History.aspx.cs" Inherits="EventsGSU_FA2018.Admin.Admin_ticket_History" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1>User Search results</h1>
    <table class=" table table-bordered" id="tbldata">
                <thead>
                    <tr>
                        <th>Event Title</th>
                        <th>UserID</th>
                        <th>Payment Paid</th>
                        <th>TicketsTurchased</th>
                        <th>IsDeleted</th>
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
            {
               getCookies();
            debugger;
           validateRoles(utId);
            }
            var queryParams = getQueryParams();
            GetEvents();

            function GetEvents() {
                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/admin/GetAdminPurchaseInfobyID?UserID=' + queryParams.userID,
                    method: 'GET',
                    data: {
                    },
                    success: function (response) {
                        writetable(response);
                        $('#successmodal').text(response.UserEmail);
                        $("#error").show('fade');
                    },
                    error: function (error) {
                        $('#ErrorText').text(error.responseText);
                        $('#error').show('fade');

                    }


                });
                function writetable(data) {
                    debugger;
                    var tableOutline = '';

                    for (var i = 0; i < data.length; i++) {
                        tableOutline = tableOutline +
                            
               '<tr><td><a href="'+ 'http://localhost/EventsGSU_FA2018/admin/Admin_Ticket_manage_History.aspx?userID=' + data[i].UserID + '">'
                + data[i].EventTitle + '</td></a><td>'
                + data[i].UserID + '</td><td>'
                + data[i].UserPaymentPaid + '</td><td>'
                + data[i].TicketsPurchased + '</td><td>'
                + data[i].isDelete + '</td><td></a>'
                
                + '</td></tr>';
                    }
                    $('#tbldata').append(tableOutline);
                    $('#tbldata').show();
                }
            }

        });

    </script>
</asp:Content>
