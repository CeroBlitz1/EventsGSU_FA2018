<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="EventsGSU_FA2018._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <table class="nav-justified">
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:ImageButton ID="ImageButton1" runat="server" Height="96px" Width="1241px" ImageUrl="~/SiteImages/GSUlogo.png" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <div class="ui-widget">
                    <input type="text" id="Event" placeholder="Search for a product" required />
                    <input type="button" value="Search" id="submit" />
                    <input type="hidden" id ="Id" />
                </div>

                <%--<label for="Location">Location: </label>
                <input id="Location" />--%>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <br />
                <input type="button" id="SearchButton" class="btn btn-success" value="Search" />
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
                            </tr>

                        </table>

                    </div>
                    <div class="col-md-4">
                        <table>
                            <tr>
                                <td>
                                    <div id="indexEventID1"></div>
                                    <img id="indexImage2" src="Images/img2.jpg" style="width: 350px" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="event2Date"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="event2Location"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="event2Title"></div>
                                </td>
                            </tr>
                            <tr>
                        </table>

                    </div>
                    <div class="col-md-4">
                        <table>
                            <tr>
                                <td>
                                    <div id="indexEventID2" class='Iamstupidclss'></div>
                                    <img id="indexImage3" src="Images/img3.jpg" style="width: 350px" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="event3Date"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="event3Location"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="event3Title"></div>
                                </td>
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
    <script src="Scripts/jquery.cookie-1.4.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <%-- <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
                <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">--%>
    <script type="text/javascript">

        FindIdentProjects =
            {
                BindControlEvents: function () {

                    $(document).ready(function () {

                        GetEvents();
                        //GetSearchEvents();


                        //$('#globalUserId').val("");


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


                        ////serach////////////////////////////////////

                        //$(function () {

                        //    $("#Event").autocomplete({
                        //        source: function (request, response) {
                        //            jQuery.get($('#Event').val(), {
                        //                query: request.term
                        //            }, function (data) {
                        //                // assuming data is a JavaScript array such as
                        //                // ["one@abc.de", "onf@abc.de","ong@abc.de"]
                        //                // and not a string

                        //                var valresponse = [];
                        //                debugger;

                        //                $.ajax({
                        //                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/getsearchevents',
                        //                    method: 'GET',
                        //                    data: {

                        //                    },
                        //                    success: function (response) {

                        //                        $.each(response, function (index, value) {
                        //                            debugger;
                        //                            valresponse.push(value.EventTitle)
                        //                        });
                        //                        //var availableTags = valresponse;
                        //                        //$('#Event').autocomplete({
                        //                        //    source: availableTags
                        //                        //});

                        //                    },
                        //                    error: function (error) {
                        //                        $('#ErrorText').text(error.responseText);
                        //                        $('#error').show('fade');
                        //                    }

                        //                });




                        //                response(valresponse);
                        //            });
                        //        },
                        //        minLength: 2
                        //    });

                        //});







                        ////serach////////////////////////////////////

                        ////////////////////----------------------




                        $('#Event').autocomplete({
                            source: function (request, response) {
                                $.ajax({
                                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/getsearchevents',
                                    data: { query: request.term },
                                    dataType: 'json',
                                    type: 'GET',
                                    success: function (data) {
                                        debugger;
                                        response($.map(data, function (item) {
                                            return {
                                                label: item.EventTitle,
                                                value: item.EventID
                                            }
                                        }));
                                    },
                                    error: function (err) {
                                        debugger;
                                    }
                                })
                            },
                            select: function (event, ui) {
                                $('#Event').val(ui.item.label);
                                $('#Id').val(ui.item.value);
                                return false;
                            },
                            minLength: 1
                        });


                        //$(function () {
                        //    var availableTags = [];
                        //    var valresponse = [];
                        //    $.ajax({
                        //        url: 'http://localhost/EventsGSUBusinessLibrary/api/register/getsearchevents',
                        //        method: 'GET',
                        //        data: {

                        //        },
                        //        success: function (response) {

                        //            $.each(response, function (index, value) {
                        //                //debugger;
                        //                valresponse.push(value.EventTitle)
                        //            });
                        //            debugger;
                        //            availableTags = valresponse;
                        //            //var availableTags = valresponse;
                        //            $('#Event').autocomplete({
                        //                source: availableTags
                        //            });

                        //        },
                        //        error: function (error) {
                        //            $('#ErrorText').text(error.responseText);
                        //            $('#error').show('fade');
                        //        }

                        //    });

                        //    $("#Event").autocomplete({
                        //        source: availableTags
                        //    });
                        //});

                        //////////////////---------------------







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
                }
            }



        //test//////////////////////////////////////////////////////




        ////$(function () {
        ////    var availableTags = [];               
        ////    var valresponse = [];
        ////    $.ajax({
        ////        url: 'http://localhost/EventsGSUBusinessLibrary/api/register/getsearchevents',
        ////        method: 'GET',
        ////        data: {

        ////        },
        ////        success: function (response) {

        ////            $.each(response, function (index, value) {
        ////                //debugger;
        ////                valresponse.push(value.EventTitle)
        ////            });

        ////            availableTags = valresponse;
        ////            //var availableTags = valresponse;
        ////            $('#Event').autocomplete({
        ////                source: availableTags
        ////            });

        ////        },
        ////        error: function (error) {
        ////            $('#ErrorText').text(error.responseText);
        ////            $('#error').show('fade');
        ////        }

        ////    });

        ////        $("#Event").autocomplete({
        ////            source: availableTags
        ////        });
        ////    });



        //$(function () {

        //       $("#Event").autocomplete({
        //           source: function (request, response) {
        //               jQuery.get($('#Event').val(), {
        //                   query: request.term
        //               }, function (data) {
        //                   // assuming data is a JavaScript array such as
        //                   // ["one@abc.de", "onf@abc.de","ong@abc.de"]
        //                   // and not a string

        //                   var valresponse = [];
        //                   debugger;

        //                   $.ajax({
        //                       url: 'http://localhost/EventsGSUBusinessLibrary/api/register/getsearchevents',
        //                       method: 'GET',
        //                       data: {

        //                       },
        //                       success: function (response) {

        //                           $.each(response, function (index, value) {
        //                               debugger;
        //                               valresponse.push(value.EventTitle)
        //                           });
        //                           //var availableTags = valresponse;
        //                           //$('#Event').autocomplete({
        //                           //    source: availableTags
        //                           //});

        //                       },
        //                       error: function (error) {
        //                           $('#ErrorText').text(error.responseText);
        //                           $('#error').show('fade');
        //                       }

        //                   });




        //                   response(valresponse);
        //               });
        //           },
        //           minLength: 2
        //       });

        //   });



        //$(function () {


        //    var availableTags = [
        //        "ActionScript",
        //        "AppleScript",
        //        "Asp",
        //        "BASIC",
        //        "C",
        //        "C++",
        //        "Clojure",
        //        "COBOL",
        //        "ColdFusion",
        //        "Erlang",
        //        "Fortran",
        //        "Groovy",
        //        "Haskell",
        //        "Java",
        //        "JavaScript",
        //        "Lisp",
        //        "Perl",
        //        "PHP",
        //        "Python",
        //        "Ruby",
        //        "Scala",
        //        "Scheme"
        //    ];





        //    $("#Event").autocomplete({
        //        source: availableTags
        //    });
        //});
        /////////////////////////////////////////////

        function GetEvents() {

            //debugger;

            $.ajax({
                url: 'http://localhost/EventsGSUBusinessLibrary/api/register/getEvents',
                method: 'GET',
                data: {
                    EventLocation: "",
                    EventImage: ""
                },
                success: function (response) {
                    //debugger;

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
        function GetSearchEvents() {


            //jQuery("input.suggest-user").autocomplete({
            //    source: function (request, response) {
            //        jQuery.get("usernames.action", {
            //            query: request.term
            //        }, function (data) {
            //            // assuming data is a JavaScript array such as
            //            // ["one@abc.de", "onf@abc.de","ong@abc.de"]
            //            // and not a string
            //            response(data);
            //        });
            //    },
            //    minLength: 3
            //});


            $.ajax({
                url: 'http://localhost/EventsGSUBusinessLibrary/api/register/getsearchevents',
                method: 'GET',
                data: {

                },
                success: function (response) {
                    debugger;

                    //var valdata = [response]


                    var valresponse = [];
                    //var  t = 0;
                    //var obj = {};
                    //$.each(obj in response)
                    //{
                    //    valresponse.push(obj.EventTitle)
                    //}

                    $.each(response, function (index, value) {
                        debugger;
                        valresponse.push(value.EventTitle)
                    });



                    var availableTags = valresponse;
                    $('#Event').autocomplete({
                        source: availableTags
                    });

                },
                error: function (error) {
                    $('#ErrorText').text(error.responseText);
                    $('#error').show('fade');
                }

            });
        }
        $(function () {
            FindIdentProjects.BindControlEvents();
        });
    </script>


</asp:Content>
