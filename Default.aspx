<%@ Page Language="C#" AutoEventWireup="false" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8" />
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- Le JS -->
    <script type="text/javascript" src="js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/ladda.js"></script>
    <script type="text/javascript" src="js/login.js"></script>

    <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/login.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/ladda.css" rel="stylesheet" type="text/css" />
    <link href="css/CharacterStyle.css" rel="stylesheet" type="text/css" />


    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      
    <![endif]-->
    <script src="Scripts/html5shiv.js"></script>
</head>
<body>
    <div class="container">
        <div class="form-signin">
            <img src="img/weather.png" />
            <form method="POST" runat="server">
                <div id="form_signin" runat="server">
                    <input type="text" class="input-block-level" placeholder="Username" id="username" name="UserName"/>
                    <input type="password" class="input-block-level" placeholder="Password" id="password" name="Password"/>
                    <span id="wrongLogin" runat="server" class="CharacterStyle1"></span>
                    <br />
                    <button id="btnLogOn" class="btn btn-large btn-primary btn-block ladda-button zoom-out" type="button">
                        <span class="ladda-label">Login</span>
                        <span class="ladda-spinner"></span>
                        <div class="ladda-progress" style="width: 0px;"></div>
                    </button>

                </div>

                <div id="form_register" style="display: none" runat="server">
                    <input id="r_username" class="input-block-level" name="Username" type="text" placeholder="Username"/>
                    <input id="r_email" class="input-block-level" name="Email" type="text" placeholder="Email"/>
                    <input id="r_password" class="input-block-level" name="Password" type="password" placeholder="Password"/>
                    <input id="r_confirm" class="input-block-level" name="Confirm" type="password" placeholder="Confirm password"/>
                    <span id="wrongRegister" runat="server" class="CharacterStyle1"></span>
                    <br />
                    <button id="btnRegisterCancel" class="btn btn-inverse" type="button">Cancel</button>
                    <button id="btnRegisterSend" class="btn btn-success ladda-button zoom-out" type="button">
                        <span class="ladda-label">Register</span>
                        <span class="ladda-spinner"></span>
                        <div class="ladda-progress" style="width: 0px;"></div>
                    </button>

                </div>

                <div id="form_forgot" style="display: none" runat="server">
                    <input id="rec_email" class="input-block-level" name="Email" type="text" placeholder="Email" />
                    <span id="wrongForgot" runat="server" class="CharacterStyle1"></span>
                    <br />
                    <button id="btnForgotCancel" class="btn btn-inverse" type="button">Cancel</button>
                    <button id="btnForgotSend" class="btn btn-danger ladda-button zoom-out" type="button">
                        <span class="ladda-label">Recover</span>
                        <span class="ladda-spinner"></span>
                        <div class="ladda-progress" style="width: 0px;"></div>
                    </button>
                    
                </div>
            </form>
        </div>


        <div id="well" class="well well-small">
            <p style="margin: 0">Don't have an account? <strong><a id="btnRegister">Register now!</a></strong></p>
        </div>
        <p id="copyright">&copy; Company Name - <a id="btnForgot">Forgot your password?</a></p>
    </div> <!-- /container -->

    <script>
        // Bind normal buttons
        Ladda.bind('.ladda-button', { timeout: 1000 });
    </script>
</body>
</html>
