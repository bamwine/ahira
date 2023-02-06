<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" type="image/png" sizes="16x16" href="pages/images/head.png">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="Neon Admin Panel" />
        <meta name="author" content="" />

        <title><?php echo 'Product Key'; ?> | <?php include('dist/includes/title.php');?></title>

        <link rel="stylesheet" href="dist/assets/css/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
        <link rel="stylesheet" href="dist/assets/css/font-icons/entypo/css/entypo.css">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
        <link rel="stylesheet" href="dist/assets/css/bootstrap.css">
        <link rel="stylesheet" href="dist/assets/css/neon-core.css">
        <link rel="stylesheet" href="dist/assets/css/neon-theme.css">
        <link rel="stylesheet" href="dist/assets/css/neon-forms.css">
        <link rel="stylesheet" href="dist/assets/css/custom.css">
		
		
		<link href="dist/assets/css/easyResponsiveTabs.css" rel="stylesheet" type="text/css" media="all" />

        <script src="plugins/jquery/dist/jquery.min.js"></script>
		 <script src="dist/assets/css/jquery-1.11.0.min.js"></script>
		<script src="bootstrap/css/bootstrap.min3.css"></script>
<?php
//$ff=	check_lice();
//if($ff==1) {header('Location:key.php');} 
// else { header('Location:index.php');}

include('dist/includes/dbcon.php');?>
       
</head>

<?php	  
  if(isset($_POST["key"])){
      

	  
        $key                  = $_POST["key"];
		$sys_cod              = $_POST["sys_cod"];
		
		
		
		$code = h_encrypt_decrypt($key,'decrypt');
		//header('Location:'.$code.'.php');
		$expire = substr($code,14);
//header('Location:'.$sys_cod.'.php');		
		$sys_cod_chk =substr($code,0,13);
			
	 if ($sys_cod==$sys_cod_chk) 
        {
			//header('Location:'.$sys_cod_chk.'.php');
			
			$time = strtotime('-1 days');
			$today = date("Y-m-d H:i:s", $time);			
			
			$query2=mysqli_query($con,"UPDATE valid SET tkl ='$key',startd ='$today',enda ='$expire' WHERE systemco = '$sys_cod';")or die(mysqli_error($con));
		
		header('Location:index.php');
		}
	
	//else{header('Location:key.php');}
	
  }

  
