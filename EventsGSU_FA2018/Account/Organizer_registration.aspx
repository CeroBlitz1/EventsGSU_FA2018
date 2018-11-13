<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Organizer_registration.aspx.cs" Inherits="EventsGSU_FA2018.Account.Organizer_registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    

    <h3>Become an Organizer</h3>
    <div class="well">
            <input id="Button_Organizer" value="Become an Organizer"  class="btn btn-primary" />
        <span id="UserNameSpan" hidden></span>
        <span id="PasswordSpan" hidden></span>
        <span id="EmailSpan" hidden></span>
        <span id="PhoneNumberSpan" hidden></span>
    </div>
    <div id="error" class="alert alert-danger collapse">
        <a id="Close" class="close" href="#">&times;</a>
        <div id="ErrorText"></div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            getCookies();
            debugger;
            validateRoles(utId);
            GetUserDetails();

            $('#Button_Organizer').click(function () {
                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api//register/UpdateUserType',
                    method: 'POST',
                    data: {
                        username: $('#UserNameSpan').val(),
                        useremail: $('#EmailSpan').val(),
                        userpassword: $('#PasswordSpan').val(),
                        userphonenumber: $('#PhoneNumberSpan').val(),
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
                    $('#UserNameSpan').val(response.UserName);
                    $('#PasswordSpan').val(response.UserPassword);
                    $('#EmailSpan').val(response.UserEmail);
                    $('#PhoneNumberSpan').val(response.UserPhoneNumber);

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
