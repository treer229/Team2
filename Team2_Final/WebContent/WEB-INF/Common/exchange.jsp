<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title>환율조회</title>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta name="robots" content="noindex, nofollow">
  <meta name="googlebot" content="noindex, nofollow">
  <meta name="viewport" content="width=device-width, initial-scale=1">




  <style id="compiled-css" type="text/css">
  </style>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
var usd = 0;
var jpy = 0;
var eur = 0;
var cny = 0;
var gbp = 0;

$(document).ready(function() {

	jQuery.ajax({

        type:"GET",

        url:"https://earthquake.kr:23490/query/USDKRW,JPYKRW,EURKRW,CNYKRW,GBPKRW",

        dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨

        success : function(data) {
     	   console.log(data);
     	   console.log(data.USDKRW[0]);
     	   console.log(data.JPYKRW[0]);
     	   console.log(data.EURKRW[0]);
     	   console.log(data.CNYKRW[0]);
     	   console.log(data.GBPKRW[0]);
     	   
     	   usd = data.USDKRW[0];
     	   jpy = data.JPYKRW[0];
     	   eur = data.EURKRW[0];
     	   cny = data.CNYKRW[0];
     	   gbp = data.GBPKRW[0];
     	   
     	  chart();
	
        },

        error : function(xhr, status, error) {

              alert("에러발생");

        }
});

     
     console.log("dasd" +usd);
     
     
     
  // Create the chart
  function chart() {
    Highcharts.chart('container', {
	 
	
    chart: {
        type: 'column'
    },
    title: {
        text: '실시간 환율 조회'
    },
    subtitle: {
        text: 'Team2'
    },
    xAxis: {
        type: 'category'
    },
    yAxis: {
        title: {
            text: '원(₩)'
        }

    },
    legend: {
        enabled: false
    },
    plotOptions: {
        series: {
            borderWidth: 0,
            dataLabels: {
                enabled: true,
                format: '{point.y:.1f}원'
            }
        }
    },

    tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}원</b><br/>'
    },
    series: [
        {
            name: "",
            colorByPoint: true,
            data: [
                {
                    name: "미국_1달러",
                    y: usd ,
                    drilldown: "#"

                },
                {
                    name: "일본_100엔",
                    y: jpy*100,
                    drilldown: "#"
                },
                {
                    name: "유로_1유로",
                    y: eur,
                    drilldown: "# Explorer"
                },
                {
                    name: "중국_1위안",
                    y: cny,
                    drilldown: "#"
                },
                {
                    name: "영국_1파운드",
                    y: gbp,
                    drilldown: "#"
                }
            ]
        }
    ]
    });
  }
});

</script>

</head>
<body>
            <div class="col-xl-10 col-lg-10">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->

                <!-- Card Body -->
                <div class="card-body">
					<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                </div>
              </div>
            </div>
          </div>
  <script>
    // tell the embed parent frame the height of the content
    if (window.parent && window.parent.parent){
      window.parent.parent.postMessage(["resultsFrame", {
        height: document.body.getBoundingClientRect().height,
        slug: ""
      }], "*")
    }

    // always overwrite window.name, in case users try to set it manually
    window.name = "result"
  </script>
</body>


</html>