// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
//Quản lý khách hàng
var month1 = parseInt(document.getElementById("month1").innerHTML);
var month2 = parseInt(document.getElementById("month2").innerHTML);
var month3 = parseInt(document.getElementById("month3").innerHTML);
var month4 = parseInt(document.getElementById("month4").innerHTML);
var month5 = parseInt(document.getElementById("month5").innerHTML);
var month6 = parseInt(document.getElementById("month6").innerHTML);
var month7 = parseInt(document.getElementById("month7").innerHTML);
var month8 = parseInt(document.getElementById("month8").innerHTML);
var month9 = parseInt(document.getElementById("month9").innerHTML);
var month10 = parseInt(document.getElementById("month10").innerHTML);
var month11 = parseInt(document.getElementById("month11").innerHTML);
var month12 = parseInt(document.getElementById("month12").innerHTML);

//Quản lý khách hàng
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {  
  type: 'line',
  data: {
    labels: ["Month 1", "Month 2", "Month 3", "Month 4", "Month 5", "Month 6", "Month 7", "Month 8", "Month 9", "Month 10", "Month 11", "Month 12"],
    datasets: [{
      label: "Subs",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
       pointBackgroundColor: "green" ,//"rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "red",//"rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [month1,month2,month3,month4, month5, month6, month7, month8, month9, month10, month11, month12],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'month'
        },
        gridLines: {
          display: true
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 20,
          maxTicksLimit: 5
        },
        gridLines: {
          color: "brown",//"rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});


// //Trang quản lý doanh thu
// var remonth1 = parseInt(document.getElementById("remonth1").innerHTML);
// var remonth2 = parseInt(document.getElementById("remonth2").innerHTML);
// var remonth3 = parseInt(document.getElementById("remonth3").innerHTML);
// var remonth4 = parseInt(document.getElementById("remonth4").innerHTML);
// var remonth5 = parseInt(document.getElementById("remonth5").innerHTML);
// var remonth6 = parseInt(document.getElementById("remonth6").innerHTML);
// var remonth7 = parseInt(document.getElementById("remonth7").innerHTML);
// var remonth8 = parseInt(document.getElementById("remonth8").innerHTML);
// var remonth9 = parseInt(document.getElementById("remonth9").innerHTML);
// var remonth10 = parseInt(document.getElementById("remonth10").innerHTML);
// var remonth11 = parseInt(document.getElementById("remonth11").innerHTML);
// var remonth12 = parseInt(document.getElementById("remonth12").innerHTML);
// var ctx01 = document.getElementById("myAreaChart01");
// var myLineChart01 = new Chart(ctx01, {
//   type: 'line',
//   data: {
//     labels: ["Month 1", "Month 2", "Month 3", "Month 4", "Month 5", "Month 6", "Month 7", "Month 8", "Month 9", "Month 10", "Month 11", "Month 12"],
//     datasets: [{
//       label: "Total",
//       lineTension: 0.3,
//       backgroundColor: "rgba(2,117,216,0.2)",
//       borderColor: "rgba(2,117,216,1)",
//       pointRadius: 5,
//        pointBackgroundColor: "green" ,//"rgba(2,117,216,1)",
//       pointBorderColor: "rgba(255,255,255,0.8)",
//       pointHoverRadius: 5,
//       pointHoverBackgroundColor: "red",//"rgba(2,117,216,1)",
//       pointHitRadius: 50,
//       pointBorderWidth: 2,
//       data: [remonth1,remonth2,remonth3,remonth4, remonth5, remonth6, remonth7, remonth8, remonth9, remonth10, remonth11, remonth12],
//     }],
//   },
//   options: {
//     scales: {
//       xAxes: [{
//         time: {
//           unit: 'date'
//         },
//         gridLines: {
//           display: true
//         },
//         ticks: {
//           maxTicksLimit: 7
//         }
//       }],
//       yAxes: [{
//         ticks: {
//           min: 0,
//           max: 20,
//           maxTicksLimit: 5
//         },
//         gridLines: {
//           color: "brown",//"rgba(0, 0, 0, .125)",
//         }
//       }],
//     },
//     legend: {
//       display: false
//     }
//   }
// });
