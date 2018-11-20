<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin_Event_manage_Page.aspx.cs" Inherits="EventsGSU_FA2018.Admin.Admin_Event_manage_Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="col-md-10 col-md-offset-1">
        <div class="well">
            <table class="table table-bordered">

                <thead>
                    <tr class="Success">
                        <td colspan="3">
                            <h2>Update your Event</h2>
                        </td>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><span id="EventID"></span> Title</td>
                        <td>
                            <input type="text" id="txtTitle" placeholder="Title" />
                        </td>
                    </tr>
                    <tr>
                        <td><span id="UserID"></span> Type</td>
                        <td>
                            <input type="text" id="txtEventType" placeholder="Event Type" />
                        </td>
                    </tr>
                    <tr>
                        <td><span id ="UserTypeID"></span>Event Image</td>
                        <td>
                            <div>
                                <label id="lblImage"></label>
                                <label for="fileUpload" />
                                Select File to Upload:
                                <input id="fileUpload" type="file" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Event Date</td>
                        <td>
                            <input type="text" id="EventDate" />
                        </td>

                    </tr>
                    <tr>
                        <td>Event location</td>
                        <td>
                            <input id="pac-input" class="controls" type="text" placeholder="Location">
                            <br />
                            <div id="map" style="width: 100%; height: 400px;"></div>

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
                        <td><span id="EventsDescriptionID"></span>
                            <input type="text" id="txtEventDesc" placeholder="Please enter Description" size="700" />
                        </td>
                    </tr>

                    <tr class="Success">
                        <td colspan="3">
                            <h3>Update your ticket</h3>
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
                            <span id="TicketID"></span>
                            <input type="text" id="txtTicketPrice" placeholder="Please enter price" size="400" />
                        </td>

                    </tr>
                    <tr>

                        <td>Ticket Quantity</td>
                        <td>

                            <input type="number" id="TicketQuantity" />
                        </td>

                    </tr>
                    <%-- <tr>
                        <td>Ticket Image</td>
                        <td>
                            <input type="file" id="imgTicket" />
                        </td>
                    </tr>--%>
                    <tr class="Success">

                        <td colspan="3">
                            <input id="btnUploadFile" type="button" class="btn btn-success" value="Update Event" />
                            <span class="ui-helper-clearfix">If you want to update the Event Please choose the image</span>
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
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery.cookie-1.4.1.min.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
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

             var geocoder = new google.maps.Geocoder();
                var address = ('place-address');

                geocoder.geocode({ 'address': address }, function (results, status) {

                    if (status == google.maps.GeocoderStatus.OK) {
                        var latitude = results[0].geometry.location.lat('#Longitide').text;
                        var longitude = results[0].geometry.location.lng('#Latitude').text;
                        
                    }
                });
           
        }
        $('#txtEventType').autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/GetEventTypes',
                    data: { query: request.term },
                    dataType: 'json',
                    type: 'GET',
                    success: function (data) {
                        debugger;
                        response($.map(data, function (item) {
                            return {
                                label: item.EventType,
                                value: item.EventTypeID
                            }
                        }));
                    },
                    error: function (err) {
                        debugger;
                    }
                })
            },
            select: function (event, ui) {
                $('#txtEventType').val(ui.item.label);
                $('#Id').val(ui.item.value);
                return false;
            },
            minLength: 0
        });
        $(document).ready(function () {
            GetEventDetails();
             getCookies();
            debugger;
            validateRoles(utId);
           $('#btnUploadFile').on('click', function () {
                debugger;


                var data = new FormData();

                var files = $("#fileUpload").get(0).files;

                // Add the uploaded image content to the form data collection
                if (files.length > 0) {
                    data.append("UploadedImage", files[0]);
                }




               
              
                debugger;


                var eventData = {
                    eventtitle: $('#txtTitle').val(),
                    eventlocation: $('#txtEventLocation').val(),
                    eventimage: 'UploadedFiles/' + files[0].name, //$('#fileimg').val(),
                    eventtype: $('#txtEventType').val(),
                    ticketprice: $('#txtTicketPrice').val(),
                    ticketquantity: $('#TicketQuantity').val(),
                    eventsdescription: $('#txtEventDesc').val(),
                    eventdate: $('#EventDate').val(),
                    eventid: $('#EventID').val(),
                    ticketid: $('#TicketID').val(),
                    eventsdescriptionid: $('#EventsDescriptionID').val(),
                    userid: $('#UserID').val(),
                   
                    

                };
                var stringifyEventData = JSON.stringify(eventData);
               
                data.append("h", stringifyEventData);
               
                var ajaxRequest = $.ajax({
                    type: "POST",
                    
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/AdminUpdateFile',
                    contentType: false,
                    processData: false,
                    data: data
                }).done(function (result) {
                   $('#ErrorText').text("Event Update Success");
                      $('#error').show('fade');
                }).fail(function (a, b, c) {
                    console.log(a, b, c);
                });

               
            });
        });

        function GetEventDetails() {
            var queryParams = getQueryParams();
            
            $.ajax({
                url: 'http://localhost/EventsGSUBusinessLibrary/api/admin/GetAdminDetailsById?eventId=' + queryParams.eventID,
                method: 'GET',
                data: {
                   
                },

                success: function (response) {
                    $('#EventDate').val(response.EventDate);
                    $('#pac-input').val(response.EventLocation);
                    $('#txtTitle').val(response.EventTitle);
                    $('#txtEventType').val(response.EventType);
                    $('#txtEventDesc').val(response.EventsDescription);
                    $('#txtTicketPrice').val(response.TicketPrice);
                    $('#TicketQuantity').val(response.TicketQuantity);
                    $('#EventID').val(response.EventID);
                    $('#TicketID').val(response.TicketID);
                    $('#EventsDescriptionID').val(response.EventDetailsID);
                    $('#lblImage').text(response.EventImage);
                    $('#UserID').val(response.UserID);
                    

                    
                },
                error: function (b) {
                    alert("Problem Updating");
                }

            });

        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA85gagPRPBJuLwVVlXc_a-TBvGyfD3d90&callback=initMap&libraries=places" async defer
        type="text/javascript"></script>
</asp:Content>
