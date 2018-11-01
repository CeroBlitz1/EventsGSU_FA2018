<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Autocomplete.aspx.cs" Inherits="EventsGSU_FA2018.Autocomplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Autocomplete - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  //    $(function () {


  //  var availableTags = [
  //    "ActionScript",
  //    "AppleScript",
  //    "Asp",
  //    "BASIC",
  //    "C",
  //    "C++",
  //    "Clojure",
  //    "COBOL",
  //    "ColdFusion",
  //    "Erlang",
  //    "Fortran",
  //    "Groovy",
  //    "Haskell",
  //    "Java",
  //    "JavaScript",
  //    "Lisp",
  //    "Perl",
  //    "PHP",
  //    "Python",
  //    "Ruby",
  //    "Scala",
  //    "Scheme"
  //    ];




  //  $( "#tags" ).autocomplete({
  //    source: availableTags
  //  });
  //} );

<div class="ui-widget">
  <label for="city">Your city: </label>
    <input id="city">
    <a href="http://geonames.org">geonames.org</a>
</div>

<div class="ui-widget" style="margin-top:2em; font-family:Arial">
  Result:
  <div id="log" style="height: 200px; width: 300px; overflow: auto;" class="ui-widget-content"></div>
</div>
  </script>
</head>
<body>
 
<div class="ui-widget">
  <label for="tags">Tags: </label>
  <input id="tags">
</div>
 
 
</body>
</html>
</asp:Content>
