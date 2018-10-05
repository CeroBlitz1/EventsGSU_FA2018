<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="EventsGSU_FA2018.Events.Event" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table>
            <tr>
                <td>

                    <div id="indexEventID"></div>
                    <img id="indexImage1" src="" style="width: 350px" /></td>
            </tr>
            <tr>
                <td>
                    <div id="event1Date"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="event1Location"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="event1Title"></div>
                </td>
                <td>
                    <div id ="Indexdescription">111</div>
                </td>
            </tr>

        </table>
    </div>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            GetEventDetails()
            function GetEventDetails() {
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
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/GetEventDetails',
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
                        $('#indexEventID').text(response[0].EventID);
                        $('#Indexdescription').text(response[3].EventsDescription);

                        //$('#indexImage2')[0].src = 'http://localhost/EventsGSU_FA2018/' + response[1].EventImage;
                        //$('#event2Date').text(response[1].EventDate);
                        //$('#event2Location').text(response[1].EventLocation);
                        //$('#event2Title').text(response[1].EventTitle);
                        //$('#indexEventID1').val(response[1].EventID);

                        //$('#indexImage3')[0].src = 'http://localhost/EventsGSU_FA2018/' + response[2].EventImage;
                        //$('#event3Date').text(response[2].EventDate);
                        //$('#event3Location').text(response[2].EventLocation);
                        //$('#event3Title').text(response[2].EventTitle);
                        //$('#indexEventID2').val(response[2].EventID);
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
        });

    </script>
</asp:Content>

