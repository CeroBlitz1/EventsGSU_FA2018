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
                            <%--<input type="text" id="txtEventLocation" placeholder="Enter location" />--%>
                            <input id="pac-input" class="controls" type="text" placeholder="Location">
                            <br />
                            <div id="map" style="width: 100%; height: 400px;"></div>
                           <%-- <div id="type-selector" class="pac-controls">
                               <%-- <input type="radio" name="type" id="changetype-all" checked="checked" >
                                <label for="changetype-all">All</label>

                                <input type="radio" name="type" id="changetype-establishment">
                                <label for="changetype-establishment">Establishments</label>

                                <input type="radio" name="type" id="changetype-address">
                                <label for="changetype-address">Addresses</label>

                                <input type="radio" name="type" id="changetype-geocode">
                                <label for="changetype-geocode">Geocodes</label>--%>
                            <%--</div>--%>
                            <%--<div id="strict-bounds-selector" class="pac-controls">
                                <input type="checkbox" id="use-strict-bounds" value="">
                                <label for="use-strict-bounds">Strict Bounds</label>
                            </div>--%>
        <%--</div>--%>
       <%-- <div id="pac-container">
            <input id="pac-input" type="text"
                placeholder="Enter a location">
        </div>
    </div>
    <div id="map"></div>--%>
    <div id="infowindow-content">
        <img src="" width="16" height="16" id="place-icon">
        <span id="place-name" class="title"></span>
        <br>
        <span id="place-address"></span>
    </div>

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
    <%--<tr>
                        <td>Ticket Image</td>
                        <td>
                            <input type="file" id="imgTicket" />
                        </td>
                    </tr>--%>
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
                    // User entered the name of a Place that was not suggested and
                    // pressed the Enter key, or the Place Details request failed.
                    window.alert("No details available for input: '" + place.name + "'");
                    return;
                }

                // If the place has a geometry, then present it on a map.
                if (place.geometry.viewport) {
                    map.fitBounds(place.geometry.viewport);
                } else {
                    map.setCenter(place.geometry.location);
                    map.setZoom(17);  // Why 17? Because it looks good.
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

            // Sets a listener on a radio button to change the filter type on Places
            // Autocomplete.
            function setupClickListener(id, types) {
                var radioButton = document.getElementById(id);
                radioButton.addEventListener('click', function () {
                    autocomplete.setTypes(types);
                });
            }

            setupClickListener('changetype-all', []);
            setupClickListener('changetype-address', ['address']);
            setupClickListener('changetype-establishment', ['establishment']);
            setupClickListener('changetype-geocode', ['geocode']);

            document.getElementById('use-strict-bounds')
                .addEventListener('click', function () {
                    console.log('Checkbox clicked! New state=' + this.checked);
                    autocomplete.setOptions({ strictBounds: this.checked });
                });
        }


        
        $(document).ready(function () {
            getCookies();
            debugger;
            validateRoles(utId);



            $('#btnUploadFile').on('click', function () {
                debugger;


                var data = new FormData();

                var files = $("#fileUpload").get(0).files;

                if (files.length > 0) {
                    data.append("UploadedImage", files[0]);
                }
                debugger;


                var eventData = {
                    eventtitle: $('#txtTitle').val(),
                    eventlocation: $('#pac-input').val(),
                    eventimage: 'UploadedFiles/' + files[0].name,
                    eventtype: $('#txtEventType').val(),
                    ticketprice: $('#txtTicketPrice').val(),
                    ticketquantity: $('#TicketQuantity').val(),
                    eventsdescription: $('#txtEventDesc').val(),
                    eventdate: $('#EventDate').val(),
                    userID: uID,
                    usertypeid: utId,

                };



                var stringifyEventData = JSON.stringify(eventData);

                data.append("h", stringifyEventData);

                var ajaxRequest = $.ajax({
                    type: "POST",

                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/UploadFile',
                    contentType: false,
                    processData: false,
                    data: data
                }).done(function (result) {
                    $('#ErrorText').text("Event Created..Check Manage Events");
                    $('#error').show('fade');
                }).fail(function (a, b, c) {
                    console.log(a, b, c);
                });

            });

        });
    </script>
    <%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC5DYAiJfNYAB1cYERKrZxU1YzceKhFYr0&libraries=places"></script>--%>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA85gagPRPBJuLwVVlXc_a-TBvGyfD3d90&callback=initMap&libraries=places" async defer
        type="text/javascript"></script>
</asp:Content>