?>
<body class="login-page" >
 
		  <div class="login-header login-caret ">

                <div class="login-content" style="width:100%;">

                    <a href="" class="logo">
                        <img src="pages/images/logo1.png" height="60" alt="" />
                    </a>

                    <p class="description">
                        <h2 style="color:#cacaca; font-weight:100;">
                            
                        </h2>
                    </p>
                   <p class="description" style="color:#cacaca; font-weight:100;">copy and send Us the system code below <br/> and we send you a new product Key to activate.</p>
					

                    <!-- progress bar indicator -->
                    <div class="login-progressbar-indicator">
                        <h3>43%</h3>
                        <span>resetting Product Key...</span>
                    </div>
                </div>

            </div>
	<div class="main">
	
		
		<div class="content">
			
			<script src="dist/assets/css/easyResponsiveTabs.js" type="text/javascript"></script>
					<script type="text/javascript">
						$(document).ready(function () {
							$('#horizontalTab').easyResponsiveTabs({
								type: 'default', //Types: default, vertical, accordion           
								width: 'auto', //auto or any width like 600px
								fit: true   // 100% fit in a container
							});
						});
						
					</script>
						<div class="sap_tabs">
							<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
								<div class="pay-tabs">
									<h2>Select Payment Method</h2>
									  <ul class="resp-tabs-list">
										  <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span><label class="pic1" style=" background: url(uploads/icons/key.jpg) no-repeat 20px 0px #fafafa !important;"></label>Activation Key</span></li>
										  <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span><label class="pic3" style=" background: url(uploads/icons/mm.png) no-repeat 20px 0px #fafafa !important;"></label>Mobile Money</span></li>
										  <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span><label class="pic4" style=" background: url(uploads/icons/paypal.png) no-repeat 20px 0px #fafafa !important;"></label>PayPal</span></li> 
										  <li class="resp-tab-item" aria-controls="tab_item-3" role="tab"><span><label class="pic2" style=" background: url(uploads/icons/wu.png) no-repeat 6px 5px #fafafa !important;"></label>Western Union</span></li>
										  
										  <div class="clear"></div>
									  </ul>	
								</div>
								<div class="resp-tabs-container">
									<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
										<div class="payment-info">
											<div class="login-form">

                <div class="login-content">

                     <div class="form-login-error">
                        <h3>Invalid Product Key or Expired</h3>
                        <p>Please enter correct Product Key!</p>
                    </div>
                    <form method="post"  action="key.php">

                        <div class="form-forgotpassword-success">
                            <i class="entypo-check"></i>
                            <h3>Successful Registered Your Product.</h3>
                            <p>Your Subscription Has been renewed Thank!</p>
                        </div>

                        <div class="form-steps">

                            <div class="step current" id="step-1">

                               		<div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="entypo-key"></i> SYSTEM CODE
                                        </div>

                                        <input type="text" class="form-control" readonly  name="sys_cod" id="scode" value="<?php  $query88=mysqli_query($con,"SELECT systemco FROM valid")or die(mysqli_error($con));
										$row5= mysqli_fetch_array($query88);
										echo $row5['systemco'];
										?>"  autocomplete="off" />
                                    </div>
                                </div>
								
								<div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="entypo-key"></i>
                                        </div>

                                        <input type="text" class="form-control" name="key" id="pkey" placeholder="Enter new product key"  />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <button type="submit" class="btn btn-info btn-block btn-login">
                                        Validate Key
                                        <i class="entypo-right-open-mini"></i>
                                    </button>
                                </div>

                            </div>

                        </div>

                    </form>



                    <div class="login-bottom-links">

                        <a href="index.php" class="link">
                            <i class="entypo-lock"></i>
                            return_to_login_page
                        </a>


                    </div>

                </div>

            </div>

     
										</div>
									</div>
									<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
										<div class="payment-info">
											


<ul class="nav nav-tabs bordered">
	<li class="active">
	<a href="#branches" data-toggle="tab">
	<span class="hidden-xs">MTN money</span>
	</a>
	</li>

	<li>
	<a href="#lnterest" data-toggle="tab">
	<span class="hidden-xs">Airtel money</span>
	</a>
	</li>
	
	
</ul>
<div class="tab-content">

<div class="tab-pane active" id="branches">
<br>
<div class="row">
	<div class="col-md-12">
    
    <div class="payment-info">
											<h3>Personal Information</h3>
											<form>
												<div class="tab-for">				
													<h5>EMAIL ADDRESS</h5>
														<input type="text" value="">
													<h5>FIRST NAME</h5>													
														<input type="text" value="">
												</div>			
											</form>
											<h3 class="pay-title">Credit Card Info</h3>
											<form>
												<div class="tab-for">				
													<h5>NAME ON CARD</h5>
														<input type="text" value="">
													<h5>CARD NUMBER</h5>													
														<input class="pay-logo" type="text" value="0000-0000-0000-0000" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '0000-0000-0000-0000';}" required="">
												</div>	
												<div class="transaction">
													<div class="tab-form-left user-form">
														<h5>EXPIRATION</h5>
															<ul>
																<li>
																	<input type="number" class="text_box" type="text" value="6" min="1" />	
																</li>
																<li>
																	<input type="number" class="text_box" type="text" value="1988" min="1" />	
																</li>
																
															</ul>
													</div>
													<div class="tab-form-right user-form-rt">
														<h5>CVV NUMBER</h5>													
														<input type="text" value="xxxx" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'xxxx';}" required="">
													</div>
													<div class="clear"></div>
												</div>
												<input type="submit" value="SUBMIT">
											</form>
											<div class="single-bottom">
													<ul>
														<li>
															<input type="checkbox"  id="brand" value="">
															<label for="brand"><span></span>By checking this box, I agree to the Terms & Conditions & Privacy Policy.</label>
														</li>
													</ul>
											</div>
										</div>
									
	</div>

