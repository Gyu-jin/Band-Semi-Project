<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bandMain.css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
window.onload=function(){	
	makeband=document.getElementById("makeband");
	
/* 	makeband.addEventListener("mouseover", function() {
		makeband.style.boxShadow="5px 5px 5px 5px";
	});
 */
 
/* 	makeband.addEventListener("mouseout", function() {
		makeband.style.boxShadow="none";
	});
 */
 
 }
 	function inshodow(band){
 		var choose = document.getElementById(band);
 		choose.style.boxShadow="3px 3px 3px 3px #999";
	}

 	function outshodow(band){
 		var choose = document.getElementById(band);
 		choose.style.boxShadow="none";
 	}
</script>
<div id="bandList">
	<h2>내 목록</h2>
	<div>
		<a href="category.do" id="a2">
			<span id="add" onmouseover="inshodow(this.id)"; onmouseout="outshodow(this.id)">
				<span style="border-radius: 70%; overflow: hidden; font-size: 140px;">
					&nbsp+&nbsp
				</span>
			</span>
		</a>
		<c:forEach var="list" items="${requestScope.bandlist }">
			<a href="" id="a2" >
				<div class="join_band" id="joinband${list.band_num }" onmouseover="inshodow(this.id)" onmouseout="outshodow(this.id)">
					<img src="${list.bandimg }" style="width: 180px; height: 149px;"><br>
					<span>${list.bandname }</span><br>
					<span id="membersoo">멤버:${list.bandcount }</span>
				</div>
			</a>
		</c:forEach>
	</div>
</div>

