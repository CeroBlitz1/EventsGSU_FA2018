<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="admin_event_manage.aspx.cs" Inherits="EventsGSU_FA2018.Events.admin_Event_manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Admin Event manage Page</h1>
    <h3>This Page is for Admin only</h3>
    <div class="col-md-10 col-md-offset-1">
        <div class="well">
            <input type="button" id="btnLoadEvents" class="btn btn-success" value="Get all Events" />
        </div>
        <div class="well hidden" id="datadiv">
            <table class=" table table-bordered" id="tbldata">
                <thead>
                    <tr>
                        <th>UserID</th>
                        <th>UserName</th>
                        <th>UserTypeID</th>
                        <th>EventID</th>
                        <th>EventImage</th>
                        <th>EventTitle</th>
                        <th>EventType</th>
                        <th>EventLocation</th>
                        <th>EventsDescription</th>
                        <th>TicketID</th>
                        <th>TicketImage</th>
                        <th>TicketPrice</th>
                        <th>TicketQuantity</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

        });
        $('#btnLoadEvents').click(function () {
            $.ajax({
                url: 'http://localhost/EventsGSUBusinessLibrary/api/admin/GetEventHistoryadmin',
                method: 'GET',
                data: {
                    EventLocation: "",
                    EventImage: ""
                },
                success: function (response) {
                    $('#datadiv').removeClass('hidden')
                    $.each(response, function (index, value) {
                        var row = $('<tr><td>' + value.UserID + '</td><td>'
                            + value.UserName + '</td><td>'
                            + value.UserTypeID + '</td><td>'
                            + value.EventID + '</td><td>'
                            + value.EventImage + '</td><td>'
                            + value.EventTitle + '</td><td>'
                            + value.EventType + '</td><td>'
                            + value.EventLocation + '</td><td>'
                            + value.EventsDescription + '</td><td>'
                            + value.TicketID + '</td><td>'
                            + value.TicketImage + '</td><td>'
                            + value.TicketPrice + '</td><td>'
                            + value.TicketQuantity + '</td><td>'
                        );

                    });


                },
                error: function (error) {
                    $('#ErrorText').text(error.responseText);
                    $('#error').show('fade');

                }
            });
        });
    </script>
</asp:Content>
