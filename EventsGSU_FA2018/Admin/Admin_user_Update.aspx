<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin_user_Update.aspx.cs" Inherits="EventsGSU_FA2018.Admin.Admin_user_Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>User Update Portal</h1>
    <div class="well">
        <label>User Name :</label><span id="Name"></span>
        <br />
        <label>Email :</label><span id="Email"></span><span id="UserTypeID" ></span>
        <br />
        <label>PhoneNumber :</label><span id="PhoneNumber"></span>
    </div>
    <div class="Well">
        <label>Update User Name :</label><br />
        <input type="text" id="TxtUserName" disabled />
        <br />
        <label>Update Password :</label><br />
        <input type="password" id="TxtPassword"  />
        <br />
        <label>Update Email :</label><br />
        <input type="email" id="TxtEmail"  />
        <br />
        <label>Update Phone :</label><br />
        <input type="text" id="TxtPhone" />
        <span id="UserID"></span>
        <br />
        <br />

        <input type="button" class="btn btn-success" id="btnUpdateProfile" value ="Update Profile" />



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
                url: 'http://localhost/EventsGSUBusinessLibrary/api/admin/GetUserInfobyIDAdmin?UserID=' + queryParams.userID,
                method: 'GET',
                data: {},
                success: function (response) {
                    $('#Name').text(response.UserName);
                    $('#TxtUserName').val(response.UserName);
                    $('#Email').text(response.UserEmail);
                    $('#PhoneNumber').text(response.UserPhoneNumber);
                    $('#UserID').val(response.UserID);
                    $('#UserTypeID').val(response.UserTypeID);

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
