<%@ Page Language="C#" AutoEventWireup="false" CodeFile="Weather.aspx.cs" Inherits="Weather" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Weather</title>

    <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/redmond/jquery-ui.css" />    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>


    <link rel="stylesheet" href="css/pqselect.dev.css" />    
    <script src = "js/pqselect.dev.js"></script>


    <script type="text/javascript">
        $(function() {
            $("#select3").pqSelect({
                multiplePlaceholder: 'Select Countries',
                checkbox: true
            }).pqSelect('open');
        });
    </script>  

    <script type="text/javascript">
        function getstr() {

            var objSelect = document.getElementById("select3");
            var sss = "";
            for (var i = 0 ; i < objSelect.length ; i++) {
                if (objSelect.options[i].selected) 
                   sss += objSelect.options[i].text + "<br />";
            }
            document.getElementById("show").innerHTML = sss;
        }
    </script>  
</head>

<body>
    <input id="ciry"  name="请输入你所在城市" type="text" placeholder="请输入你所在城市" />
    <br />
    <div>
        <select id="select3" multiple="multiple" style="margin: 20px;width:300px;text-align:center;">    
            <option>RJ</option>
            <option>SP</option>
            <option>BC</option>
            <option>Québec</option>
            <option>Co. Cork</option>
            <option>Essex</option>
            <option>Isle of Wight</option>
            <option>AK</option>
            <option>CA</option>
            <option>ID</option>
            <option>MT</option>
            <option>NM</option>
            <option>OR</option>
            <option>WA</option>
            <option>WY</option>
            <option>DF</option>
            <option>Lara</option>
            <option>Nueva Esparta</option>
            <option>Táchira</option>
        </select>
        <br />
        <button onclick="getstr()"> but</button>
        <br />
        <h2 id ="show"></h2>
    </div>

</body>
</html>