</div>

</div>

<div class="tab-pane" id="lnterest">
<br>
<div class="row">
	<div class="col-md-12">
    <div class="payment-info">
											
											<h3 class="pay-title">Dedit Card Info</h3>
											<form>
												<div class="tab-for">				
													<h5>NAME ON CARD</h5>
														<input type="text" value="">
													<h5>CARD NUMBER</h5>													
														<input class="pay-logo" type="text" value="0000-0000-0000-0000" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '0000-0000-0000-0000';}" required="">
												</div>	
												<div class="transaction">
													<div class="tab-form-left user-form">
														<h5>EXPIRATION</h5>
															<ul>
																<li>
																	<input type="number" class="text_box" type="text" value="6" min="1" />	
																</li>
																<li>
																	<input type="number" class="text_box" type="text" value="1988" min="1" />	
																</li>
																
															</ul>
													</div>
													<div class="tab-form-right user-form-rt">
														<h5>CVV NUMBER</h5>													
														<input type="text" value="xxxx" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'xxxx';}" required="">
													</div>
													<div class="clear"></div>
												</div>
												<input type="submit" value="SUBMIT">
											</form>
											<div class="single-bottom">
													<ul>
														<li>
															<input type="checkbox"  id="brand" value="">
															<label for="brand"><span></span>By checking this box, I agree to the Terms & Conditions & Privacy Policy.</label>
														</li>
													</ul>
											</div>
										</div>	
									
	</div>
</div>


</div>


</div>





<!-----  DATA TABLE EXPORT CONFIGURATIONS ---->                      
<script type="text/javascript">

    jQuery(document).ready(function($)
    {
        

        var datatable = $("#table_export").dataTable({
            "sPaginationType": "bootstrap",
            "sDom": "<'row'<'col-xs-3 col-left'l><'col-xs-9 col-right'<'export-data'T>f>r>t<'row'<'col-xs-3 col-left'i><'col-xs-9 col-right'p>>",
            "oTableTools": {
                "aButtons": [
                    
                    {
                        "sExtends": "xls",
                        "mColumns": [1,2,3]
                    },
                    {
                        "sExtends": "pdf",
                        "mColumns": [1,2,3]
                    },
                    {
                        "sExtends": "print",
                        "fnSetText"    : "Press 'esc' to return",
                        "fnClick": function (nButton, oConfig) {
                            datatable.fnSetColumnVis(4, false);
                            
                            this.fnPrint( true, oConfig );
                            
                            window.print();
                            
                            $(window).keyup(function(e) {
                                  if (e.which == 27) {
                                      datatable.fnSetColumnVis(4, true);
                                  }
                            });
                        },
                        
                    },
                ]
            },
            
        });
        
        $(".dataTables_wrapper select").select2({
            minimumResultsForSearch: -1
        });
    });
        
</script>


										</div>
									
									</div>
									<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
										<div class="payment-info">
											<h3>PayPal</h3>
											<h4>Already Have A PayPal Account?</h4>
											<div class="login-tab">
												<div class="user-login">
													<h2>Login</h2>
													
													<form>
														<input type="text" value="name@email.com" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'name@email.com';}" required="">
														<input type="password" value="PASSWORD" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'PASSWORD';}" required="">
															<div class="user-grids">
																<div class="user-left">
																	<div class="single-bottom">
																			<ul>
																				<li>
																					<input type="checkbox"  id="brand1" value="">
																					<label for="brand1"><span></span>Remember me?</label>
																				</li>
																			</ul>
																	</div>
																</div>
																<div class="user-right">
																	<input type="submit" value="LOGIN">
																</div>
																<div class="clear"></div>
															</div>
													</form>
												</div>
											</div>
										</div>
									</div>
									<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-3">	
										<div class="payment-info">
											


