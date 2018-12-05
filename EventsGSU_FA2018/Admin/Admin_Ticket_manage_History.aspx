﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin_Ticket_manage_History.aspx.cs" Inherits="EventsGSU_FA2018.Admin.Admin_user_Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>User Ticket Portal</h1>
    <div class="well">
        <label>Event Title :</label><input type="text" id="EventTitle" style="width: auto" disabled />
        <br />
        <br />
        <label>Tickets Purchased :</label><input type="text" id="TicketsPurchased" style="width: auto" disabled />
        <br />
        <br />
        <label>UserID :</label><input type="text" id="UserID" style="width: auto" disabled />
        <br />
        <br />
        <label>Payment paid :</label><input type="text" id="PaymentPaid" style="width: auto" disabled />
        <br />
        <br />
        <label>is Delete :</label><input type="text" id="IsDelete" style="width: auto" disabled />
        <br />
        <br />
        <span id="TicketID" hidden></span>
        <span id="PayemntHistoryID" hidden></span>
        <span id="UserTypeID" hidden></span>
        <span id="EventID" hidden></span>
        <span id="PaymentID" hidden></span>
        <br />
        <br />
        <input type="button" id="Delete" class="btn btn-danger" value="Delete payment" />
    </div>

    <div id="error" class="alert alert-danger collapse">
        <a id="Close" class="close" href="#">&times;</a>
        <div id="ErrorText"></div>
    </div>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/underscore.min.js"></script>
    <script type="text/javascript">
        var getUrlParameter = function getUrlParameter(sParam) {
            var sPageURL = window.location.search.substring(1),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                }
            }
           
            
            var us = sParameterName[1]
            var et = sParameterName[3]
            


        };
        $(document).ready(function () {
            getCookies();
            validateRoles(utId);
            GetUserDetails();

            $('#Delete').click(function () {
                $.ajax({
                    url: 'http://localhost/EventsGSUBusinessLibrary/api/Delete/Deletepayment',
                    method: 'POST',
                    data: {

                        ticketspurchased: $('#TicketsPurchased').val(),
                        userid: $('#UserID').val(),
                        userpaymentpaid: $('#PaymentPaid').val(),
                        ticketid: $('#TicketID').val(),
                        paymenthistoryid: $('#PayemntHistoryID').val(),
                        usertypeid: $('#UserTypeID').val(),
                        eventid: $('#EventID').val(),
                        paymentid: $('#PaymentID').val(),
                        isdelete: $('#IsDelete').val()


                    },
                    success: function (response) {
                        $('#ErrorText').text(response.UMessage);
                        $('#error').show('fade');
                    },
                    error: function (jqXHR) {
                        $('#ErrorText').text(jqXHR.responseText);
                        $('#error').show('fade');

                    }
                });
            });



        });
        function GetUserDetails() {
            var queryParams1 = getUrlParameter('userID');
            var queryparams2 = getUrlParameter('EventTitle');
            $.ajax({
                url: 'http://localhost/EventsGSUBusinessLibrary/api/admin/GetPurchaseListAdmin?UserID=' + queryParams1 +'&EventTitle='+ queryparams2,
                method: 'GET',
                data: {},
                success: function (response) {
                    $('#EventTitle').val(response.EventTitle);
                    $('#TicketsPurchased').val(response.TicketsPurchased);
                    $('#UserID').val(response.UserID);
                    $('#PaymentPaid').val(response.UserPaymentPaid);
                    $('#IsDelete').val(response.isDelete);
                    $('#TicketID').val(response.TicketID);
                    $('#PayemntHistoryID').val(response.PaymentHistoryID);
                    $('#UserTypeID').val(response.UserTypeID);
                    $('#EventID').val(response.EventID);
                    $('#PaymentID').val(response.PaymentID);



                },
                error: function (error) {
                    $('#ErrorText').text(error.responseText);
                    $('#error').show('fade');


                },
            });
        }

    </script>


</asp:Content>
