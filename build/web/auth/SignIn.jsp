<%-- 
    Document   : SignUp
    Created on : 01-May-2023, 3:24:26 pm
    Author     : ashis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js " lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Responsive Bootstrap 5 admin template and web Application ui kit.">
    <meta name="keyword" content="ALUI, Bootstrap 5, ReactJs, Angular, Laravel, VueJs, ASP .Net, Admin Dashboard, Admin Theme">
    <title>SQL Query Executor</title>
    <!-- <link rel="icon" href="favicon.ico" type="image/x-icon"> Favicon -->
    <link rel="stylesheet" href="css/style.css">
    <!-- project css file  -->
    <link rel="stylesheet" href="css/al.style.min.css">
    <!-- project layout css file -->
    <link rel="stylesheet" href="css/layout.e.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>

<body>

    <label id="alertbox">
        <input type="checkbox" class="alertCheckbox" autocomplete="off" />
        <div id="alertclass" class="alert success">
            <span class="alertClose" style="margin-left: 2vw;">X</span>
            <span class="alertText" id="alerttext"></span>
        </div>
    </label>

    <div id="layout-e" class="theme-green">

        <!-- main body area -->
        <div class="main auth-div p-2 py-3 p-xl-5">

            <!-- Body: Body -->
            <div class="body d-flex p-0 p-xl-5">
                <div class="container-fluid">

                    <div class="row g-0">
                        <div class="col-lg-6 d-none d-lg-flex justify-content-center align-items-center rounded-lg auth-h100">
                            <div style="max-width: 25rem;">
                                <div class="mb-5">
                                    <h6 class="color-900">Welcome to</h6>
                                    <h1><span class="gradient-color-blue-green">SQL Query Executor</span></h1>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 d-flex justify-content-center align-items-center border-0 rounded-lg auth-h100">
                            <div class="w-100 p-4 p-md-5 card border-0" style="max-width: 32rem;">
                                <!-- Form -->
                                <form class="row g-1 p-0 p-md-4" id='signin-form'>
                                    <div class="col-12 text-center mb-5">
                                        <h1>Sign in</h1>
                                        <span>Get Free Hands-On SQL Query Executor.</span>
                                    </div>
                                    <div class="col-12">
                                        <div class="mb-2">
                                            <label class="form-label">Email address</label>
                                            <input type="email" id="email" class="form-control form-control-lg" placeholder="name@example.com">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="mb-2">
                                            <div class="form-label">
                                                <span class="d-flex justify-content-between align-items-center">
                                                    Password
                                                </span>
                                            </div>
                                            <input type="password" id="password" class="form-control form-control-lg" placeholder="***************">
                                        </div>
                                    </div>
                                    <div class="col-12 text-center mt-4">
                                        <button type="submit" class="btn btn-lg btn-block btn-dark lift text-uppercase">SIGN IN</button>
                                    </div>
                                    <div class="col-12 text-center mt-4">
                                        <span class="text-muted">Don't have an account yet? <a href="Register">Sign up here</a></span>
                                    </div>
                                </form>
                                <!-- End Form -->
                            </div>
                        </div>
                    </div> <!-- End Row -->

                </div>
            </div>

        </div>

    </div>


    <script>
        function validateEmail() {
            const emailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if ($('#email').val() == '') {
                $('#alertclass').removeClass();
                $('#alertclass').addClass('alert warning');
                $('#alerttext').html('Please Enter Email');
                $('#alertbox').fadeIn().delay(4000).fadeOut();
                return false;
            } else if (!$('#email').val().match(emailformat)) {
                $('#alertclass').removeClass();
                $('#alertclass').addClass('alert error');
                $('#alerttext').html('Invalid Email');
                $('#alertbox').fadeIn().delay(4000).fadeOut();
                return false;
            }
            return true;

        }

        function validatePassword() {
            if ($('#password').val() == '') {
                $('#alertclass').removeClass();
                $('#alertclass').addClass('alert warning');
                $('#alerttext').html('Please Enter Password');
                $('#alertbox').fadeIn().delay(4000).fadeOut()
                return false;
            } else if (!(/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/.test($('#password').val()))) {
                $('#alertclass').removeClass();
                $('#alertclass').addClass('alert error');
                $('#alerttext').html('Invalid Password');
                $('#alertbox').fadeIn().delay(4000).fadeOut()
                return false;
            }
            return true;

        }


        $(document).ready(function() {
            $('#alertbox').hide();
            $('#signin-form').on('submit', function(e) {
                e.preventDefault();
                if (validateEmail()) {
                    if (validatePassword()) {
                        $.ajax({
                            url: 'RegisterServlet',
                            type: "POST",
                            data: {
                                email: $('#email').val(),
                                pass: $('#password').val()
                            },
                            success: function(data) {
                                console.log(data);
                                if (data === '1') {
                                    $('#alertclass').removeClass();
                                    $('#alertclass').addClass('alert success');
                                    $('#alerttext').html("SignUp Succesful");
                                    $('#alertbox').fadeIn().delay(4000).fadeOut().after(window.location.href = '/login');
                                } else if (data === '0') {
                                    $('#alertclass').removeClass();
                                    $('#alertclass').addClass('alert error');
                                    $('#alerttext').html("Invalid Password");
                                    $('#alertbox').fadeIn().delay(4000).fadeOut()
                                } else if (data === '2'){
                                    $('#alertclass').removeClass();
                                    $('#alertclass').addClass('alert error');
                                    $('#alerttext').html("Account doesn't Exists... <br>Try Create one...");
                                    $('#alertbox').fadeIn().delay(4000).fadeOut()
                                } else {
                                    $('#alertclass').removeClass();
                                    $('#alertclass').addClass('alert error');
                                    $('#alerttext').html("Server Error");
                                    $( '#alertbox').fadeIn().delay(4000).fadeOut()
                                }
                            }
                        })
                    }
                }



            })
        })
    </script>

    <!-- Jquery Core Js -->
    <!-- <script src="https://embed.tawk.to/_s/v4/app/637ddf31c8f/js/twk-main.js" charset="UTF-8" crossorigin="*"></script>
    <script src="https://embed.tawk.to/_s/v4/app/637ddf31c8f/js/twk-vendor.js" charset="UTF-8" crossorigin="*"></script>
    <script src="https://embed.tawk.to/_s/v4/app/637ddf31c8f/js/twk-chunk-vendors.js" charset="UTF-8" crossorigin="*"></script>
    <script src="https://embed.tawk.to/_s/v4/app/637ddf31c8f/js/twk-chunk-common.js" charset="UTF-8" crossorigin="*"></script>
    <script src="https://embed.tawk.to/_s/v4/app/637ddf31c8f/js/twk-runtime.js" charset="UTF-8" crossorigin="*"></script>
    <script src="https://embed.tawk.to/_s/v4/app/637ddf31c8f/js/twk-app.js" charset="UTF-8" crossorigin="*"></script>
    <script async="" src="https://embed.tawk.to/59f5afbbbb0c3f433d4c5c4c/default" charset="UTF-8" crossorigin="*"></script>
    <script src="../../../assets/bundles/libscripts.bundle.js"></script>

    Jquery Page Js
    <script src="../../../assets/js/template.js"></script>


    <script async="" charset="UTF-8" src="https://embed.tawk.to/_s/v4/app/637ddf31c8f/languages/en.js"></script> -->
</body>

</html>