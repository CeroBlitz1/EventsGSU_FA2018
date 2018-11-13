<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage_Tickets_events.aspx.cs" Inherits="EventsGSU_FA2018.Account.Manage_Tickets_events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Your Events</h1>
    <table id="tbldata">
    </table>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery.cookie-1.4.1.min.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="../Scripts/underscore.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            getCookies();
            debugger;
           validateRoles(utId);
            GetTicketEvents();
        });

        //function getCookies() {
        //    var userCookie = document.cookie;// "referer=example.com/post?id=22;bcomID=8075; subreturn=example&fuzzy=true&ct=null&autobounce=true; JSESSIONID=6D20570E1EB; mbox=session";
        //    var output = {};
        //    userCookie.split(/\s*;\s*/).forEach(function (pair) {
        //        pair = pair.split(/\s*=\s*/);
        //        output[pair[0]] = pair.splice(1).join('=');
        //        uID = output["UserID"];
        //    });
        //}

        function GetTicketEvents() {
            $.ajax({
                url: 'http://localhost/EventsGSUBusinessLibrary/api/register/GetEventByUserID?UserID=' + uID,
                method: 'GET',
                data: {

                },
                success: function (response) {
                    writetable(response);
                    //if (response.EFlag) {
                    //    window.location.href = "http://localhost/EventsGSU_FA2018/Events/Event.aspx";
                    //}
                    //else {
                    //    $('#ErrorText').text(response.UMessage);
                    //    $('#error').show('fade');
                    //}
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
                        '<a href="' + 'http://localhost/EventsGSU_FA2018/Account/ManageTicket.aspx?eventID=' +
                        data[i].EventID + '"><div style = "width: 250px; display: inline-block; padding: 20px" class="col-md-4 eventblock" > <div id="indexEventID' + i + '"></div><div><img id="indexImage' + i + '" src="' +
                        'http://localhost/EventsGSUBusinessLibrary/' + data[i].EventImage + '" style="width: 210px"></div><div id="event' + i + 'Date">' +
                        data[i].EventDate + '</div><div id="event' + i + 'Location">' +
                        data[i].EventLocation + '</div><div id="event' + i + 'Title">' +
                        data[i].EventTitle + '</div></div></a>';
                }
                $('#tbldata').append(tableOutline);
                $('#tbldata').show();
            }
        }

    </script>
</asp:Content>
