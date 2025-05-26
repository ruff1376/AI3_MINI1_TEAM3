<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/layout/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>매출 조회</title>
	<jsp:include page="/WEB-INF/views/layout/link.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	
	<style>
		.btn-trainer:not(:checked) {
			background-color: transparent;
		}
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<%-- [Contents] ######################################################### --%>
<div class="container my-5">
	<h2 class="text-center mb-5">트레이너별 매출 차트</h2>
	<div class="row justify-content-between p-3 mb-3">
		<div id="sidebar" class="card p-4 col-md-3">
			<h5>기간</h5>
			<select id="period" class="form-select mb-3">
				<option value="7">1주일</option>
				<option value="30" selected>1개월</option>
			</select>
			<hr>
			<h5>트레이너</h5>
			<div id="trainer-list">
			</div>
		</div>
	
		<div id="chart-container" class="col-md-9">
			<canvas id="salesChart"></canvas>
		</div>
		
	</div>
</div>
		

<%-- [Contents] ######################################################### --%>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
<jsp:include page="/WEB-INF/views/layout/script.jsp" />


<script>
  // 서버에서 가져온 JSON 데이터를 바탕으로 trainerList와 salesData를 동적으로 생성
  fetch('/Mini1/admin/sales/list.json')
    .then(response => response.json())
    .then(data => {
      const trainerList = data.map(t => ({ id: t.trainerId, name: t.name }));
      let salesData = {};

      data.forEach(trainer => {
        const trainerId = trainer.trainerId;
        const saleList = trainer.salesList || [];
        
        salesData[trainerId] = trainer.salesList.map(sale => {
        	  const formattedDate = new Date(sale.date).toLocaleDateString('ko-KR', {
        	    year: 'numeric',
        	    month: '2-digit',
        	    day: '2-digit'
        	  }).replace(/\. /g, '-').replace('.', '');

        	  return {
        	    date: formattedDate,
        	    amount: sale.amount
        	  };
        	});

        
      });


  // 샘플 데이터 (트레이너 ID별 날짜별 매출)
//   let salesData2 = {
//     1: [ { date: "2025-05-01", amount: 300 }, { date: "2025-05-10", amount: 500 } ],
//     2: [ { date: "2025-05-03", amount: 700 }, { date: "2025-05-11", amount: 200 } ],
//   };
      
      console.log('Trainer List:', trainerList);
      console.log('Sales Data:', salesData);
//       console.log('Sales Data2:', salesData2);

	let trainerColors = {
       		  1: '#FF6384',  // 빨간색 계열
       		  2: '#36A2EB',  // 파란색 계열
       		  3: '#FFCE56',  // 노란색 계열
       		  4: '#4BC0C0',  // 민트색
       		  5: '#9966FF',  // 보라색
       		  6: '#FF9F40',  // 주황색
       		  // 추가 트레이너에 따라 더 확장 가능
       		};
      

      // 좌측 패널 트레이너	리스트
      const trainerListEl = document.getElementById('trainer-list');
      trainerList.forEach(t => {
    	console.log('Trainer:', t);
        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.id = 'trainer-' + t.id;
        checkbox.value = t.id;
        // class: 'form-check-input';
        checkbox.className = 'btn-check btn-trainer-check';
        checkbox.checked = true;
        checkbox.addEventListener('change', renderChart);

        const label = document.createElement('label');
        label.htmlFor = 'trainer-' + t.id;
        label.innerText = t.name;
        // class: 'form-check-label';
        label.className = 'btn btn-outline-light btn-trainer w-100 mb-2';
        label.style.backgroundColor = trainerColors[t.id] || getRandomColor();

        trainerListEl.appendChild(checkbox);
        trainerListEl.appendChild(label);
        trainerListEl.appendChild(document.createElement('br'));
        
        
        
      });

      // 차트
      const ctx = document.getElementById('salesChart').getContext('2d');
      let chart;

      trainerColors = {
       		  1: '#FF6384',  // 빨간색 계열
       		  2: '#36A2EB',  // 파란색 계열
       		  3: '#FFCE56',  // 노란색 계열
       		  4: '#4BC0C0',  // 민트색
       		  5: '#9966FF',  // 보라색
       		  6: '#FF9F40',  // 주황색
       		  // 추가 트레이너에 따라 더 확장 가능
       		};

      

      function renderChart() {
        const selectedTrainers = Array.from(document.querySelectorAll('#trainer-list input:checked')).map(cb => parseInt(cb.value));
        const periodDays = parseInt(document.getElementById('period').value);
        const today = new Date();
        const startDate = new Date(today);
        startDate.setDate(today.getDate() - periodDays);

        const labels = [...new Set([].concat(...selectedTrainers.map(id =>
          salesData[id]?.map(s => s.date) || []
        )))].sort();
        
        


        const datasets = selectedTrainers.map(id => {
          const trainer = trainerList.find(t => t.id === id);
          const trainerSales = {};
          (salesData[id] || []).forEach(s => {
//             if (new Date(s.date) >= startDate) {
              trainerSales[s.date] = (trainerSales[s.date] || 0) + s.amount;
//             }
          });

          if (!trainerColors[id]) trainerColors[id] = getRandomColor();

          return {
            label: trainer.name,
            data: labels.map(date => trainerSales[date] || 0),
            borderColor: trainerColors[id],
            backgroundColor: 'transparent',
            fill: false,
            tension: 0.3
          };
        });

        if (chart) chart.destroy();
        chart = new Chart(ctx, {
          type: 'line',
          data: { labels, datasets },
          options: {
            responsive: true,
            plugins: {
              title: { display: true, text: '트레이너별 매출 추이 (꺾은선 그래프)' }
            },
            scales: {
              x: { title: { display: true, text: '날짜' } },
              y: { beginAtZero: true, title: { display: true, text: '매출액(원)' } }
            }
          }
        });
      }

      document.getElementById('period').addEventListener('change', renderChart);

      renderChart();
      
      
      function getRandomColor() {
     	    const letters = '0123456789ABCDEF';
     	    let color = '#';
     	    for (let i = 0; i < 6; i++) {
     	      color += letters[Math.floor(Math.random() * 16)];
     	    }
     	    return color;
     	  }
      
    });
</script>

</body>
</html>