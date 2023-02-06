<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="pages/images/head.png">
    <title>Login |<?php include('dist/includes/title.php');?></title>
    <!-- Bootstrap Core CSS -->
     
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min3.css">	
    <!-- Custom CSS -->
    <link href="bootstrap/css/style.min.css" rel="stylesheet">
                              
                              
  <?php 
$ff=	check_lice();
if($ff==1) {header('Location:key.php');}
?> 
</head>

<body>
    <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <section id="wrapper" class="login-register">
        <div class="login-box login-sidebar">
            <div class="white-box">
                <form class="form-horizontal form-material"  action="login.php" method="post">
                    <a href="javascript:void(0)" class="text-center db"><img src="pages/images/logo1.png" width="190px" height="70px" alt="Home" />
                        </a>
                    <div class="form-group m-t-40">
                        <div class="col-xs-12">
                            <input class="form-control" type="text" required="" name="username" placeholder="Username"> </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <input class="form-control" type="password" required="" name="password" placeholder="Password"> </div>
                    </div>
					
					<div class="form-group has-feedback">
               <select class="form-control select2" style="width:100%" name="branch" required>
                <?php
				include('dist/includes/dbcon.php');

                   $query3=mysqli_query($con,"select * from branch order by branch_name")or die(mysqli_error($con));
                      while($row3=mysqli_fetch_array($query3)){
                ?>
                    <option value="<?php echo $row3['branch_id'];?>"><?php echo $row3['branch_name'];?></option>
                  <?php }?>
                </select>
          </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <div class="checkbox checkbox-primary pull-left p-t-0">
                                <input id="checkbox-signup" type="checkbox">
                                <label for="checkbox-signup"> Remember me </label>
                            </div> 
							</div>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" name="login" type="submit">Log In</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 m-t-10 text-center">
                            <div class="social">
                                <a href="javascript:void(0)" class="btn  btn-facebook" data-toggle="tooltip" title="Login with Facebook"> <i aria-hidden="true" class="fa fa-facebook"></i> </a>
                                <a href="javascript:void(0)" class="btn btn-googleplus" data-toggle="tooltip" title="Login with Google"> <i aria-hidden="true" class="fa fa-google-plus"></i> </a>
                            </div>
                        </div>
                    </div>
                    
                </form>
               
            </div>
        </div>
    </section>
    <!-- jQuery -->
    <script src="plugins/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
   
   <script src="bootstrap/js/bootstrap.min.js"></script>

    
    <!--slimscroll JavaScript -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
   
    <script src="bootstrap/css/custom.min.js"></script>
   
</body>

</html>