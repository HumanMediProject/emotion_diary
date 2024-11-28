<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Chart.js Example</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
  <canvas id="myChart" width="400" height="200"></canvas>
  <!-- 
  <div>
    <button id="randomize">Randomize</button>
    <button id="addDataset">Add Dataset</button>
    <button id="addData">Add Data</button>
    <button id="removeDataset">Remove Dataset</button>
    <button id="removeData">Remove Data</button>
  </div>
	 -->
  <script>
  
  const Utils = {
		  months: function({count}) {
		    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
		    return months.slice(0, count);
		  },
		  numbers: function({count, min, max}) {
		    const result = [];
		    for (let i = 0; i < count; i++) {
		      result.push(Math.floor(Math.random() * (max - min + 1)) + min);
		    }
		    return result;
		  },
		  rand: function(min, max) {
		    return Math.floor(Math.random() * (max - min + 1)) + min;
		  },
		  CHART_COLORS: {
		    red: 'rgb(255, 99, 132)',
		    blue: 'rgb(54, 162, 235)',
		    green: 'rgb(75, 192, 192)',
		    yellow: 'rgb(255, 159, 64)',
		    orange: 'rgb(255, 99, 132)',
		  },
		  namedColor: function(index) {
		    const colors = ['red', 'blue', 'green', 'yellow', 'orange'];
		    return this.CHART_COLORS[colors[index % colors.length]];
		  },
		  transparentize: function(color, opacity) {
		    const rgba = color.match(/^rgb\((\d+), (\d+), (\d+)\)$/);
		    return `rgba(${rgba[1]}, ${rgba[2]}, ${rgba[3]}, ${opacity})`;
		  }
		};
  
  
  
  
  
  
  
  
  const DATA_COUNT = 7;
  const NUMBER_CFG = {count: DATA_COUNT, min: -100, max: 100};
  
  
  const ctx = document.getElementById('myChart').getContext('2d');
  const labels = Utils.months({count: 7});
  let datasets = [
      {
          label: 'Dataset 1',
          data: Utils.numbers(NUMBER_CFG),
          borderColor: Utils.CHART_COLORS.red,
          backgroundColor: Utils.transparentize(Utils.CHART_COLORS.red, 0.5),
        },
        {
          label: 'Dataset 2',
          data: Utils.numbers(NUMBER_CFG),
          borderColor: Utils.CHART_COLORS.blue,
          backgroundColor: Utils.transparentize(Utils.CHART_COLORS.blue, 0.5),
        }
      ];
  const data = {
    labels: labels,
    datasets: datasets 
  };
  const config = {
		  type: 'line',
		  data: data,
		  options: {
		    responsive: true,
		    plugins: {
		      legend: {
		        position: 'top',
		      },
		      title: {
		        display: true,
		        text: 'Chart.js Line Chart'
		      }
		    }
		  },
		};
  

  const myChart = new Chart(ctx, config);
  
  const actions = [
      {
        name: 'Randomize',
        handler(chart) {
          chart.data.datasets.forEach(dataset => {
            dataset.data = Utils.numbers({count: chart.data.labels.length, min: -100, max: 100});
          });
          chart.update();
        }
      },
      {
        name: 'Add Dataset',
        handler(chart) {
          const data = chart.data;
          const dsColor = Utils.namedColor(chart.data.datasets.length);
          const newDataset = {
            label: 'Dataset ' + (data.datasets.length + 1),
            backgroundColor: Utils.transparentize(dsColor, 0.5),
            borderColor: dsColor,
            data: Utils.numbers({count: data.labels.length, min: -100, max: 100}),
          };
          chart.data.datasets.push(newDataset);
          chart.update();
        }
      },
      {
        name: 'Add Data',
        handler(chart) {
          const data = chart.data;
          if (data.datasets.length > 0) {
            data.labels = Utils.months({count: data.labels.length + 1});

            for (let index = 0; index < data.datasets.length; ++index) {
              data.datasets[index].data.push(Utils.rand(-100, 100));
            }

            chart.update();
          }
        }
      },
      {
        name: 'Remove Dataset',
        handler(chart) {
          chart.data.datasets.pop();
          chart.update();
        }
      },
      {
        name: 'Remove Data',
        handler(chart) {
        	console.log(chart.data);
          chart.data.labels.splice(-1, 1); // remove the label first

          chart.data.datasets.forEach(dataset => {
            dataset.data.pop();
          });

          chart.update();
        }
      }
    ];
  
  // 버튼 이벤트 처리
  document.getElementById('randomize').addEventListener('click', () => actions[0].handler(myChart));
  document.getElementById('addDataset').addEventListener('click', () => actions[1].handler(myChart));
  document.getElementById('addData').addEventListener('click', () => actions[2].handler(myChart));
  document.getElementById('removeDataset').addEventListener('click', () => actions[3].handler(myChart));
  document.getElementById('removeData').addEventListener('click', () => actions[4].handler(myChart));

</script>
</body>
</html>
