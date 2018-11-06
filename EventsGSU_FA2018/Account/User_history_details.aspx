<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="User_history_details.aspx.cs" Inherits="EventsGSU_FA2018.Account.User_history_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3>User History Page</h3>
    <div class="col-md-10 col-md-offset-1">
        <div class="well">
            <input type="button" id="btnLoadEvents" class="btn btn-success" value="Get User History" />
        </div>
        <div class="well hidden" id="datadiv">
            <table class=" table table-bordered" id="tbldata">
                <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Tickets Purchased</th>
                        <th>Card Expiration</th>
                        <th>Event Title</th>
                        <%--<th>EventType</th>
                        <th>EventLocation</th>
                        <th>EventsDescription</th>
                        <th>TicketID</th>
                        <th>TicketImage</th>
                        <th>TicketPrice</th>
                        <th>TicketQuantity</th>--%>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/underscore.min.js"></script>
    <script type="text/javascript">
        var uID = 0;
        $(document).ready(function () {
            //debugger;
            getCookies();
        });
       
        function getCookies() {
            var userCookie = document.cookie;// "referer=example.com/post?id=22;bcomID=8075; subreturn=example&fuzzy=true&ct=null&autobounce=true; JSESSIONID=6D20570E1EB; mbox=session";
            var output = {};
            userCookie.split(/\s*;\s*/).forEach(function (pair) {
                pair = pair.split(/\s*=\s*/);
                output[pair[0]] = pair.splice(1).join('=');
                uID = output["UserID"];
                
            });
        }
        $('#btnLoadEvents').click(function () {
            
            
            
            //debugger;
            
           
            //var uID = output["UserID"];
            
            $.ajax({
                url: 'http://localhost/EventsGSUBusinessLibrary/api/register/GetUserDetails?UserID=' + uID,
                method: 'GET',
                //data: {
                //    //EventLocation: "",
                //    //EventImage: ""
                //},
                success: function (response) {
                    debugger;
                    {
                        //$('#datadiv').html('');
                        //$('#datadiv').show();
                    }
                    $('#datadiv').removeClass('hidden');
                    { //var row = "";
                    //$.each(response, function (index, value) {
                    //    debugger;
                    //    row += '<tr><td>' + value.FirstName + '</td><td>'
                    //        + value.LastName + '</td><td>'
                    //        + value.UserEmail + '</td><td>'
                    //        + value.TickesPurchased + '</td><td>'
                    //        + value.UserCardExpiration + '</td><td>'
                    //        + value.EventTitle + '</td>'
                    //        //+ value.EventType + '</td><td>'
                    //        //+ value.EventLocation + '</td><td>'
                    //        //+ value.EventsDescription + '</td><td>'
                    //        //+ value.TicketID + '</td><td>'
                    //        //+ value.TicketImage + '</td><td>'
                    //        //+ value.TicketPrice + '</td><td>'
                    //        //+ value.TicketQuantity + '</td><td>'
                    //        + '</tr>';
                        

                    //});

                    //$('#tbldata').html(row);
                        }
                    writetable(response);



                },
                error: function (error) {
                    $('#ErrorText').text(error.responseText);
                    $('#error').show('fade');

                }
            });
        });

        function writetable(data) {
        var tableOutline = '<tr><td>';

        for (var i = 0; i < data.length; i++) {

            {  //tableOutline = tableOutline + '<tr id="row_' + data[i].ARPT_IDENT_CD + '"onclick="getprjIdentNbr(this,' + "'" + data[i].ARPT_IDENT_CD + "'," + data[i].ARPT_ID + ')"class = "' + "" + '" "><td>';
                //tableOutline = tableOutline + '<a>'
                //    + data[i].ARPT_IDENT_CD + '</a></td><td>'
                //    + data[i].MUN_NM + '</td><td>'
                //    + data[i].ProjectRegion + '</td><td>'
                //    + data[i].DIST_CD + '</td><td>'
                //    + data[i].ARPT_PROJ_PFX_CD + '</td><td>'
                //    + data[i].ARPT_NPIAS_IND + '</td><td>'
                //    + data[i].ARPT_VEND_NBR_CD
                //    + '</td></tr>';
            }
            
            tableOutline = tableOutline 
                + data[i].FirstName + '</td><td>'
                + data[i].LastName + '</td><td>'
                + data[i].UserEmail + '</td><td>'
                + data[i].TickesPurchased + '</td><td>'
                + data[i].UserCardExpiration + '</td><td>'
                + data[i].EventTitle
                + '</td></tr>';   


        }
        tableOutline = tableOutline;
        $('#tbldata').append(tableOutline);
        $('#tbldata').show();
    }


    </script>

</asp:Content>
