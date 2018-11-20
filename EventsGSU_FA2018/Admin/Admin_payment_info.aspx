<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin_payment_info.aspx.cs" Inherits="EventsGSU_FA2018.Payment.Admin_payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <h1>Admin Payment manage Page</h1>
    <h3>This Page is for Admin only</h3>
    <div class="col-md-10 col-md-offset-1">
        <div class="well">
            <div class="ui-widget">
                    <input type="text" id="Event" placeholder="Search for Email"  />
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
                        
                        getCookies();
                           
                           validateRoles(utId);
                        

                        $('#Event').autocomplete({
                            source: function (request, response) {
                                $.ajax({
                                    url: 'http://localhost/EventsGSUBusinessLibrary/api/admin/GetSearchEmail',
                                    data: { query: request.term },
                                    dataType: 'json',
                                    type: 'GET',
                                    success: function (data) {
                                        debugger;
                                        response($.map(data, function (item) {
                                            return {
                                                label: item.UserEmail,
                                                value: item.PaymentID
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
                            window.location.href = "http://localhost/EventsGSU_FA2018/Admin/Admin_Search_emailResults.aspx?SearchQuery=" + SearchQuery;

                        });
                    });
                }
            }
         $(function () {
            FindEvent.BindControlEvents();
        });
       

    </script>
</asp:Content>

