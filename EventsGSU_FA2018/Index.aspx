<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="EventsGSU_FA2018._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <table class="nav-justified">
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:ImageButton ID="ImageButton1" runat="server" Height="96px" Width="1241px" ImageUrl="~/Site Images/GSUlogo.png" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:TextBox ID="TextBox_Search" runat="server"></asp:TextBox>
                &nbsp;<asp:DropDownList ID="DropDownList_search" runat="server">
                </asp:DropDownList>
                &nbsp;<asp:DropDownList ID="DropDownList_Search_2" runat="server">
                </asp:DropDownList>
                &nbsp;<asp:Button ID="Button_search" runat="server" Text="Search" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <div class="row">
                    <div class="col-md-4">
                        <table>
                            <tr>
                                <td>
                                    <img id="indexImage1" src="Images/img1.jpg" style="width: 350px" /></td>
                            </tr>
                            <tr>
                                <td><div id="event1Date">ddd</div></td>
                            </tr>
                            <tr>
                                <td><div id="event1Location">llll</div></td>
                            </tr>
                            <tr>
                                <td><div id="event1Title">ttt</div></td>
                            </tr>

                        </table>

                    </div>
                    <div class="col-md-4">
                        <table>
                            <tr>
                                <td>
                                    <img id="indexImage2" src="Images/img2.jpg" style="width: 350px" /></td>
                            </tr>
                            <tr>
                                <td>Fri, Sep 21
                    6:00 PM</td>
                            </tr>
                            <tr>
                                <td>CHICAGO : BFUNK WORKSHOPS | #WEFUNK NORTH AMERICA TOUR SEP 21, 22 &amp; 23</td>
                            </tr>

                        </table>

                    </div>
                    <div class="col-md-4">
                        <table>
                            <tr>
                                <td>
                                    <img id="indexImage3" src="Images/img3.jpg" style="width: 350px" /></td>
                            </tr>
                            <tr>
                                <td>Fri, Sep 21
                    6:00 PM</td>
                            </tr>
                            <tr>
                                <td>CHICAGO : BFUNK WORKSHOPS | #WEFUNK NORTH AMERICA TOUR SEP 21, 22 &amp; 23</td>
                            </tr>

                        </table>

                    </div>

                </div>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            GetEvents();





            $('#indexImage1').click(function () {


                //alert("I am here");
                //window.location.href = "http://localhost/EventsGSU_FA2018/Events/Event.aspx";


                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/userLogin',
                    method: 'POST',
                    data: {
                        username: $('#txtUserName').val(),
                        userpassword: $('#txtPassword').val(),
                    },
                    success: function (response) {
                        if (response.UFlag) {
                            window.location.href = "http://localhost/EventsGSU_FA2018/Events/Event.aspx";
                        }
                        else {
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

        function GetEvents() {
            debugger;

            $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/getEvents',
                    method: 'GET',
                    data: {
                        EventLocation: "",
                        EventImage: ""
                    },
                success: function (response) {
                    debugger;

                    $('#indexImage1')[0].src = 'http://localhost/EventsGSU_FA2018/' + response[0].EventImage;
                    $('#event1Date').text(response[0].EventDate);
                    $('#event1Location').text(response[0].EventLocation);
                    $('#event1Title').text(response[0].EventTitle);
                        //if (response.EFlag) {
                        //    window.location.href = "http://localhost/EventsGSU_FA2018/Events/Event.aspx";
                        //}
                        //else {
                        //    $('#ErrorText').text(response.UMessage);
                        //    $('#error').show('fade');
                        //}
                        //$('#successmodal').text(response.UserEmail);
                        //$("#error").show('fade');


                    },
                    error: function (error) {
                        $('#ErrorText').text(error.responseText);
                        $('#error').show('fade');

                    }

                });

            }
    </script>


</asp:Content>
