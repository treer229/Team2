<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/weather-icons.min.css">
<style>
          .box {
            display: flex;
            justify-content: center;
          }
          
          .weather{
            font-size: 17px;
          }
		.kr_temp{
			font-size: 26px;
		
		}
		 
</style>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {

     jQuery.ajax({

           type:"GET",

           url:"http://api.openweathermap.org/data/2.5/find?q=seoul&units=metric&appid=1b7326309c45c2d82c54c41cba400a8c",

           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨

           success : function(data) {		

				var temp =data.list[0].main.temp;
				console.log(Math.floor(temp));
				$('#kr_name').append(data.list[0].name);
				$('#kr_temp').prepend(temp.toFixed(1));
				$('#kr_humidity').append(data.list[0].main.humidity+"%");
				$('#kr_description').append(data.list[0].weather[0].description);
				$('#kr_speed').append(data.list[0].wind.speed+"m/s");
				
				
				
           },
           error : function(xhr, status, error) {

                 alert("에러발생");

           }

     });
     
     jQuery.ajax({

         type:"GET",

         url:"http://api.openweathermap.org/data/2.5/find?q=Paris&units=metric&appid=1b7326309c45c2d82c54c41cba400a8c",

         dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨

         success : function(data) {

			var temp =data.list[0].main.temp;
			$('#pr_name').append(data.list[0].name);
			$('#pr_temp').prepend(temp.toFixed(1));
			$('#pr_humidity').append(data.list[0].main.humidity+"%");
			$('#pr_description').append(data.list[0].weather[0].description);
			$('#pr_speed').append(data.list[0].wind.speed+"m/s");
			
         },

         error : function(xhr, status, error) {

               alert("la");

         }

   });
	
     jQuery.ajax({

         type:"GET",

         url:"http://api.openweathermap.org/data/2.5/find?q=London&units=metric&appid=1b7326309c45c2d82c54c41cba400a8c",

         dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨

         success : function(data) {

			var temp =data.list[0].main.temp;
			$('#ld_name').append(data.list[0].name);
			$('#ld_temp').prepend(temp.toFixed(1));
			$('#ld_humidity').append(data.list[0].main.humidity+"%");
			$('#ld_description').append(data.list[0].weather[0].description);
			$('#ld_speed').append(data.list[0].wind.speed+"m/s");
         },

         error : function(xhr, status, error) {

               alert("에러발생");

         }

   });
     
     jQuery.ajax({

         type:"GET",

         url:"http://api.openweathermap.org/data/2.5/find?q=Tokyo&units=metric&appid=1b7326309c45c2d82c54c41cba400a8c",

         dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨

         success : function(data) {

			var temp = data.list[0].main.temp;
			console.log(temp);
			$('#tk_name').append(data.list[0].name);
			$('#tk_temp').prepend(temp.toFixed(1));
			$('#tk_humidity').append(data.list[0].main.humidity+"%");
			$('#tk_description').append(data.list[0].weather[0].description);
			$('#tk_speed').append(data.list[0].wind.speed+"m/s");
         },

         error : function(xhr, status, error) {

               alert("에러발생");

         } 

   });
});

</script>
</head>

<body>
			<div class="col-xl-3 col-md-6 mb-4">
	           <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" id="kr_name"></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800" id="kr_temp">&#8451;</div>
                      <div id="kr_description" class=weather ></div>
                    </div>
                  </div>
                </div>
         			 <div class=box>
                       	<i id="kr_humidity"><i class="wi wi-humidity" style="size=40px"></i></i>&nbsp;&nbsp;&nbsp;<i id="kr_speed"><i class="wi wi-strong-wind"></i></i>  	
                     </div>
              </div>
			</div>
			
			
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1" id="pr_name"></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800" id="pr_temp">&#8451;</div>
                   	   <div id="pr_description" class="weather"></div>
                    </div>
                  </div>
                </div>
    				 <div class=box>
                       	<i id="pr_humidity"><i class="wi wi-humidity"></i></i>&nbsp;&nbsp;&nbsp;<i id="pr_speed"><i class="wi wi-strong-wind"></i></i>
                     </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1" id="tk_name"></div>
                      <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="tk_temp">&#8451;</div>
                      <div id="tk_description" class="weather"></div>
					</div>
                  </div>
                </div>
                         <div class=box>
                        	<i id="tk_humidity"><i class="wi wi-humidity"></i></i>&nbsp;&nbsp;&nbsp;<i id="tk_speed"><i class="wi wi-strong-wind"></i></i>
                        </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1" id="ld_name"></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800" id="ld_temp">&#8451;</div>
                      <div id="ld_description" class="weather"></div>
                    </div>
                  </div>
                </div>
              	     <div class=box>
                       	<i id="ld_humidity"><i class="wi wi-humidity"></i></i>&nbsp;&nbsp;&nbsp;<i id="ld_speed"><i class="wi wi-strong-wind"></i></i>
                     </div>
              </div>
            </div>
          </div>
	
</body>

</html>