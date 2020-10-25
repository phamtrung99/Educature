// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example
// //Trang quản lý doanh thu
var remonth1 = parseInt(document.getElementById("remonth1").innerHTML);
var remonth2 = parseInt(document.getElementById("remonth2").innerHTML);
var remonth3 = parseInt(document.getElementById("remonth3").innerHTML);
var remonth4 = parseInt(document.getElementById("remonth4").innerHTML);
var remonth5 = parseInt(document.getElementById("remonth5").innerHTML);
var remonth6 = parseInt(document.getElementById("remonth6").innerHTML);
var remonth7 = parseInt(document.getElementById("remonth7").innerHTML);
var remonth8 = parseInt(document.getElementById("remonth8").innerHTML);
var remonth9 = parseInt(document.getElementById("remonth9").innerHTML);
var remonth10 = parseInt(document.getElementById("remonth10").innerHTML);
var remonth11 = parseInt(document.getElementById("remonth11").innerHTML);
var remonth12 = parseInt(document.getElementById("remonth12").innerHTML);
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ["Month 1", "Month 2", "Month 3", "Month 4", "Month 5", "Month 6", "Month 7", "Month 8", "Month 9", "Month 10", "Month 11", "Month 12"],
    datasets: [{
      data: [remonth1,remonth2,remonth3,remonth4, remonth5, remonth6, remonth7, remonth8, remonth9, remonth10, remonth11, remonth12],
      backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', '#e83e8c','#6f42c1','#6610f2','#fd7e14','#20c997','#17a2b8','#6c757d','#343a40'],
    }],
  },
});
