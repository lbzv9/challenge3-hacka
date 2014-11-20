<!DOCTYPE html>
<html>
<head>
	<title> Flight Status</title>
	<meta charset="utf8">  
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
   <link href="/static/bootstrap.min.css" rel="stylesheet" media="screen">
   <link href="/static/bootstrap-responsive.css" rel="stylesheet">
   <link href="/static/bootstrap.css" rel="stylesheet">

  <style type="text/css">
	body {
		 background-image: url("http://aeroscience.com.au/wp-content/uploads/2012/09/cloud-airplane.jpg");
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
	
      }
	
	/* Custom container */
      .container-narrow {
        margin: 0 auto;
        max-width: 900px;
	border-style: solid;
	border-color: transparent;
	background-color: #D8D8D8	;
	z-index: 9;
	height : 100%;
	-moz-border-radius: 15px;
	border-radius: 15px;
	
      }
      .container-narrow > hr {
        margin: 30px 0;
      }

	.sidebar-nav {
        padding: 20px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
	
  </style>

</head>
<body>

  <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          
          <a class="brand pull-left" href="/"><em>Flight Status Information</em></a>
	  
          <div class="nav-collapse collapse">
           
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>  <!-- end of div for nav bar-->
  
  <div class="container">
  <!-- <table class="table table-hover">
  <tr> -->
  <div class="hero-unit">
  <div>
  <h2 class="text-center"><em>Flight Status</em><h2> </div>
  <br/>
  
  <form action="/recordItemInfo" method="post" class="form-search" name="itemInfo" id="itemInfo">
  <p style="text-align: center"> 
  Provide flight details to track the status
	  <table style="margin: 0px auto;">
	  	<tr>
	  		<td>
	  	  		<label for="name" title="Your choice! Whatever you'd like to name your item.">Airlines Name: </label>
	  	  	</td>
	  	  	<td>
	  	  		<input type="text" id="name" name="name" value="" class="input-large"/>
	  	  	</td>
	  	</tr>
	  	<tr>
	  		<td>
	  			<label for="url" title="The url that points directly to your item.">Flight No: </label>
	  		</td>
	  		<td>
	  			<input type="text" id="url" name="url" value="" class="input-large"/>
	  		</td>
	  	</tr>
		<tr>
			<td>
				<label type="hidden" for="idToCheck" title="The id of the field that holds your item's price. Typically this will be 'price.' You can use a tool like Firebug to find the id of the field."" style="visibility:hidden">Price field id: </label>
			</td>
			<td>
				<input type="hidden" id="idToCheck" name="idToCheck" value="Time" class="input-large"/><br>
			</td>
		</tr>
	
		<tr>
			<td>
			</td>
			<td>
			</td>
			<td>
				<input type="submit" value="Publish" class="btn btn-info">
			</td>
		</tr>
	</table>
  </p>
  </form>

  
  <p style="text-align: center">
  <a href="/displayall" value="View Database"><button>View all Flights</button></a> | 
  <a href="/getCurrentPrices" value="Check Current Prices"><button>Get schedule</button></a>
  <a href="/report" value="Check Current Prices"><button>Analysis Report</button></a>
  </p>
 
  </div> <!-- end of the hero-unit-->
  </div> <!-- end of the container-->
  
</body>
</html>