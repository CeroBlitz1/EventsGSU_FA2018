<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="EventsGSU_FA2018._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <table class="nav-justified">
        <tr>
            <td>
                <%--<asp:ImageButton ID="ImageButton1" runat="server" Height="96px" Width="1241px" ImageUrl="~/SiteImages/GSUlogo.png" />--%>
            </td>
        </tr>
        <tr>
            <td>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <br />
                <div class="ui-widget">
                    <input type="text" id="Event" placeholder="Search for an Event" required />
                    <input type="button" value="Search" id="Search" class="btn btn -success" />
                    <input type="hidden" id="Id" />
                </div>

                <%--<label for="Location">Location: </label>
                <input id="Location" />--%>
               
            </td>
        </tr>
        <tr>
            <td id="tbldata">
                <div ></div>
                
            </td>
        </tr>
    </table>

    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <%--<script src="Scripts/jquery.cookie-1.4.1.min.js"></script>--%>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="../Scripts/eventData.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <%-- <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
                <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">--%>
    <script type="text/javascript">
        FindEvent =
            {
                BindControlEvents: function () {

                    $(document).ready(function () {
                        debugger;
                        getCookies();
                            debugger;
                           validateRoles(utId);
                        GetEvents();

                        $('#Event').autocomplete({
                            source: function (request, response) {
                                $.ajax({
                                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/getsearchevents',
                                    data: { query: request.term },
                                    dataType: 'json',
                                    type: 'GET',
                                    success: function (data) {
                                        debugger;
                                        response($.map(data, function (item) {
                                            return {
                                                label: item.EventTitle,
                                                value: item.EventID
                                            }
                                        }));
                                    },
                                    error: function (err) {
                                        debugger;
                                    }
                                })
                            },
                            select: function (event, ui) {
                                $('#Event').val(ui.item.label);
                                $('#Id').val(ui.item.value);
                                return false;
                            },
                            minLength: 1
                        });
                        $('#Search').click(function () {
                            
                            var SearchQuery = document.getElementById("Event").value;
                            window.location.href = "http://localhost/EventsGSU_FA2018/Events/Search_results.aspx?SearchQuery=" + SearchQuery;

                        });
                    });
                }
            }



        



        

        
        function GetEvents() {

            //debugger;

            $.ajax({
                url: 'http://localhost/EventsGSUBusinessLibrary/api/register/getEvents',
                method: 'GET',
                data: {
                    EventLocation: "",
                    EventImage: ""
                },
                success: function (response) {
                    writetable(response);

                    debugger;
                    
                

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
                
                var tableOutline = '';
                
                for (var i = 0; i < data.length; i++) {
                    tableOutline = tableOutline +
                        '<a href="' + 'http://localhost/EventsGSU_FA2018/Events/Event.aspx?eventID=' +
                        data[i].EventID + '"><div style = "width: 250px; display: inline-block; padding: 20px" class="col-md-4 eventblock" > <div id="indexEventID'+ i +'"></div><div><img id="indexImage' + i + '" src="' +
                        'http://localhost/EventsGSUBusinessLibrary/' + data[i].EventImage + '" style="width: 100px"></div><div id="event' + i + 'Date">' +
                        data[i].EventDate + '</div><div id="event'+ i +'Location">' +
                        data[i].EventLocation + '</div><div id="event'+ i +'Title">' +
                        data[i].EventTitle + '</div></div></a>';
                  }
                $('#tbldata').append(tableOutline);
                $('#tbldata').show();
            }
        }
        $(function () {
            FindEvent.BindControlEvents();
        });
    </script>


</asp:Content>