<ul class="nav nav-tabs bordered">
	<li class="active">
	<a href="#Credit" data-toggle="tab">
	<span class="hidden-xs"><?php echo get_phrase('Credit Card Info');?></span>
	</a>
	</li>

	<li>
	<a href="#Dedit" data-toggle="tab">
	<span class="hidden-xs"><?php echo get_phrase('Dedit Card Info');?></span>
	</a>
	</li>
	
	
</ul>
<div class="tab-content">

<div class="tab-pane active" id="Credit">
<br>
<div class="row">
	<div class="col-md-12">
    
    <div class="payment-info">
											<h3>Personal Information</h3>
											<form>
												<div class="tab-for">				
													<h5>EMAIL ADDRESS</h5>
														<input type="text" value="">
													<h5>FIRST NAME</h5>													
														<input type="text" value="">
												</div>			
											</form>
											<h3 class="pay-title">Credit Card Info</h3>
											<form>
												<div class="tab-for">				
													<h5>NAME ON CARD</h5>
														<input type="text" value="">
													<h5>CARD NUMBER</h5>													
														<input class="pay-logo" type="text" value="0000-0000-0000-0000" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '0000-0000-0000-0000';}" required="">
												</div>	
												<div class="transaction">
													<div class="tab-form-left user-form">
														<h5>EXPIRATION</h5>
															<ul>
																<li>
																	<input type="number" class="text_box" type="text" value="6" min="1" />	
																</li>
																<li>
																	<input type="number" class="text_box" type="text" value="1988" min="1" />	
																</li>
																
															</ul>
													</div>
													<div class="tab-form-right user-form-rt">
														<h5>CVV NUMBER</h5>													
														<input type="text" value="xxxx" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'xxxx';}" required="">
													</div>
													<div class="clear"></div>
												</div>
												<input type="submit" value="SUBMIT">
											</form>
											<div class="single-bottom">
													<ul>
														<li>
															<input type="checkbox"  id="brand" value="">
															<label for="brand"><span></span>By checking this box, I agree to the Terms & Conditions & Privacy Policy.</label>
														</li>
													</ul>
											</div>
										</div>
									
	</div>

</div>

</div>

<div class="tab-pane" id="Dedit">
<br>
<div class="row">
	<div class="col-md-12">
    <div class="payment-info">
											
											<h3 class="pay-title">Dedit Card Info</h3>
											<form>
												<div class="tab-for">				
													<h5>NAME ON CARD</h5>
														<input type="text" value="">
													<h5>CARD NUMBER</h5>													
														<input class="pay-logo" type="text" value="0000-0000-0000-0000" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '0000-0000-0000-0000';}" required="">
												</div>	
												<div class="transaction">
													<div class="tab-form-left user-form">
														<h5>EXPIRATION</h5>
															<ul>
																<li>
																	<input type="number" class="text_box" type="text" value="6" min="1" />	
																</li>
																<li>
																	<input type="number" class="text_box" type="text" value="1988" min="1" />	
																</li>
																
															</ul>
													</div>
													<div class="tab-form-right user-form-rt">
														<h5>CVV NUMBER</h5>													
														<input type="text" value="xxxx" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'xxxx';}" required="">
													</div>
													<div class="clear"></div>
												</div>
												<input type="submit" value="SUBMIT">
											</form>
											<div class="single-bottom">
													<ul>
														<li>
															<input type="checkbox"  id="brand" value="">
															<label for="brand"><span></span>By checking this box, I agree to the Terms & Conditions & Privacy Policy.</label>
														</li>
													</ul>
											</div>
										</div>	
									
	</div>
</div>


</div>


</div>



										</div>
									
									</div>
								</div>	
							</div>
						</div>	

		</div>
		</div>


</body>
</html>