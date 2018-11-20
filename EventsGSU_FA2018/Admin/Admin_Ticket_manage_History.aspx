<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin_Ticket_manage_History.aspx.cs" Inherits="EventsGSU_FA2018.Admin.Admin_user_Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>User Ticket Portal</h1>
    <div class="well">
        <label>Event Title :</label><input type="text" id="EventTitle" style="width:auto" disabled/>
        <br/>
        <br/>
        <label>Tickets Purchased :</label><input type="text" id="TicketsPurchased" style="width:auto" disabled/>
        <br/>
        <br/>
        <label>UserID :</label><input type="text" id="UserID" style="width:auto" disabled/>
        <br/>
        <br/>
        <label>Payment paid :</label><input type="text" id="PaymentPaid" style="width:auto" disabled/>
        <br/>
        <br/>
        <label>is Delete :</label><input type="text" id="IsDelete" style="width:auto" disabled/>
        <br/>
        <br/>
        <span id="TicketID" hidden ></span>
        <span id="PayemntHistoryID" hidden  ></span>
        <span id="UserTypeID" hidden ></span>
        <span id="EventID" hidden ></span>
        <span id="PaymentID" hidden ></span>
        <br />
        <br />
        <input type="button" id="Delete" class="btn btn-danger" value="Delete payment" />
    </div>
    
    <div id="error" class="alert alert-danger collapse">
        <a id="Close" class="close" href="#">&times;</a>
        <div id="ErrorText"></div>
    </div>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
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
            getCookies();
            debugger;
           validateRoles(utId);
            GetUserDetails();

            $('#btnUpdateProfile').click(function () {
                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api//register/UpdateProfile',
                    method: 'POST',
                    data:{

                        username: $('#TxtUserName').val(),
                        useremail: $('#TxtEmail').val(),
                        userpassword: $('#TxtPassword').val(),
                        userphonenumber: $('#TxtPhone').val(),
                        userid: $('#UserID').val(),
                        usertypeid: $('#UserTypeID').val()
                    },
                    success: function (response) {
                         $('#ErrorText').text(response.UMessage);
                             $('#error').show('fade');
                    },
                     error: function (jqXHR) {
                        $('#ErrorText').text(jqXHR.responseText);
                        $('#error').show('fade');

                    }
                });
            });

            

        });
        function GetUserDetails() {
            var queryParams = getQueryParams();
            $.ajax({
                url: 'http://localhost/EventsGSUBusinessLibrary/api/admin/GetPurchaseListAdmin?UserID=' + queryParams.userID,
                method: 'GET',
                data: {},
                success: function (response) {
                    $('#EventTitle').val(response.EventTitle);
                    $('#TicketsPurchased').val(response.TicketsPurchased);
                    $('#UserID').val(response.UserID);
                    $('#PaymentPaid').val(response.UserPaymentPaid);
                    $('#IsDelete').val(response.isDelete);
                    $('#TicketID').text(response.TicketID);
                    $('#PayemntHistoryID').text(response.PaymentHistoryID);
                    $('#UserTypeID').text(response.UserTypeID);
                    $('#EventID').text(response.EventID);
                    $('#PaymentID').text(response.PaymentID);

                    

                },
                error: function (error)
                    {
                        $('#ErrorText').text(error.responseText);
                        $('#error').show('fade');


                  },
            });
        }

    </script>


</asp:Content>
