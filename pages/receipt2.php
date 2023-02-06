<?php session_start();
if(empty($_SESSION['id'])):
header('Location:../index.php');
endif;
if(empty($_SESSION['branch'])):
header('Location:../index.php');
endif;
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	 <link rel="icon" type="image/png" sizes="16x16" href="images/head.png">
    <title>Cash Receipt | <?php include('../dist/includes/title.php');?></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../plugins/select2/select2.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
    <script language="JavaScript"><!--
javascript:window.history.forward(1);
//--></script>
    <style type="text/css">
           @media print {
          .btn-print {
            display:none !important;
          }
      }
    </style>
    
 </head>
  <!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
  <body class="hold-transition skin-blue layout-top-nav">
    <div class="wrapper">
      
      <!-- Full Width Column -->
      <div class="content-wrapper">
        <div class="container">

          <section class="content">
            <div class="row">
	      <div class="col-md-12">
              <div class="">
                
                <div class="box-body">
                  <!-- Date range -->
                  <form method="post" action="">
<?php
include('../dist/includes/dbcon.php');

$user_id =$_SESSION['id'];
$branch=$_SESSION['branch'];
$temrs =["Goods once sold Not returned","Net 15 -Payment due in 15 days from Invoice Date","Prices are valid for 30 days ,Unless other terms Prices are Exculusive of taxes","Goods once sold Not returned"];     

    $query=mysqli_query($con,"select * from branch where branch_id='$branch'")or die(mysqli_error());
	$rowb=mysqli_fetch_array($query);
	

        
?>      
    

<?php

    $sid=$_GET['sid'];
    $query=mysqli_query($con,"select * from sales   where sales.sales_id='$sid'")or die(mysqli_error($con));
      
        $row=mysqli_fetch_array($query);
		
		$ids=$row['cust_id'];
		$queryc=mysqli_query($con,"SELECT * FROM `customer` where cust_id='$ids'")or die(mysqli_error());  
		$rowc=mysqli_fetch_array($queryc);
		
        $last=$rowc['cust_last'];
        $first=$rowc['cust_first'];
        $address=$rowc['cust_address'];
        $contact=$rowc['cust_contact'];
		
		
		$due=$row['amount_due'];
		$discount=$row['discount'];
        $grandtotal=$due-$discount;
        $tendered=$row['cash_tendered'];
        

         $query1=mysqli_query($con,"select * from payment where sales_id='$sid' order by payment_id desc")or die(mysqli_error($con));
      
        $row1=mysqli_fetch_array($query1);
      
?>          
           <table class="table">
                     <thead>
                      <tr>
                        <th colspan="3"><h5><b><?php echo $rowb['branch_name'];?></b></h5></th>
                        <th><b><u><?php echo strtoupper($row['saletype']);?></u></b></th>
                      </tr>
                      <tr>
					 
                        <th colspan="3"><h6><?php echo $rowb['branch_address'];?></h6></th>
                        <th><span style="font-size: 16px;color: red">No. <?php echo sprintf("%03d",$row1['or_no']);?></span></th>
                      </tr>
					  <tr>
                        <th colspan="3"><h6>Email: <?php echo $rowb['email'];?></h6></th>
                        <th></th>
                      </tr>
                      <tr>
                        <th colspan="3"><h6>Contact #: <?php echo $rowb['branch_contact'];?></h6></th>
                        <th></th>
                      </tr>
                      
                    </thead>
                     <thead>

                      <tr>
                        <th>TO:</th>
                        <th><u><?php echo $last.", ".$first;?></u></th>
                        <th>Date</th>
                        <th><u><?php echo  date("M d, Y",strtotime($row['date_added']))?> Time <?php echo date("h:i A",strtotime($row['date_added']));	;?></u></th>
                      
						</tr>
                      <tr>
                        <th>Address</th>
                        <th><u><?php echo $address;?></u></th>
                          <th>Terms</th>
                        <th>
						<u>
						<?php 
						if($row['saletype']=='Receipt')echo $temrs[0];
						if($row['saletype']=='Invoice')echo $temrs[1];
						if($row['saletype']=='Quatation')echo $temrs[2];
						if($row['saletype']=='Credit')echo $temrs[3];
						
						?></u></th>
                      </tr>
                      <!--tr>
                        <th>Business Style</th>
                        <th>________________________</th>
                        <th>Terms</th>
                        <th><u><?php echo $rowb['terms'];?></u></th>
                      </tr-->
                    </thead>
				  </table>
                  <table class="table">
                    <thead>

                      <tr>
					    <th>S.No</th>
						<th>DESCRIPTION</th>
                        <th>QTY</th>
                        
                       
            						<th>Unit Price  (USD)</th>
            						<th class="text-right">AMOUNT</th>
                      </tr>
                    </thead>
                    <tbody>
