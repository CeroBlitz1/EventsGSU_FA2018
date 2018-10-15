<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="EventsGSU_FA2018.Account.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="col-md-10 col-md-offset-1">
       <div class="well">
           <table class="table table-bordered">
               
               <thead>
                   <tr class="Success">
                       <td colspan="3">
                           Registration Page
                       </td>

                   </tr>
               </thead>
               <tbody>
                   <tr>
                       <td>User Name</td>
                       <td>
                           <input type="text" id="txtUserName" placeholder="User Name" />
                       </td>
                   </tr>
                   <tr>
                       <td>Email</td>
                       <td>
                           <input type="text" id="txtEmail" placeholder="Email" />
                       </td>
                   </tr>
                   <tr>
                       <td>Password</td>
                       <td>
                           <input type="password" id="txtPassword" placeholder="Password" />
                       </td>
                   </tr>
                   <tr>
                       <td>Phone Number</td>
                       <td>
                           <input type="text" id="txtPhoneNumber" placeholder="Phone Number" />
                       </td>
                   </tr>
                   <tr class="Success">
                       <td colspan="3">
                           <input id="btnRegister" class="btn btn-success" type="button" value="Register" />
                       </td>
                   </tr>
               </tbody>
           </table>
           <div class="modal fade" tabindex="-1" id="successmodal"
               data-keyboard="false" data-bakcdrop="static">
               <div class="modal-dialouge modal-sm">
                   <div class="modal-content">
                       <div class="modal-header">
                           <button type="button" class="close" data-dismiss="modal">
                               &times;
                               <h3>Success</h3>
                           </button>
                       </div>
                       <div class="modal-body">
                           <h2>Registration successful</h2>
                       </div>
                       <div class ="modal-footer">
                           <button type="button" data-dismiss="modal" class="btn btn-danger">
                               Close
                           </button>
                       </div>
                   </div>
               </div>
           </div>
           <div id="error" class="alert alert-danger collapse">
               <a id="Close" class="close" href="#">&times;</a>
               <div id="ErrorText"></div>
           </div>
       </div>
   </div>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#Close').click(function(){

                $('#error').hide('fade');
            });
            $('#btnRegister').click(function () {


                //$.ajax({
                //    url: 'http://localhost/EventsGSUBusinessLibrary/api/account/Register',
                //    method: 'POST',
                //    data: {
                //        username: $('#txtUserName').val()
                //        email: $('#txtEmail').val(),
                //        password: $('#txtPassword').val(),
                //        confirmPassword: $('#txtConfirmPassword').val()
                //    },
                //    success: function () {
                //         $('#successmodal').modal(PopOut_Show);
                //    },
                //    error: function (jqXHR) {
                //        $('#ErrorText').text(jqXHR.responseText);
                //        $('#error').show('fade');

                //    }
                   
                //});


                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/register',
                    method: 'POST',
                    data: {
                        username: $('#txtUserName').val(),
                        useremail: $('#txtEmail').val(),
                        userpassword: $('#txtPassword').val(),
                        userphonenumber: $('#txtPhoneNumber').val()
                    },
                    success: function (response) {
                        //$('#successmodal').modal(s);
                        if (response.UFlag) {
                            $('#ErrorText').text(response.UMessage);
                             $('#error').show('fade');
                            //window.location.href = "http://localhost/EventsGSU_FA2018/Account/login.aspx";
                        }
                        else
                        {
                            $('#ErrorText').text(response.UMessage);
                            $('#error').show('fade');
                        }
                        
                    },
                    error: function (jqXHR) {
                        $('#ErrorText').text(jqXHR.responseText);
                        $('#error').show('fade');

                    }
                   
                });
                
            });
        });
    </script>
</asp:Content>
