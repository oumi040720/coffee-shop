<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Admin | Dashboard</title>
		
		<%@ include file="/WEB-INF/views/admin/common/css.jsp" %>
		
		<link href="<c:url value='/template/admin/libs/c3/c3.min.css' />" rel="stylesheet" type="text/css">
	</head>
	
	<body>
        <div id="wrapper">
        
        	<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
        
        	<%@ include file="/WEB-INF/views/admin/common/menu.jsp" %>
        
        	<div class="content-page">
        		<div class="container-fluid">
        			<div class="row">
        				<div class="col-12">
        					<div class="page-title-box">
        						<div class="page-title-right">
        							<ol class="breadcrumb m-0">
        								<li class="breadcrumb-item"><a href="javascript: void(0);">Uplon</a></li>
        								<li class="breadcrumb-item"><a href="javascript: void(0);">Pages</a></li>
        								<li class="breadcrumb-item active">Starter</li>
        							</ol>
        						</div>
        						<h4 class="page-title">Starter page</h4>
        					</div>
        				</div>
        			</div>
        			
        			<div class="row">
        				<div class="col-md-6 col-xl-3">
                            <div class="card-box tilebox-one">
                                <i class="icon-layers float-right m-0 h2 text-muted"></i>
                                <h6 class="text-muted text-uppercase mt-0">Số đơn hàng</h6>
                                <h3 class="my-3" data-plugin="counterup">${currentOrders}</h3>
                                <span class="badge badge-success mr-1"> ${grownRateOrder}% </span> 
                                <span class="text-muted">So với tháng trước</span>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3">
                            <div class="card-box tilebox-one">
                                <i class="icon-paypal float-right m-0 h2 text-muted"></i>
                                <h6 class="text-muted text-uppercase mt-0">Doanh số</h6>
                                <h3 class="my-3"><span data-plugin="counterup">${currentSales}</span> VNĐ</h3>
                                <span class="badge badge-danger mr-1"> ${grownRateSales}% </span> 
                                <span class="text-muted">So với tháng trước</span>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3">
                            <div class="card-box tilebox-one">
                                <i class="icon-chart float-right m-0 h2 text-muted"></i>
                                <h6 class="text-muted text-uppercase mt-0">Trung bình giá</h6>
                                <h3 class="my-3"><span data-plugin="counterup">${currentAveragePrice}</span> VNĐ</h3>
                                <span class="badge badge-pink mr-1"> ${grownRateAveragePrice}% </span>
                                <span class="text-muted">So với tháng trước</span>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3">
                            <div class="card-box tilebox-one">
                                <i class="icon-rocket float-right m-0 h2 text-muted"></i>
                                <h6 class="text-muted text-uppercase mt-0">Sản phẩm đã bán</h6>
                                <h3 class="my-3" data-plugin="counterup">${currentQuantity}</h3>
                                <span class="badge badge-warning mr-1"> ${grownRateQuantity}% </span> 
                                <span class="text-muted">So với tháng trước</span>
                            </div>
                        </div>
        			</div>
        			
        			<div class="row">
        				<div class="col-lg-4 col-xl-6">
        					<div class="card-box">
								<h4 class="header-title mb-3">Doanh số đạt được hàng năm</h4>
	                            <div id="salesEveryYear" class="morris-chart" style="height: 300px;"></div>
	        				</div>
        				</div>
        				<div class="col-lg-4 col-xl-6">
        					<div class="card-box">
								<h4 class="header-title mb-3">Số lượng sản phẩm đã bán hàng năm</h4>
	                            <div id="salesQuatnityEveryYear" class="morris-chart" style="height: 300px;"></div>
	        				</div>
        				</div>
        			</div>
        			
        			<div class="row">
        				<div class="col-lg-12 col-xl-12">
        					<div class="card-box">
								<h4 class="header-title mb-3">Doanh số và số lượng sản phẩm đã bán</h4>
								<div class="row">
									<div class="col-lg-6 col-xl-6"></div>
									<div class="col-lg-2 col-xl-2">
										<select id="month" class="form-control">
											<option value="1">Tháng 01</option>
											<option value="2">Tháng 02</option>
											<option value="3">Tháng 03</option>
											<option value="4">Tháng 04</option>
											<option value="5">Tháng 05</option>
											<option value="6">Tháng 06</option>
											<option value="7">Tháng 07</option>
											<option value="8">Tháng 08</option>
											<option value="9">Tháng 09</option>
											<option value="10">Tháng 10</option>
											<option value="11">Tháng 11</option>
											<option value="12">Tháng 12</option>
										</select>
									</div>
									<div class="col-lg-2 col-xl-2">
										<select id="year" class="form-control">
											<option value="2019">2019</option>
											<option value="2020">2020</option>
										</select>
									</div>
									<div class="col-lg-2 col-xl-2">
										<button id="viewStatistic" class="btn btn-primary">Xem</button>
									</div>
								</div>
								
								<br><br>
								
								<div class="row">
									<div class="col-lg-12 col-xl-12">
										<div class="p-3" dir="ltr">
			                            	<h4 class="header-title mb-3 d-flex justify-content-around" >
			                            		Doanh số và số lượng sản phẩm đã bán hàng tháng trong năm
			                            	</h4>
		                                    <div id="salesQuatnityEveryYearChartStacked"></div>
		                                </div>
									</div>
								</div>
                                
                                <br><br>
								
								<div class="row">
									<div class="col-lg-12 col-xl-12">
			                            <div class="p-3" dir="ltr">
			                            	<h4 class="header-title mb-3 d-flex justify-content-around">
			                            		Doanh số và số lượng sản phẩm đã bán hàng ngày của tháng trong năm
			                            	</h4>
		                                    <div id="salesEveryDayByYearAndMonth"></div>
		                                </div>
									</div>
								</div>
								
								<br><br>
								
								<div class="row">
									<div class="col-lg-6 col-xl-6">
			                            <div class="p-3" dir="ltr">
			                            	<h4 class="header-title mb-3 d-flex justify-content-around">
			                            		Tỉ lệ doanh số bán hàng mỗi tháng trong năm
			                            	</h4>
		                                    <div id="getSalesRateEveryMotnhInYear"></div>
		                                </div>
									</div>
									
									<div class="col-lg-6 col-xl-6">
			                            <div class="p-3" dir="ltr">
			                            	<h4 class="header-title mb-3 d-flex justify-content-around">
			                            		Tỉ lệ doanh số bán hàng mỗi ngày trong tháng của năm
			                            	</h4>
		                                    <div id="getSalesRateEveryDayInMonthOfYear"></div>
		                                </div>
									</div>
								</div>
	        				</div>
        				</div>
        			</div>
        		</div>
        	</div>
        
        	<%@ include file="/WEB-INF/views/admin/common/js.jsp" %>
        	<script src="<c:url value='/template/admin/libs/chart-js/Chart.bundle.min.js' />"></script>
        	<script src="<c:url value='/template/admin/libs/morris-js/morris.min.js' />"></script>
        	<script src="<c:url value='/template/admin/libs/raphael/raphael.min.js' />"></script>

			<script src="<c:url value='/template/admin/libs/d3/d3.min.js' />"></script>
        	<script src="<c:url value='/template/admin/libs/c3/c3.min.js' />"></script>
	        	
        	<script src="<c:url value='/template/admin/js/pages/chartjs.init.js' />"></script>
        	<script src="<c:url value='/template/admin/js/pages/c3.init.js' />"></script>
    
    		<script src="https://unpkg.com/axios/dist/axios.min.js"></script>    	
        	<script type="text/javascript">
	        	$(document).ready(function() {
	        		var month = new Date().getMonth() + 1;
	        		var year = new Date().getFullYear();
	        		
	        		getSalesEveryYear()
	        		getSalesEveryMonthByYear(year);
	        		getSalesEveryDayInMonthOfYear(year, month);
	        		
	        		getSalesRateEveryMotnhInYear(year);
	        		getSalesRateEveryDayInMonthOfYear(year, month)
	        	});
        	</script>
        	
        	<script type="text/javascript">
	        	$('#viewStatistic').on('click', () => {
	        		var month = $('#month').val();
	        		var year = $('#year').val();
	        		
	        		getSalesEveryMonthByYear(year);
	        		getSalesEveryDayInMonthOfYear(year, month);
	        		
	        		getSalesRateEveryMotnhInYear(year);
	        		getSalesRateEveryDayInMonthOfYear(year, month)
	        	});
        	</script>
        	
        	<script type="text/javascript">
	        	function getSalesEveryYear() {
	        		var url = '${domain}' + '/statistic/get_sales_every_year';
		    		axios.get(url)
		    			.then((response) => {
		    				var data = []
		    				
		    				response.data.map((item, index) => {
		    					data.push({
		    						'year': item[0],
		    						'sales': item[1],
		    						'quantity': item[2]
		    					});
		    				});
		    				
		    				new Morris.Bar({
				        		element: 'salesEveryYear',
				        		data: data,
				        		xkey: 'year',
				        		ykeys: ['sales'],
				        		labels: ['sales']
				        	});
		    				
		    				new Morris.Bar({
				        		element: 'salesQuatnityEveryYear',
				        		data: data,
				        		xkey: 'year',
				        		ykeys: ['quantity'],
				        		labels: ['quantity']
				        	});
		    			});
	        	}
        	</script>
        	
        	<script type="text/javascript">
        		function getSalesEveryMonthByYear(year) {
        			var url = '${domain}' + '/statistic/get_sales_every_month/' + year;
        			
	        		axios.get(url)
	        			.then((response) => {
	        				var months = ['Tháng'];
	        				var salesOfMonth = ['Doanh số bán trong năm'];
	        				var salesQunatityOfMonth = ['Số lượng đã bán trong năm'];
	        				
	        				response.data.map((item, index) => {
	        					months.push( item[0] );
	        					salesOfMonth.push( item[1] );
	        					salesQunatityOfMonth.push( item[2] );
	        				});
	        				
	        				var chart = c3.generate({
	        					bindto: '#salesQuatnityEveryYearChartStacked',
	        					data: {
	        						x: 'Tháng',
	        						columns: [ months, salesOfMonth, salesQunatityOfMonth ],
	        						axes: {
	        							data2: 'y2'
	        						}
	        					},
	        					axis: {
	        						x: {
	        							label: { 
	        					          	text: 'Tháng',
	        					          	position: 'outer-center'
	        					        },
	        					        type: 'category',
	        							show: true,
	        						},
	        						y: {
	        					   		label: { 
	        					          	text: 'Doanh số đã bán được trong năm',
	        					          	position: 'outer-middle'
	        					        },
	        					        min: 0
	        					    },
	        					    y2: {
	        					        label: { 
	        					          	text: 'Số lượng đã bán trong năm',
	        					          	position: 'outer-middle'
	        					        },
	        					        min: 0,
	        					        show: true
	        					    }
	        					}
	        				});
	        			});
        		}
        	</script>
        	
        	<script type="text/javascript">
        		function getSalesEveryDayInMonthOfYear(year, month) {
					var url = '${domain}' + '/statistic/get_sales_every_day?year=' + year + '&month=' + month;
        			
	        		axios.get(url)
	        			.then((response) => {
	        				var months = ['Ngày'];
	        				var salesOfMonth = ['Doanh số bán trong năm'];
	        				var salesQunatityOfMonth = ['Số lượng đã bán trong năm'];
	        				
	        				response.data.map((item, index) => {
	        					months.push( item[0] );
	        					salesOfMonth.push( item[1] );
	        					salesQunatityOfMonth.push( item[2] );
	        				});
	        				
	        				var chart = c3.generate({
	        					bindto: '#salesEveryDayByYearAndMonth',
	        					data: {
	        						x: 'Ngày',
	        						columns: [ months, salesOfMonth, salesQunatityOfMonth ],
	        						axes: {
	        							data2: 'y2'
	        						}
	        					},
	        					axis: {
	        						x: {
	        							label: { 
	        					          	text: 'Ngày',
	        					          	position: 'outer-center'
	        					        },
	        					        type: 'category',
	        							show: true,
	        						},
	        						y: {
	        					   		label: { 
	        					          	text: 'Doanh số đã bán được trong Tháng ' + month + ' của năm ' + year,
	        					          	position: 'outer-middle'
	        					        }
	        					    },
	        					    y2: {
	        					        label: { 
	        					        	text: 'Số lượng đã bán được trong Tháng ' + month + ' của năm ' + year,
	        					          	position: 'outer-middle'
	        					        },
	        					        min: 0,
	        					        show: true
	        					    }
	        					}
	        				});
	        			});
        		}
        	</script>
        	
        	<script type="text/javascript">
        		function getSalesRateEveryMotnhInYear(year) {
        			$('#getSalesRateEveryMotnhInYear').html('');
        			
        			var url = '${domain}' + '/statistic/get_sales_rate_every_month/' + year;
        			
	        		axios.get(url)
	        			.then((response) => {
	        				var data = [];
	        				response.data.map((item, index) => {
	        					data.push({
									label: 'Tháng ' + item[0],
									value: Number.parseFloat(item[1]).toFixed(2)
	        					});
	        				});
	        				
	        				Morris.Donut({
	        					element: 'getSalesRateEveryMotnhInYear',
	        					data: data,
	        					formatter: (value, data) => { 
	        					  	return  value + '%'; 
	        					}
	        				});
	        			});
        		}
        	</script>
        	
        	<script type="text/javascript">
        		function getSalesRateEveryDayInMonthOfYear(year, month) {
        			$('#getSalesRateEveryDayInMonthOfYear').html('');
        			
        			var url = '${domain}' + '/statistic/get_sales_rate_every_day?year=' + year + '&month=' + month;
        			
	        		axios.get(url)
	        			.then((response) => {
	        				var data = [];
	        				response.data.map((item, index) => {
	        					data.push({
									label: 'Ngày ' + item[0],
									value: Number.parseFloat(item[1]).toFixed(2)
	        					});
	        				});
	        				
	        				Morris.Donut({
	        					element: 'getSalesRateEveryDayInMonthOfYear',
	        					data: data,
	        					formatter: (value, data) => { 
	        					  	return  value + '%'; 
	        					}
	        				});
	        			});
        		}
        	</script>
        </div>
	</body>
</html>