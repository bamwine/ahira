<?php 
error_reporting(0);
	echo "Oaksoft POS";
?>

<?php 

	   function ajax_is_validkey()
    {
       
        $key                  = $_POST["key"];
		$sys_cod              = $_POST["sys_cod"];
		
		$code = h_encrypt_decrypt($key,'decrypt');
		$expire = substr($code,14);		
		$sys_cod_chk =substr($code,0,13);
	 if ($sys_cod==$sys_cod_chk) 
        {
			$time = strtotime('-1 days');
			$today = date("Y-m-d H:i:s", $time);			
			
			$query2=mysqli_query($con,"UPDATE valid SET tkl ='$key',startd ='$today',enda ='$expire' WHERE systemco = '$sys_cod';")or die(mysqli_error($con));
		
		header('Location:index.php');
		}
	
	else{header('Location:key.php');}
	
	

    }


function check_lice()
    {	
	include('dbcon.php');
	 $date_now = date("Y-m-d");
		$query1=mysqli_query($con,"SELECT * FROM valid")or die(mysqli_error($con));
        while($row1=mysqli_fetch_array($query1)){
		$tkl = $row1['tkl'];}
		$code = h_encrypt_decrypt($tkl,'decrypt');		
		$expire = substr($code,14);
		
		$query2=mysqli_query($con,"SELECT * FROM valid")or die(mysqli_error($con));
        while($row2=mysqli_fetch_array($query2)){
		$tkl = $row1['tkl'];
		
		           
		if ($date_now>= $expire) {
        return 1;
    }else if ($date_now < $row2['startd']){
       return 1;
    }
			 
		}
			
 
	
      return 0;
    }
	
	
		function h_encrypt_decrypt($string,$action)
	{

	    $output = $string;

	    $encrypt_method = "AES-256-CBC";
	    //pls set your unique hashing key
	    $secret_key = 'bams';
	    $secret_iv = 'sheebly';

	    // hash
	    $key = hash('sha256', $secret_key);

	    // iv - encrypt method AES-256-CBC expects 16 bytes - else you will get a warning
	    $iv = substr(hash('sha256', $secret_iv), 0, 16);


	    if( $action == 'decrypt' )
	    {
	    	//decrypt the given text/string/number
	        $output = openssl_decrypt(base64_decode($string), $encrypt_method, $key, 0, $iv);
	    }
	    else
	    {
	    	//do the encyption given text/string/number
	        $output = openssl_encrypt($string, $encrypt_method, $key, 0, $iv);
	        $output = base64_encode($output);  	
	    }

    	return $output;
	}
	
	
	?>