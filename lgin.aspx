<%@ Page Title="" Language="vb" AutoEventWireup="false" CodeBehind="lgin.aspx.vb" Inherits="Dynamic_Data.lgin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Legales | Login</title>
    <meta name="description" content="mobile first, app, web app, responsive, admin dashboard, flat, flat ui">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/style.css">
    <!--[if lt IE 9]>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/html5.js"></script>
  <![endif]-->
</head>
<body>
    <!-- header -->
    <header id="header" class="navbar bg bg-black">
        <a class="navbar-brand" href="#">SL</a>
    </header>
    <!-- / header -->
    <section id="content">
        <div class="main padder">
            <div class="row">
                <div class="col-lg-4 col-lg-offset-4 m-t-large">
                    <section class="panel">
                        <header class="panel-heading text-center">
                            Login
                        </header>
                        <form runat="server" class="panel-body">
                            <div class="block">
                                <label class="control-label">Usuario</label>
                                <asp:TextBox ID="usuario" placeholder="usuario" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="block">
                                <label class="control-label">Clave</label>
                                <asp:TextBox ID="clave" TextMode="Password" placeholder="Password" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="line line-dashed"></div>
                            <asp:Button ID="Button1" runat="server" class="btn btn-info" OnClick="Button1_Click" Text="Login" />

                        </form>
                    </section>
                </div>
            </div>
        </div>
    </section>
    <!-- footer -->
    <footer id="footer">
        <div class="text-center padder clearfix">
            <p>
                <small>© SL, Sistema de gestion</small><br>
                <br>
                <a href="#" class="btn btn-xs btn-circle btn-twitter"><i class="fa fa-twitter"></i></a>
                <a href="#" class="btn btn-xs btn-circle btn-facebook"><i class="fa fa-facebook"></i></a>
                <a href="#" class="btn btn-xs btn-circle btn-gplus"><i class="fa fa-google-plus"></i></a>
            </p>
        </div>
    </footer>
    <!-- / footer -->
    <script src="js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.js"></script>
    <!-- app -->
    <script src="js/app.js"></script>
    <script src="js/app.plugin.js"></script>
    <script src="js/app.data.js"></script>
</body>
</html>
