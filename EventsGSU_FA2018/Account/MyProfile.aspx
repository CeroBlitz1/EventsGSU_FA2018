<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="EventsGSU_FA2018.Account.MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>My Profile</h1>
    <div class="well">
        <label>User Name :</label><span id="Name"></span>
        <br />
        <label>Email :</label><span id="Email"></span>
        <br />
        <label>PhoneNumber :</label><span id="PhoneNumber"></span>
    </div>
    <div class="Well">
        <label>Update User Name :</label><br />
        <input type="text" id="TxtUserName" />
        <br />
        <label>Update Password :</label><br />
        <input type="password" id="TxtPassword" />
        <br />
        <label>Update Email :</label><br />
        <input type="text" id="TxtEmail" />
        <br />
        <label>Update Phone :</label><br />
        <input type="text" id="TxtPhone" />
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
    <script type="text/javascript">
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
                        userid: uID,
                        usertypeid: utId
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
            $.ajax({
                url: 'http://localhost/EventsGSUBusinessLibrary/api/register/GetUserInfobyID?UserID=' + uID,
                method: 'GET',
                data: {},
                success: function (response) {
                    $('#Name').text(response.UserName);
                    $('#Email').text(response.UserEmail);
                    $('#PhoneNumber').text(response.UserPhoneNumber);

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
