<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="OrganizeEvent.aspx.cs" Inherits="EventsGSU_FA2018.Events.OrganizeEvent" %>
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
                           <input type="file" id="fileimg" />
                       </td>
                   </tr>
                   <%--<tr>
                       <td>Event Date</td>
                       <td>
                           <input type="date" id="EventDate"  />
                       </td>    
                   </tr>--%>
                   <tr>
                       <td>Event location</td>
                       <td>
                           <input type="text" id="txtEventLocation" placeholder="Enter location" />
                       </td>

                   </tr>
                   <tr>
                       
                   <td>Event Description</td>
                       <td>
                           <input type="text" id="txtEventDesc" placeholder="Please enter Description" size="700"   />
                       </td>
                     </tr>
              <thead>
                   <tr class="Success">
                       <td colspan="3">
                           <h3>Create your ticket</h3>
                       </td>

                   </tr>
               </thead>
                    <tr> 

                       <td>Ticket Type</td>
                       <td>
                            
                           <input type="text" id="txtTicketType" placeholder="Please enter Type of ticket" size="400" />
                       </td>

                   </tr>
                     <tr> 

                       <td>Ticket Price</td>
                       <td>
                            
                           <input type="text" id="txtTicketPrice" placeholder="Please enter price" size="400" />
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
                           <input id="btnCreateEvent" class="btn btn-success" type="button" value="Create Event" />
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
       </div>
   </div>
     <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#Close').click(function(){

                $('#error').hide('fade');
            });
            $('#btnCreateEvent').click(function () {

                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/register/Create',
                    method: 'POST',
                    data: {
                        eventtitle: $('#txtTitle').val(),
                        eventlocation: $('#txtEventLocation').val(),
                        eventimage: $('#fileimg').val(),
                        eventtype: $('#txtEventType').val(),
                        ticketimage: $('#imgTicket').val(),
                        ticketprice: $('#txtTicketPrice').val(),
                        ticketquantity: $('#TicketQuantity').val(),
                        eventsdescription : $('#txtEventDesc').val()
                    },
                    success: function (s) {
                        $('#successmodal').modal(s);
                        alert("Event Created");
                        
                    },
                    error: function (jqXHR) {
                        $('#ErrorText').text(jqXHR.responseText);
                        $('#error').show('fade');

                    }
                   
                });
                
            });
        });
    </script>
</asp:Content>
