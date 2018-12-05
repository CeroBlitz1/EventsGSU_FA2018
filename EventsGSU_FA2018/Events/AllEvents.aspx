<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AllEvents.aspx.cs" Inherits="EventsGSU_FA2018.Events.AllEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <table>
        <tr>
            <td id="tbldata">
                <div ></div>
                
            </td>
        </tr>
   </table>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/EventStyle.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            getCookies();
            debugger;
            validateRoles(utId);
            GetEvents();





            //$('#indexImage1').click(function () {


            //    //alert("I am here");
            //    var clickItemImageEle = document.getElementById("indexImage1");
            //    var eventID = clickItemImageEle.getAttribute("data-eventID");



            //    window.location.href = "http://localhost/EventsGSU_FA2018/Events/Event.aspx?eventID=" + eventID;
            //});
            //$('#indexImage2').click(function () {


            //    //alert("I am here");
            //    var clickItemImageEle = document.getElementById("indexImage2");
            //    var eventID = clickItemImageEle.getAttribute("data-eventID");


            //    window.location.href = "http://localhost/EventsGSU_FA2018/Events/Event.aspx?eventID=" + eventID;
            //});
            //$('#indexImage3').click(function () {


            //    //alert("I am here");
            //    var clickItemImageEle = document.getElementById("indexImage3");
            //    var eventID = clickItemImageEle.getAttribute("data-eventID");


            //    window.location.href = "http://localhost/EventsGSU_FA2018/Events/Event.aspx?eventID=" + eventID;
            //});


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
                    writetable(response);

                    debugger;
                    if (response.EFlag) {
                        window.location.href = "http://localhost/EventsGSU_FA2018/Events/Event.aspx";
                    }
                    else {
                        $('#ErrorText').text(response.UMessage);
                        $('#error').show('fade');
                    }
                    $('#successmodal').text(response.UserEmail);
                    $("#error").show('fade');

                },
                error: function (error) {
                    $('#ErrorText').text(error.responseText);
                    $('#error').show('fade');

                }

            });
            function writetable(data) {
                //debugger;
                var tableOutline = '';
                
                for (var i = 0; i < data.length; i++) {
                    tableOutline = tableOutline +
                        '<a  class = "eventblock" href="' + 'http://localhost/EventsGSU_FA2018/Events/Event.aspx?eventID=' +
                        data[i].EventID + '"><div style = "width: 250px; display: inline-block; padding: 20px" class="col-md-4 eventblock" > <div id="indexEventID'+ i +'"></div><div><img id="indexImage' + i + '" src="' +
                        'http://localhost/EventsGSUBusinessLibrary/' + data[i].EventImage + '" style="width: 210px"></div><div id="event' + i + 'Date">' +
                        data[i].EventDate + '</div><div id="event'+ i +'Location">' +
                        data[i].EventLocation + '</div><div id="event'+ i +'Title">' +
                        data[i].EventTitle + '</div></div></a>';
                  }
                $('#tbldata').append(tableOutline);
                $('#tbldata').show();
            }

        }
    </script>
</asp:Content>
