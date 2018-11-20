<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="EventsGSU_FA2018.Events.Event" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="well">
        <table>
            <tr>
                <td>


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
                    <div id="EventType" hidden></div>
                    <div id="event1Title"></div>
                </td>
                <td></td>
                
            </tr>



        </table>
        
    </div>
    <input id="pac-input" class="controls" type="text" placeholder="Location">
    <span>Please Click to access location</span><br />
    <div id="map" style="width: 100%; height: 400px;"></div>
    <div id="infowindow-content">
        <img src="" width="16" height="16" id="place-icon">
        <span id="place-name" class="title"></span>
        <br>
        <span id="place-address"></span>
    </div>
    <div class="Well">
        <div class="row">


            <div class="column col-xs-9">
            </div>
            <div class="column col-xs-3" id="sidebar">
                <div id="Indexdescription"></div>
                <div id="indexEventID" hidden></div>
                <label>Ticket Price:</label><span id="TicketPrice"></span>
                <input id="btnpayment" type="button" class="btn btn-success btn-lg" value="Tickets" />
            </div>
            <input type="button" class="btn btn-success" id="getSimEvents" value="Click here to Get More events" />
         <div id="tbldata"></div></div>

    </div>

    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/underscore.min.js"></script>
    <script type="text/javascript">
        function getQueryParams(queryString) {
            var query = (queryString || window.location.search).substring(1);
            if (!query) {
                return false;
            }
            return _
                .chain(query.split('&'))
                .map(function (params) {
                    var p = params.split('=');
                    return [p[0], decodeURIComponent(p[1])];
                })
                .object()
                .value();
        }
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 41.881832, lng: -87.623177 },
                zoom: 13
            });
            var card = document.getElementById('pac-card');
            var input = document.getElementById('pac-input');
            var types = document.getElementById('type-selector');
            var strictBounds = document.getElementById('strict-bounds-selector');

            map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

            var autocomplete = new google.maps.places.Autocomplete(input);

            // Bind the map's bounds (viewport) property to the autocomplete object,
            // so that the autocomplete requests use the current map bounds for the
            // bounds option in the request.
            autocomplete.bindTo('bounds', map);

            // Set the data fields to return when the user selects a place.
            autocomplete.setFields(
                ['address_components', 'geometry', 'icon', 'name']);

            var infowindow = new google.maps.InfoWindow();
            var infowindowContent = document.getElementById('infowindow-content');
            infowindow.setContent(infowindowContent);
            var marker = new google.maps.Marker({
                map: map,
                anchorPoint: new google.maps.Point(0, -29)
            });

            autocomplete.addListener('place_changed', function () {
                infowindow.close();
                marker.setVisible(false);
                var place = autocomplete.getPlace();
                if (!place.geometry) {

                    window.alert("No details available for input: '" + place.name + "'");
                    return;
                }


                if (place.geometry.viewport) {
                    map.fitBounds(place.geometry.viewport);
                } else {
                    map.setCenter(place.geometry.location);
                    map.setZoom(17);
                }
                marker.setPosition(place.geometry.location);
                marker.setVisible(true);

                var address = '';
                if (place.address_components) {
                    address = [
                        (place.address_components[0] && place.address_components[0].short_name || ''),
                        (place.address_components[1] && place.address_components[1].short_name || ''),
                        (place.address_components[2] && place.address_components[2].short_name || '')
                    ].join(' ');
                }

                infowindowContent.children['place-icon'].src = place.icon;
                infowindowContent.children['place-name'].textContent = place.name;
                infowindowContent.children['place-address'].textContent = address;
                infowindow.open(map, marker);
            });


        }
        $(document).ready(function () {

            getCookies();
            validateRoles(utId);
            GetEventDetails();

            $(function () {
                $(document).ready(function () {

                });
            });





            function GetEventDetails() {


                var queryParams = getQueryParams();

                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/getdetailsbyid?eventId=' + queryParams.eventID,
                    method: 'GET',
                    data: {
                        EventLocation: "",
                        EventImage: ""
                    },


                    success: function (response) {
                        debugger;

                        $('#indexImage1')[0].src = 'http://localhost/EventsGSUBusinessLibrary/' + response.EventImage;
                        $('#event1Date').text(response.EventDate);
                        $('#event1Location').text(response.EventLocation);
                        $('#pac-input').val(response.EventLocation);
                        $('#event1Title').text(response.EventTitle);
                        $('#indexEventID').text(response.EventID);
                        $('#Indexdescription').text(response.EventsDescription);
                        $('#TicketPrice').text(response.TicketPrice);
                        $('#indexEventID').val(response.EventID);
                        var firstItemImageEle = document.getElementById("indexEventID");
                        firstItemImageEle.setAttribute("data-eventID", response.EventID);
                        $('#indexEventID').data('eventId', response.EventID);
                        $('#EventType').val(response.EventType);
                        $('#EventType').data('eventtype', response.EventType)
                        $('#btnpayment').click(function () {



                            var clickItemImageEle = document.getElementById("indexEventID");
                            var eventID = clickItemImageEle.getAttribute("data-eventID");



                            window.location.href = "http://localhost/EventsGSU_FA2018/Payment/finalize_payment.aspx?eventID=" + eventID;
                        });

                    },
                    error: function (error) {
                        $('#ErrorText').text(error.responseText);
                        $('#error').show('fade');

                    }

                });



            }

            $('#getSimEvents').click(function () {
                {


                    var eventtype = document.getElementById('EventType').value;

                    $.ajax({
                        url: 'http://localhost/EventsGSUBusinessLibrary/api/register/GetEventByTypes?EventType=' + eventtype,
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

                        var tableOutline = '';

                        for (var i = 0; i < data.length; i++) {
                            tableOutline = tableOutline +
                                '<a href="' + 'http://localhost/EventsGSU_FA2018/Events/Event.aspx?eventID=' +
                                data[i].EventID + '"><div style = "width: 250px; display: inline-block; padding: 20px" class="col-md-4 eventblock" > <div id="indexEventID' + i + '"></div><div><img id="indexImage' + i + '" src="' +
                                'http://localhost/EventsGSUBusinessLibrary/' + data[i].EventImage + '" style="width: 100px"></div><div id="event' + i + 'Date">' +
                                data[i].EventDate + '</div><div id="event' + i + 'Location">' +
                                data[i].EventLocation + '</div><div id="event' + i + 'Title">' +
                                data[i].EventTitle + '</div></div></a>';
                        }
                        $('#tbldata').append(tableOutline);
                        $('#tbldata').show();
                    }
                }

            });




        });


    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA85gagPRPBJuLwVVlXc_a-TBvGyfD3d90&callback=initMap&libraries=places" async defer
        type="text/javascript"></script>

</asp:Content>

