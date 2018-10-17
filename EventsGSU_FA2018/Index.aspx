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

                                   <div id="indexEventID"></div> 
                                    <img id="indexImage1" src="Images/img1.jpg" style="width: 350px" /></td>
                            </tr>
                            <tr>
                                <td><div id="event1Date"></div></td>
                            </tr>
                            <tr>
                                <td><div id="event1Location"></div></td>
                            </tr>
                            <tr>
                                <td><div id="event1Title"></div></td>
                            </tr>

                        </table>

                    </div>
                    <div class="col-md-4">
                        <table>
                            <tr>
                                <td>
                                    <div id="indexEventID1"></div><img id="indexImage2" src="Images/img2.jpg" style="width: 350px" /></td>
                            </tr>
                             <tr>
                                <td><div id="event2Date"></div></td>
                            </tr>
                            <tr>
                                <td><div id="event2Location"></div></td>
                            </tr>
                            <tr>
                                <td><div id="event2Title"></div></td>
                            </tr>
                            <tr>
                              

                        </table>

                    </div>
                    <div class="col-md-4">
                        <table>
                            <tr>
                                <td>
                                    <div id="indexEventID2" class='Iamstupidclss'></div><img id="indexImage3" src="Images/img3.jpg" style="width: 350px" /></td>
                            </tr>
                            <tr>
                                <td><div id="event3Date"></div></td>
                            </tr>
                            <tr>
                                <td><div id="event3Location"></div></td>
                            </tr>
                            <tr>
                                <td><div id="event3Title"></div></td>
                            </tr>
                            <tr>

                        </table>

                    </div>

                </div>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            
            GetEvents();


            $('#globalUserId').val("sdfsdf");


            $('#indexImage1').click(function () {


                //alert("I am here");
                var clickItemImageEle = document.getElementById("indexImage1");
                var eventID = clickItemImageEle.getAttribute("data-eventID");

                

                window.location.href = "http://localhost/EventsGSU_FA2018/Events/Event.aspx?eventID=" + eventID;
            });
             $('#indexImage2').click(function () {


                //alert("I am here");
                var clickItemImageEle = document.getElementById("indexImage2");
                var eventID = clickItemImageEle.getAttribute("data-eventID");
                

                window.location.href = "http://localhost/EventsGSU_FA2018/Events/Event.aspx?eventID=" + eventID;
            });
             $('#indexImage3').click(function () {


                //alert("I am here");
                var clickItemImageEle = document.getElementById("indexImage3");
                var eventID = clickItemImageEle.getAttribute("data-eventID");
                

                window.location.href = "http://localhost/EventsGSU_FA2018/Events/Event.aspx?eventID=" + eventID;
                 });

                
                //$.ajax({
                //    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/userLogin',
                //    method: 'POST',
                //    data: {
                //        username: $('#txtUserName').val(),
                //        userpassword: $('#txtPassword').val(),
                //    },
                //    success: function (response) {
                //        if (response.UFlag) {
                //            window.location.href = "http://localhost/EventsGSU_FA2018/Events/Event.aspx";
                //        }
                //        else {
                //            $('#ErrorText').text(response.UMessage);
                //            $('#error').show('fade');
                //        }
                //        //$('#successmodal').text(response.UserEmail);
                //        //$("#error").show('fade');

                //    },
                //    error: function (error) {
                //        $('#ErrorText').text(error.responseText);
                //        $('#error').show('fade');

                //    }

                //});

           
        });
        function GetEvents() {
            //if (response.EFlag) {
            //                window.location.href = "http://localhost/EventsGSU_FA2018/Events/Event.aspx";
            //            }
            //            else {
            //                $('#ErrorText').text(response.UMessage);
            //                $('#error').show('fade');
            //            }
            //            $('#successmodal').text(response.UserEmail);
            //            $("#error").show('fade');
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

                    //$('#indexImage1')[0].src = 'http://localhost/EventsGSU_FA2018/' + response[0].EventImage;
                    $('#indexImage1')[0].src = 'http://localhost/EventsGSUBusinessLibrary/' + 'UploadedFiles/img4.jpg';
                    $('#event1Date').text(response[0].EventDate);
                    $('#event1Location').text(response[0].EventLocation);
                    $('#event1Title').text(response[0].EventTitle);
                    $('#indexEventID').val(response[0].EventID);
                    var firstItemImageEle = document.getElementById("indexImage1");
                    firstItemImageEle.setAttribute("data-eventID", response[0].EventID); 
                    $('#indexEventID').data('eventId', response[0].EventID);

                    $('#indexImage2')[0].src = 'http://localhost/EventsGSU_FA2018/' + response[1].EventImage;
                    $('#event2Date').text(response[1].EventDate);
                    $('#event2Location').text(response[1].EventLocation);
                    $('#event2Title').text(response[1].EventTitle);
                    $('#indexEventID1').val(response[1].EventID);
                    var firstItemImageEle = document.getElementById("indexImage2");
                    firstItemImageEle.setAttribute("data-eventID", response[1].EventID); 
                    $('#indexEventID1').data('eventId', response[1].EventID);

                     $('#indexImage3')[0].src = 'http://localhost/EventsGSU_FA2018/' + response[2].EventImage;
                    $('#event3Date').text(response[2].EventDate);
                    $('#event3Location').text(response[2].EventLocation);
                    $('#event3Title').text(response[2].EventTitle);
                    $('#indexEventID2').val(response[2].EventID);
                    var firstItemImageEle = document.getElementById("indexImage3");
                    firstItemImageEle.setAttribute("data-eventID", response[2].EventID); 
                    $('#indexEventID1').data('eventId', response[2].EventID);
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
