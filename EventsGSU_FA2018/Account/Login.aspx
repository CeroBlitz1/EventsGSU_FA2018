<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EventsGSU_FA2018.Account.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="col-md-10 col-md-offset-1">
       <div class="well">
           <table class="table table-bordered">
               
               <thead>
                   <tr class="Success">
                       <td colspan="5">
                           <h2>Login Page</h2>
                       </td>

                   </tr>
               </thead>
               <tbody>
                   <tr>
                       <td>User Name</td>
                       <td>
                           <%--<asp:TextBox ID="TextBoxUser" runat="server"></asp:TextBox>--%>
                           <input type="text" id="txtUserName" placeholder="User Name" />
                       </td>
                   </tr>
                   
                   <tr>
                       <td style="height: 39px">Password</td>
                       <td style="height: 39px">
                           <%--<asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox>--%>
                           <input type="password" id="txtPassword" placeholder="Password" />
                       </td>
                   </tr>
                   
                   <tr class="Success">
                       <td colspan="3">
                           &nbsp;
                           <%--<asp:CheckBox ID="CheckBoxrem" runat="server" Text="Remember me?" />--%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <%--<asp:Button ID="ButtonLogin" runat="server" CssClass="btn-success" Height="46px" Text="Login" Width="96px" OnClick="ButtonLogin_Click" />--%>
                           <input id="btnLogin" class="btn btn-success" type="button" value="Login" />
&nbsp;</td>
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
                           <h2>login success</h2>
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
           <asp:Label ID="lblmsg" runat="server" CssClass="alert-danger"></asp:Label>
       </div>
   </div>
     <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#Close').click(function(){

                $('#error').hide('fade');
            });
            $('#btnLogin').click(function () {


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
                     url: 'http://localhost/EventsGSUBusinessLibrary/api/register/userLogin',
                    method: 'POST',
                    data: {
                        username: $('#txtUserName').val(),
                        userpassword: $('#txtPassword').val(),
                    },
                    success: function (response) {
                        if (response.UFlag) {
                            //Set Global UserId Here
                            $('#globalUserId').val(response.UserID);
                            //
                            window.location.href = "http://localhost/EventsGSU_FA2018/Index";
                        }
                        else
                        {
                            $('#ErrorText').text(response.UMessage);
                            $('#error').show('fade');
                        }
                        //$('#successmodal').text(response.UserEmail);
                        //$("#error").show('fade');
                       
                    },
                    error: function (error) {
                        $('#ErrorText').text(error.responseText);
                        $('#error').show('fade');

                    }
                   
                });
                
            });
        });
    </script>
</asp:Content>
