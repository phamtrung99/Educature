// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example
var co11 = document.getElementById("topcourse1").innerHTML;
var co1 = co11.substring(0,co11.search(" "));
var co22 = document.getElementById("topcourse2").innerHTML;
var co2 = co22.substring(0,co11.search(" "));
var co33 = document.getElementById("topcourse3").innerHTML;
var co3 = co33.substring(0,co11.search(" "));
var co44 = document.getElementById("topcourse4").innerHTML;
var co4 = co44.substring(0,co11.search(" "));
var co55 = document.getElementById("topcourse5").innerHTML;
var co5 = co55.substring(0,co11.search(" "));
var co66 = document.getElementById("topcourse6").innerHTML;
var co6 = co66.substring(0,co11.search(" "));

var rate1 = document.getElementById("AveRate1").innerHTML;
var rate2 = document.getElementById("AveRate2").innerHTML;
var rate3 = document.getElementById("AveRate3").innerHTML;
var rate4 = document.getElementById("AveRate4").innerHTML;
var rate5 = document.getElementById("AveRate5").innerHTML;
var rate6 = document.getElementById("AveRate6").innerHTML;


var ctx = document.getElementById("myBarChart");
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: [co1, co2, co3, co4, co5, co6],
    datasets: [{
      label: "STAR",
      backgroundColor: "YellowGreen",//"rgba(2,117,216,1)",
      borderColor:"rgba(2,117,216,1)",
      data: [rate1, rate2, rate3, rate4, rate5, rate6],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'day'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 6
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 5,
          maxTicksLimit: 5
        },
        gridLines: {
          display: true
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
