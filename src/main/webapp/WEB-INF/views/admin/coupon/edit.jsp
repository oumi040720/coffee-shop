<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Admin | Coupon</title>
		
		<%@ include file="/WEB-INF/views/admin/common/css.jsp" %>
		<link href="<c:url value='/template/admin/libs/bootstrap-datepicker/bootstrap-datepicker.min.css' />" rel="stylesheet" type="text/css">
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
        								<li class="breadcrumb-item"><a href="javascript: void(0);">Phiếu mua hàng</a></li>
        								<c:if test="${check}">
        									<li class="breadcrumb-item active">Cập nhật</li>
        								</c:if>
        								<c:if test="${!check}">
        									<li class="breadcrumb-item active">Thêm mới</li>
        								</c:if>
        							</ol>
        						</div>
        						<c:if test="${check}">
        							<h4 class="page-title">Cập nhật phiếu mua hàng</h4>
        						</c:if>
        						<c:if test="${!check}">
        							<h4 class="page-title">Thêm mới phiếu mua hàng</h4>
        						</c:if>
        					</div>
        				</div>
        			</div>
        			<div class="row">
        				<div class="col-lg-12">
        					<div class="card-box">
        						<div class="row">
        							<c:url var="action" value="/admin/coupon/save" />
        							<form:form action="${action}" modelAttribute="coupon" cssClass="col-lg-12" 
        									onsubmit="return checkValidated()" data-parsley-validate="" novalidate="">
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Mã <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="couponCode" cssClass="form-control" onfocusout="getCouponCode()"/>
        										<ul class="parsley-errors-list filled">
        											<li id="warningCouponCode" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Loại <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        									<!-- THIẾU GIẢM GIÁ NHƯ THẾ NÀO -->
        										<form:select path="type" cssClass="form-control" >
        											<form:option value="">-- Chọn loại phiếu mua hàng --</form:option>
        											<form:option value="Miễn Phí Vận Chuyển">Miễn phí vận chuyển</form:option>
        											<form:option value="Giảm Giá Trực Tiếp">Giảm giá trực tiếp</form:option>
        											<form:option value="Giảm Giá Theo Phần Trăm">Giảm giá theo phần trăm</form:option>
        										</form:select>
        										<ul class="parsley-errors-list filled">
        											<li id="warningType" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Giảm giá <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="discount" cssClass="form-control"/>
        										<ul class="parsley-errors-list filled">
        											<li id="warningDiscount" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Hóa đơn tối thiểu
        									</label>
        									<div class="col-lg-10">
        										<form:input path="minTotalBill" cssClass="form-control"/>
        										<ul class="parsley-errors-list filled">
        											<li id="warningMinTotalBill" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Giảm giá tối đa
        									</label>
        									<div class="col-lg-10">
        										<form:input path="maxDiscount" cssClass="form-control"/>
        										<ul class="parsley-errors-list filled">
        											<li id="warningMaxDiscount" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Ngày bắt đầu <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="startTime" cssClass="form-control" 
        											data-provide="datepicker" data-date-autoclose="true" />
        										<ul class="parsley-errors-list filled">
        											<li id="warningStartTime" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Ngày kết thúc <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="endTime" cssClass="form-control" 
        											data-provide="datepicker" data-date-autoclose="true" />
        										<ul class="parsley-errors-list filled">
        											<li id="warningEndTime" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label"></label>
        									<div class="col-lg-10">
        										<button id="submit" type="submit" class="btn btn-outline-success btn-rounded waves-effect waves-light"><i class="ion ion-ios-save"></i>
        											<c:if test="${check}"> Cập nhật </c:if>
        											<c:if test="${!check}"> Thêm </c:if>
        										</button>
        										<c:if test="${check}"> 
        											<form:hidden path="id"/>
        										</c:if>
        										<form:hidden path="flagDelete"/>
        										<button type="reset" class="btn btn-outline-warning btn-rounded waves-effect waves-light"><i class="ion ion-md-refresh"></i>
        											Nhập lại
        										</button>
        									</div>
        								</div>
        							</form:form>
        						</div>
        					</div>
        				</div>
        			</div>
        		</div>
        	</div>
        
        	<input id='flag' type="hidden" value='' >
        
        	<%@ include file="/WEB-INF/views/admin/common/js.jsp" %>
        	<script src="<c:url value='/template/admin/libs/moment/moment.min.js' />"></script>
        	<script src="<c:url value='/template/admin/libs/bootstrap-datepicker/bootstrap-datepicker.min.js' />"></script>
	        <script type="text/javascript">
		        $(document).ready(function(){
		    		$("#startTime").attr({
		    			"placeholder": "mm/dd/yyyy"
		    		});
		    		$("#endTime").attr({
		    			"placeholder": "mm/dd/yyyy"
		    		});
		    	});
	        </script>
	        <c:if test="${check}">
		        <script type="text/javascript">
			        $(document).ready(function(){
			    		var startTime = $("#startTime").val().split(" ")[0].split("-");
						$("#startTime").val(startTime[1] + '/' + startTime[2] + '/' + startTime[0]);
			    		
			    		
			    		var endTime = $("#endTime").val().split(" ")[0].split("-");
			    		$("#endTime").val(endTime[1] + '/' + endTime[2] + '/' + endTime[0]);	
			    	});
		        </script>
	        </c:if>
	        <c:if test="${!check}">
		        <script type="text/javascript">
			        $(document).ready(function(){
			        	var start = "";
			        	var end = "";
			        	
			        	var now = new Date();
			        	var endDate = new Date(); 
			        	endDate.setDate(now.getDate() + 7);
			        	
			        	if (Number(now.getMonth()) < 9) {
			        		start += "0" + (now.getMonth() + 1);
			        	} else {
			        		start += (now.getMonth() + 1);
			        	}
			        	if (Number(endDate.getMonth()) < 9) {
			        		end += "0" + (endDate.getMonth() + 1);
			        	} else {
			        		end += (endDate.getMonth() + 1);
			        	}
			        	
			        	if (Number(now.getDate()) < 10) {
			        		start += "/0" + now.getDate();
			        	} else {
			        		start += "/" + now.getDate();
			        	}
			        	if (Number(endDate.getDate()) < 10) {
			        		end += "/0" + endDate.getDate();
			        	} else {
			        		end += "/" + endDate.getDate();
			        	}
			        	
			        	$("#startTime").val(start + "/" + now.getFullYear());
			        	$("#endTime").val(end + "/" + endDate.getFullYear());
			    	});
		        </script>
	        </c:if>
        	<c:if test="${!check}">
        		<script type="text/javascript">
	        		var getCouponCode =  function() {
	            		var url = '${domain}' + '/coupon/coupon_code/' + $('#couponCode').val();
	
	            		$.ajax({
	    					 url: url,
	    					 type : "get",
	    					 success: function(result) {
	    						 console.log(result);
	    						 if (!result) {
	    							 $('#flag').val('true');
	    							 $('#warningCouponCode').text('');
	    							 $('#couponCode').removeClass('parsley-error');
	    						 } else {
	    							 $('#flag').val('false');
	    							 $('#couponCode').addClass('parsley-error');
	    							 $('#warningCouponCode').text('MÃ GIẢM GIÁ đã tồn tại!');
	    						 }
	    					 }
	    				});
	            	}
        		</script>
        	</c:if>
        	<script type="text/javascript">
        		var checkValidated =  function() {
        			try {
        				var couponCode = $('#couponCode').val();
            			var type = $('#type').val();
            			var discount = $('#discount').val();
            			//var minTotalBill = $('#minTotalBill').val();
            			//var maxDiscount = $('#maxDiscount').val();
            			var startTime = $('#startTime').val();
            			var endTime = $('#endTime').val();
            			
            			
            			var checkCouponCode = false;
            			var checkType = false;
            			var checkDiscount = false;
            			//var checkMinTotalBill = false;
            			//var checkMaxDiscount = false;
            			var checkStartTime = false;
            			var checkEndTime = false;
            			
            			var flag = $('#flag').val();
            			
            			if (couponCode.trim().length > 0) {
    						$('#warningCouponCode').text('');
    						$('#couponCode').removeClass('parsley-error');
    						checkCouponCode = true;
    					} else {
    						$('#couponCode').addClass('parsley-error');
    						$('#warningCouponCode').text('Không được bỏ trống MÃ GIẢM GIÁ!');
    						checkCouponCode = false;
    					}
            			
    					if (type.trim().length > 0) {
    						$('#warningType').text('');
    						$('#type').removeClass('parsley-error');
    						checkType = true;
    					} else {
    						$('#type').addClass('parsley-error');
    						$('#warningType').text('Không được bỏ trống LOẠI MÃ GIẢM GIÁ!');
    						checkType = false;
    					}
    					
    					if (discount.trim().length > 0) {
    						$('#warningDiscount').text('');
    						$('#discount').removeClass('parsley-error');
    						checkDiscount = true;
    					} else {
    						$('#discount').addClass('parsley-error');
    						$('#warningDiscount').text('Không được bỏ trống GIẢM GIÁ!');
    						checkDiscount = false;
    					}
    					
    					if (startTime.trim().length > 0) {
    						$('#warningStartTime').text('');
    						$('#startTime').removeClass('parsley-error');
    						checkStartTime = true;
    					} else {
    						$('#startTime').addClass('parsley-error');
    						$('#warningStartTime').text('Không được bỏ trống NGÀY BẮT ĐẦU!');
    						checkStartTime = false;
    					}
    					
    					if (endTime.trim().length > 0) {
    						$('#warningEndTime').text('');
    						$('#endTime').removeClass('parsley-error');
    						checkEndTime = true;
    					} else {
    						$('#endTime').addClass('parsley-error');
    						$('#warningEndTime').text('Không được bỏ trống NGÀY KẾT THÚC!');
    						checkEndTime = false;
    					}
    					
    					if (couponCode) {
    						if (flag === 'true') {
    							$('#warningCouponCode').text('');
							 	$('#coupon').removeClass('parsley-error');
    							checkUsername = true;
    						} else if (flag === 'false') {
    							$('#coupon').addClass('parsley-error');
								$('#warningCouponCode').text('MÃ GIẢM GIÁ đã tồn tại!');
    							checkUsername = false;
    						}
    					} 
    					
    					if (checkStartTime) {
    						var pattern = new RegExp('(0|1)[0-9]/[0-3][0-9]/(19|20)[0-9]{2}'); 
    						if(startTime.match(pattern)) {
    							var array = startTime.split('/'); 
    							
    							var day = array[1]; 
    							var month = array[0] - 1;
    							var year = array[2]; 
    							
    							sourceDate = new Date(year,month,day); 
    							
    							if(year != sourceDate.getFullYear()) {
    								$('#startTime').addClass('parsley-error');
    								$('#warningStartTime').text('Năm của NGÀY BẮT ĐẦU không hợp lệ!');
    								checkStartTime = false;
    							} else {
    								$('#warningStartTime').text('');
    								$('#startTime').removeClass('parsley-error');
    								checkStartTime = true;
    							}
    							
    							if(month != sourceDate.getMonth()) {
    								$('#startTime').addClass('parsley-error');
    								$('#warningStartTime').text('Tháng của NGÀY BẮT ĐẦU không hợp lệ!');
    								checkStartTime = false;
    							} else {
    								$('#warningStartTime').text('');
    								$('#startTime').removeClass('parsley-error');
    								checkStartTime = true;
    							}
    							
    							if(day != sourceDate.getDate()) {
    								$('#startTime').addClass('parsley-error');
    								$('#warningStartTime').text('Ngày của NGÀY BẮT ĐẦU không hợp lệ!');
    								checkStartTime = false;
    							} else {
    								$('#warningStartTime').text('');
    								$('#startTime').removeClass('parsley-error');
    								checkStartTime = true;
    							}
    						} else {
    							$('#startTime').addClass('parsley-error');
    							$('#warningStartTime').text('Định dạng NGÀY SINH không hợp lệ!');
    							checkStartTime = false;
    						}
    					}
    					
    					if (checkEndTime) {
    						var pattern = new RegExp('(0|1)[0-9]/[0-3][0-9]/(19|20)[0-9]{2}'); 
    						if(endTime.match(pattern)) {
    							var array = endTime.split('/'); 
    							
    							var day = array[1]; 
    							var month = array[0] - 1;
    							var year = array[2]; 
    							
    							sourceDate = new Date(year,month,day); 
    							
    							if(year != sourceDate.getFullYear()) {
    								$('#endTime').addClass('parsley-error');
    								$('#warningEndTime').text('Năm của NGÀY KẾT THÚC không hợp lệ!');
    								checkEndTime = false;
    							} else {
    								$('#warningEndTime').text('');
    								$('#endTime').removeClass('parsley-error');
    								checkEndTime = true;
    							}
    							
    							if(month != sourceDate.getMonth()) {
    								$('#endTime').addClass('parsley-error');
    								$('#warningEndTime').text('Tháng của NGÀY KẾT THÚC không hợp lệ!');
    								checkEndTime = false;
    							} else {
    								$('#warningEndTime').text('');
    								$('#endTime').removeClass('parsley-error');
    								checkEndTime = true;
    							}
    							
    							if(day != sourceDate.getDate()) {
    								$('#endTime').addClass('parsley-error');
    								$('#warningEndTime').text('Ngày của NGÀY KẾT THÚC không hợp lệ!');
    								checkEndTime = false;
    							} else {
    								$('#warningEndTime').text('');
    								$('#endTime').removeClass('parsley-error');
    								checkEndTime = true;
    							}
    						} else {
    							$('#endTime').addClass('parsley-error');
    							$('#warningEndTime').text('Định dạng NGÀY KẾT THÚC không hợp lệ!');
    							checkEndTime = false;
    						}
    					}

    					
    					///////////////////////////////////////////// SO SANH END DATE AND STRAT DATE
    					
    					if (checkCouponCode && checkType && checkDiscount && checkStartTime && checkEndTime) {
    						return true;
    					} else {
    						return false;
    					}
        			} catch(err) {
        				return false;
        			}
        		}
        	</script>
        </div>
	</body>
</html>