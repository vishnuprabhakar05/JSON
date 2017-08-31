<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="script/jquery-1.7.1.js"></script>
<link type="text/css" rel="stylesheet" href="index.css">
<title>STATE</title>
<script type="text/javascript">
$(document).ready(function()
		{
			
			$.getJSON("getstate.jsp",function(json)
					{
						//alert("dddd");
						var len=json.length;
						//alert(len);
						for(var i=0;i<len;i++)
							{
								var state=json[i].statekey;
								//alert(state);
								$("#selstate").append("<option>"+state+"</option>");
							}
					});
			
			$("#selstate").change(function()
					{
						var state=$("#selstate").val();
						alert(state);
						$("#dist").html("");	
				 $.getJSON("getdist.jsp?statekey="+state,function(json)
						{
							//alert("dddd");
							var len=json.length;
							//alert(len);
							for(var i=0;i<len;i++)
								{
									var district=json[i].distkey;
									//alert(state);
									$("#dist").append("<option>"+district+"</option>");
								}
						}); 
				
					});
			
			
	
		});



</script>

</head>
<body>
<div class="main">
	<h4><u>SELECT STATE</u></h4>
	<div class="con">
		<div class="state" id="state">
			<h4> STATE :</h4>
		</div>
		<div class="state">
			<select id="selstate">
			<option>select</option>
			
			
			
		
			
			</select>
			
		</div>
	</div>
	<div class="con">
		<div class="dist" id="dist1">
			<h4> DISTRICT :</h4>
		</div>
		<div class="dist">
			<select id="dist">
			
			
			</select>
		</div>
	</div>
	<div class="con">
		<input type="button" value="OK">
		
	</div>

</div>

</body>
</html>