<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="category" style="text-align: center;">
	<form method="post" action="<%=request.getContextPath() %>/bandcover.do" style="margin: auto;">
	<h2 style="display: inline-block;">카테고리 분류</h2>
		<input type="button" id="cabefor" onclick="cbeforpage()" value="<">
		<input type="hidden" value="1" id="beforassi">
		<input type="button" id="canext" onclick="cnextpage()" value=">">
		<input type="hidden" value="10" id="nextassi">
	<div id="makediv" style="width: 1780px; text-align: center;">
		<c:forEach var="category" items="${requestScope.category}">
			<div style="display: inline-block; width: 144px;">
				<img src="${category.categoryimg }" style="border-radius: 70%; overflow: hidden; width: 135px; margin: 20px;" class="class_url" onclick="detailcategory(this.src)">
				<strong class="catename">${category.category_btitle }</strong>
			</div>
		</c:forEach>
		<input type="hidden" value="" id="scategoryTransfer" name="scategory">
	</div>
	<div id="detail">
	</div>
	<div id="detail2">   <!--추가한곳 -->
		
	</div>
	</form>
</div>
<script>
	var beforassi=document.getElementById("beforassi");
	var nextassi=document.getElementById("nextassi");
	var scategoryTrandfer=document.getElementById("scategoryTransfer");
	var xhr=null;
	var on=0;
	
	function cbeforpage(){
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=category_change;
		var num=parseInt(beforassi.value)-10;
		
		if(num<1){
			num=17;
		}else if(num == 7){
			num=11;
		}
		
		xhr.open('post','<%=request.getContextPath() %>/category.do',true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send('category='+num);
		beforassi.value=num;
		nextassi.value=num+9;
	}
	
	function cnextpage() {
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=category_change;
		var num=parseInt(nextassi.value)+1;
		
		if(num>17 && num<22){
			num=17;
		}else if(num>26){
			num=1;
		}
		xhr.open('post','<%=request.getContextPath()%>/category.do',true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send('category='+num);
		nextassi.value=num+9;
		beforassi.value=num;
	}

	function category_change() {
		if(xhr.readyState==4 && xhr.status==200){
			var xml=xhr.responseText;
			var json=JSON.parse(xml);
			
			var catename=document.getElementsByClassName("catename");
			var url=document.getElementsByClassName("class_url");
			
			for(var i=0;i<10;i++){
				url[i].src=json[i].curl;
				catename[i].innerHTML=json[i].title;
			}
		}
	}
	function detailcategory2(num2) {
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=stitle2;
		xhr.open("get", '<%=request.getContextPath() %>/sView?snum='+num2, true);
		xhr.send();
 	}
	function stitle2() {
		if(xhr.readyState==4 && xhr.status==200){
			var xml=xhr.responseText;
			var json=JSON.parse(xml);
			var detail2=document.getElementById("detail2");
			
			
			for(var i=0;i<json.length;i++){
				console.log("테스트.jsp1");
				var div=document.createElement("div");
				//div1.innerHTML="밴드사진"
				
				div.innerHTML="<span class='fontCss1'>밴드이름:"+json[i].band_name+"</span> <br>"+"<span class='fontCss2'>밴드소개글:"+json[i].band_intoroductio+"</span><br><span class='fontCss3'> 멤버수:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;밴드장:</span>";
				
				detail2.appendChild(div);
				
			}
			
		}
	}
	function detailcategory(num) {
		var arraynum=num.split('/');
		var bnum=arraynum[6].split('.');
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=stitle;
		xhr.open("get", '<%=request.getContextPath() %>/scategory.do?bcategorynum='+bnum[0], true);
		xhr.send();
 	}
	
	function stitle() {
		if(xhr.readyState==4 && xhr.status==200){
			var xml=xhr.responseText;
			var json=JSON.parse(xml);
			var detail=document.getElementById("detail");
			var divclass=document.getElementsByClassName("divclass");
			var categorylist=new Array();
			
			var small=null;
			for(var i=0;i<json.length;i++){
				if(on>0){
					detail.removeChild(detail.firstChild);
				}

				var div=document.createElement("div");
				div.style.width="100px";
				div.style.height="50px";
				div.style.display="inline-block";
				div.style.border="1px solid black";
				div.style.margin="20px";
				div.className="divclass";
				
				div.innerHTML=json[i].category_stitle;
				small=json[i].category_stitle;
				
				//div.value=small;
				categorylist[i]=json[i].scategorynum;
				
				div.addEventListener("click", function() {
					
					for (var i = 0; i < divclass.length; i++) {
						divclass[i].style.backgroundColor="white";
					}
					
					this.style.backgroundColor="gray";
				
					for (var i = 0; i < divclass.length; i++) {
						if(divclass[i] == this){
							scategoryTrandfer.value=categorylist[i];
							//location.href="${cp}/smallCategory?category_stitle="+categorylist[i];
							detailcategory2(categorylist[i]);
						}
					}						
				
				});
				
				if(i == json.length-2){
					on=1;
				}
				
				detail.appendChild(div);
			}
		}
	}
</script>