<?php
		$query1=mysqli_query($con,"select * from sales natural join sales_details natural join product where sales_id='$sid'")or die(mysqli_error());
			$grand=0;$counter=1;
		while($row2=mysqli_fetch_array($query1)){
				$code=$row2['serial'];
				$total= $row2['qty']*$row2['price'];
				$grand=$grand+$total;
				$due=$row2['amount_due'];
        
		   
?>
                      <tr>
					   <td><?php echo $counter++;?></td>
					    <td class="record"><?php echo $row2['prod_name'];?></td>
            		<td><?php echo $row2['qty'];?></td>
                       
                       
            						<td><?php echo number_format($row2['price'],2);?></td>
            						<td style="text-align:right"><?php echo number_format($total,2);?></td>
                                    
                      </tr>
					  

<?php }?>					
                      <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <th class="text-right"><?php echo $stats=($row['saletype']=='Quatation')?"TOTAL AMOUNT":"TOTAL AMOUNT DUE"; ?></th>
                        <th style="text-align:right"><?php echo number_format($grand,2);?></th>
                      </tr>
					  
					  <?php if (($row['saletype']!='Invoice')&&($row['saletype']!='Quatation')){ ?>
					  
                      <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="text-right">Interest</td>
                        <td style="text-align:right"><?php echo number_format($discount,2);?></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="text-right">Downpayment</td>
                        <td style="text-align:right"><?php echo number_format($tendered,2);?></td>
                      </tr>
                     
                      <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="text-right"><b>Remaining Balance</b></td>
                        <td style="text-align:right"><b><?php echo number_format($grand-$discount,2);?></b></td>            
                          
                      </tr>
					  
					  <?php } ?>

                      <tr>
                        <th>Prepared by: </th>
                        <td></td>
                        <td></td>
                        <th>_________________________</th>
                      </tr>
<?php
$query2=mysqli_query($con,"select * from user where user_id='$user_id'")or die(mysqli_error($con));  
    $row2=mysqli_fetch_array($query2);

?>                    
                      <tr>
                        <th><?php echo $row2['name'];?> </th>
                        <td></td>
                        <td></td>
                        <th>Customer's Signature</th>
                      </tr>
                     
                    </tbody>
                    
                  </table>
                </div><!-- /.box-body -->

				</div>	
            <a class = "btn btn-success btn-print" href = "" onclick = "window.print()"><i class ="glyphicon glyphicon-print"></i> Print</a>
                <a class = "btn btn-primary btn-print" href = "home.php"><i class ="glyphicon glyphicon-arrow-left"></i> Back to Homepage</a>   
                  
                  
				</form>	
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col (right) -->
           
          </div><!-- /.row -->
	  
            
          </section><!-- /.content -->
        </div><!-- /.container -->
      </div><!-- /.content-wrapper -->
     
    </div><!-- ./wrapper -->
	
	
	<script type="text/javascript" src="autosum.js"></script>
    <!-- jQuery 2.1.4 -->
    <script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<script src="../dist/js/jquery.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script src="../plugins/select2/select2.full.min.js"></script>
    <!-- SlimScroll -->
    <script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="../plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../dist/js/demo.js"></script>
    <script src="../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
   
  </body>
</html>
