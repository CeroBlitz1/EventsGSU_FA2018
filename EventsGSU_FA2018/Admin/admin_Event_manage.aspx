<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin_event_manage.aspx.cs" Inherits="EventsGSU_FA2018.Events.admin_Event_manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Admin Event manage Page</h1>
    <h3>This Page is for Admin only</h3>
    <div class="col-md-10 col-md-offset-1">
        <div class="well">
            <div class="ui-widget">
                    <input type="text" id="Event" placeholder="Search for an Event" required />
                    <input type="button" value="Search" id="Search" class="btn btn -success" />
                    <input type="hidden" id="Id" />
                </div>
        </div>
        
    </div>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="../Scripts/eventData.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script type="text/javascript">
       FindEvent =
            {
                BindControlEvents: function () {

                    $(document).ready(function () {
                        debugger;
                        getCookies();
                            debugger;
                           validateRoles(utId);
                        

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
                            window.location.href = "http://localhost/EventsGSU_FA2018/Admin/Admin_search_event.aspx?SearchQuery=" + SearchQuery;

                        });
                    });
                }
            }
         $(function () {
            FindEvent.BindControlEvents();
        });
       

    </script>
</asp:Content>
