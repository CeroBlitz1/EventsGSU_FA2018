<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search_results.aspx.cs" Inherits="EventsGSU_FA2018.Events.Search_results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Search Results</h1>
     <table class="nav-justified">
     <tr>
            <td id="tbldata">
                <div ></div>
                
            </td>
        </tr>
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
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/GetResults?query=' + queryParams.SearchQuery,
                    method: 'GET',
                    data: {
                    },
                    success: function (response) {
                        writetable(response);
                        if (response.EFlag) {
                            window.location.href = "http://localhost/EventsGSU_FA2018/Events/Event.aspx";
                        }
                        else {
                            $('#ErrorText').text(response.UMessage);
                            $('#error').show('fade');
                        }
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
                            '<a href="' + 'http://localhost/EventsGSU_FA2018/Events/Event.aspx?eventID=' +
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

        });

    </script>
</asp:Content>
