<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrganizeEvent.aspx.cs" Inherits="EventsGSU_FA2018.Events.OrganizeEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-10 col-md-offset-1">
        <div class="well">
            <table class="table table-bordered">

                <thead>
                    <tr class="Success">
                        <td colspan="3">
                            <h2>Create your Event</h2>
                        </td>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Event Title</td>
                        <td>
                            <input type="text" id="txtTitle" placeholder="Title" />
                        </td>
                    </tr>
                    <tr>
                        <td>Event Type</td>
                        <td>
                            <input type="text" id="txtEventType" placeholder="Event Type" />
                        </td>
                    </tr>
                    <tr>
                        <td>Event Image</td>
                        <td>
                            <div>
                                <label for="fileUpload" />
                                Select File to Upload:
                                <input id="fileUpload" type="file" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Event Date</td>
                        <td>
                            <input type="text" id="EventDate" value="mm/dd/yyyy" />
                        </td>

                    </tr>
                    <tr>
                        <td>Event location</td>
                        <td>
                            <input type="text" id="txtEventLocation" placeholder="Enter location" />
                        </td>

                    </tr>
                    <tr>

                        <td>Event Description</td>
                        <td>
                            <input type="text" id="txtEventDesc" placeholder="Please enter Description" size="700" />
                        </td>
                    </tr>

                    <tr class="Success">
                        <td colspan="3">
                            <h3>Create your ticket</h3>
                        </td>

                    </tr>
                    <%--<tr>

                        <td>Ticket Type</td>
                        <td>

                            <input type="text" id="txtTicketType" placeholder="Please enter Type of ticket" size="400" />
                        </td>

                    </tr>--%>
                    <tr>

                        <td>Ticket Price</td>
                        <td>

                            <input type="text" id="txtTicketPrice" placeholder="If ticket is free please put 0" size="600" />
                        </td>

                    </tr>
                    <tr>

                        <td>Ticket Quantity</td>
                        <td>

                            <input type="number" id="TicketQuantity" />
                        </td>

                    </tr>
                    <tr>
                        <td>Ticket Image</td>
                        <td>
                            <input type="file" id="imgTicket" />
                        </td>
                    </tr>
                    <tr class="Success">

                        <td colspan="3">
                            <input id="btnUploadFile" type="button" class="btn btn-success" value="Create Event" />
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
                            <h2>Creating successful</h2>
                        </div>
                        <div class="modal-footer">
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
    <%--  <script src="../Scripts/jQuery.FileUpload/jquery.fileupload.js"></script>
    <script src="../Scripts/jQuery.FileUpload/jquery.iframe-transport.js"></script> --%>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.js"></script>
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript">
        $(function () {
            $("#EventDate").datepicker();
        });
        { //$(function () {
            //    $("#fileimg").fileupload({
            //        'uploader': '../Uploadify/uploader.swf',
            //        'cancelImg': '../Uploadify/cancel.png',
            //        'buttonText': 'Browse Files',
            //        'script': '/Home/Index/',
            //        'folder': 'Images',
            //        'fileDesc': 'Image Files',
            //        'fileExt': '*.jpg;*.jpeg;*.gif;*.png',
            //        'multi': true,
            //        'auto': true
            //    });
        }
        $(document).ready(function () {
            getCookies();
            debugger;
            validateRoles(utId);
            {  //$('#Close').click(function () {

                //    $('#error').hide('fade');
                //});
                //$('#btnCreateEvent').click(function () {

                //    debugger;
                //    $.ajax({
                //        url: 'http://localhost/EventsGSUBusinessLibrary/api/register/CreateEvent',
                //        method: 'POST',
                //        data: {
                //            eventtitle: $('#txtTitle').val(),
                //            eventdate: $('#EventDate').val(),
                //            eventlocation: $('#txtEventLocation').val(),
                //            eventimage: $('#fileUpload').val(),
                //            eventtype: $('#txtEventType').val(),
                //            ticketimage: $('#imgTicket').val(),
                //            ticketprice: $('#txtTicketPrice').val(),
                //            ticketquantity: $('#TicketQuantity').val(),
                //            eventsdescription: $('#txtEventDesc').val(),
                //            //userID: $('#globalUserId').val()
                //        },
                //        success: function (s) {
                //            //$('#successmodal').modal(s);
                //            alert("Event Created");

                //        },
                //        error: function (jqXHR) {
                //            $('#ErrorText').text(jqXHR.responseText);
                //            $('#error').show('fade');

                //        }

                //    });

                //});


                //////////////////////////
            }
            //var output = {};
            //function getCookies() {
            //    var userCookie = document.cookie;// "referer=example.com/post?id=22;bcomID=8075; subreturn=example&fuzzy=true&ct=null&autobounce=true; JSESSIONID=6D20570E1EB; mbox=session";

            //    userCookie.split(/\s*;\s*/).forEach(function (pair) {
            //        pair = pair.split(/\s*=\s*/);
            //        output[pair[0]] = pair.splice(1).join('=');
            //    });
            //}

            $('#btnUploadFile').on('click', function () {
                debugger;


                var data = new FormData();

                var files = $("#fileUpload").get(0).files;

                // Add the uploaded image content to the form data collection
                if (files.length > 0) {
                    data.append("UploadedImage", files[0]);
                }




                //var userCookie = document.cookie;// "referer=example.com/post?id=22;bcomID=8075; subreturn=example&fuzzy=true&ct=null&autobounce=true; JSESSIONID=6D20570E1EB; mbox=session";
                //var output = {};
                //userCookie.split(/\s*;\s*/).forEach(function (pair) {
                //    pair = pair.split(/\s*=\s*/);
                //    output[pair[0]] = pair.splice(1).join('=');
                //});

                //var ddd = JSON.stringify(output, null, 4);
                getCookies();
                {
                    var utID = output["UserTypeID"];
                    var uID = output["UserID"];
                };

                debugger;


                var eventData = {
                    eventtitle: $('#txtTitle').val(),
                    eventlocation: $('#txtEventLocation').val(),
                    eventimage: 'UploadedFiles/' + files[0].name, //$('#fileimg').val(),
                    eventtype: $('#txtEventType').val(),
                    ticketimage: $('#imgTicket').val(),
                    ticketprice: $('#txtTicketPrice').val(),
                    ticketquantity: $('#TicketQuantity').val(),
                    eventsdescription: $('#txtEventDesc').val(),
                    eventdate: $('#EventDate').val(),
                    userID: uID,
                    usertypeid: utID

                };


                //data.append("g", "aa");
                //var jsonData = {};
                //jsonData['mm'] = eventData;
                var stringifyEventData = JSON.stringify(eventData);
                //var stringifyEventData = JSON.stringify(data1);
                data.append("h", stringifyEventData);
                ///




                // Make Ajax request with the contentType = false, and procesDate = false
                var ajaxRequest = $.ajax({
                    type: "POST",
                    //url: "/api/fileupload/uploadfile",
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/UploadFile',
                    contentType: false,
                    processData: false,
                    data: data
                }).done(function (result) {
                    alert(result);
                }).fail(function (a, b, c) {
                    console.log(a, b, c);
                });

                {
                    //$.ajax({
                    //    type: 'post',
                    //    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/UploadFile&b=2',
                    //    data: data,
                    //    dataType: 'json',
                    //    contentType: false,
                    //    processData: false,
                    //    success: function (response) {
                    //        alert('succes!!');
                    //    },
                    //    error: function (error) {
                    //        alert("errror");
                    //    }
                    //});
                    //ajaxRequest.done(function (xhr, textStatus) {

                    //    debugger;
                    //});
                }
            });



            ////////////////////


        });






        //});
    </script>
</asp:Content>
