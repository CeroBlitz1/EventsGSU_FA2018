<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin_Search_user.aspx.cs" Inherits="EventsGSU_FA2018.Admin.Admin_Search_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>User Search results</h1>
    <div class="well">
    <table class=" table table-bordered" id="tbldata">
                <thead>
                    <tr>
                        
                        <th>UserID</th>
                        <th>Email</th>
                        <th>IsDeleted</th>
                    </tr>
                </thead>
            </table>
        </div>
    <%--<script src="../Scripts/jquery-3.3.1.min.js"></script>--%>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery.cookie-1.4.1.min.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="../Scripts/underscore.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <link href="../Content/themes/defaultTheme.css" rel="stylesheet" />
    <script src="../Scripts/jquery.fixedheadertable.min.js"></script>


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
           validateRoles(utId);
            }
            var queryParams = getQueryParams();
            GetEvents();

            
            function GetEvents() {
                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/admin/GetEmailResults?query=' + queryParams.SearchQuery,
                    method: 'GET',
                    data: {
                    },
                    success: function (response) {
                        writetable(response);
                        $('#tbldata').fixedHeaderTable({ footer: true, cloneHeadToFoot: false, altClass: 'odd', autoShow: true });
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
               '<tr><td><a href="'+ 'http://localhost/EventsGSU_FA2018/admin/Admin_ticket_History.aspx?userID=' + data[i].UserID + '">'
                + data[i].UserID + '</td></a><td>'
                + data[i].UserEmail + '</td><td>'
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
