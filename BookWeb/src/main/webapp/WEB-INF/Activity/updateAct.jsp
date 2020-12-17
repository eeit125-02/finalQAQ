<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE HTML>
<html>
<head>
<style>
</style>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/style.css'  type="text/css" />
<meta charset="UTF-8">
<title>MVC</title>
<script type="text/javascript">
  function confirmDelete(ACT_Name){
	  var result = confirm("確定刪除此筆記錄(活動名稱:" + ACT_Name + ")?");
	  if (result) {
		  document.forms[0].finalDecision.value = "DELETE";
	      return true;
	  }
	  return false;
  }
  function confirmUpdate(ACT_Name){
	  var result = confirm("確定送出此筆記錄(活動名稱:" + ACT_Name + ")?");
	  if (result) {
		  document.forms[0].finalDecision.value = "UPDATE";
	      return true;
	  }
	  return false;
  }
</script>
</head>
<body>
<p>&nbsp;</p>
<hr>
<div class='center' >
<H1 class='center'>更新活動資料</H1>
<hr>
<p> 
<Form class='center' Action="DeletenUpdateActServlet" method="POST" >
    
    <input type="hidden" name="ACT_ID"     value="${ab.ACT_ID}" >
    <input type="hidden" name="MB_ID"     value="${ab.MB_ID}${param.MB_ID}" >
    <input type="hidden" name="finalDecision" value="" > 
    <Table>
         <TR>
             <TD align="RIGHT">活動圖片：</TD>
             <TD align="LEFT">${ab.ACT_Image}${param.ACT_Image}</TD>
         </TR>
         <TR>
             <TD align="RIGHT">活動名稱：</TD>
             <TD align="LEFT" >
                <input type="text" name="ACT_Name" value="${ab.ACT_Name}${param.ACT_Name}"  size="50">
                <font color='red' size='-3'>${error.ACT_Name}</font>
             </TD>
         </TR>             
                      
         <TR>
              <TD align="RIGHT">活動主題：</TD>
             <TD align="LEFT" >
                <input type="text" name="ACT_Theme" value="${ab.ACT_Theme}${param.ACT_Theme}" >
                <font color='red' size='-3'>${error.ACT_Theme}</font>
             </TD>
         </TR>
         
         <TR>
              <TD align="RIGHT">活動日期：</TD>
             <TD align="LEFT" >
                <input type="datetime-local" name="ACT_Date" value="${ab.ACT_Date}${param.ACT_Date}" >
                <font color='red' size='-3'>${error.ACT_Date}</font>
             </TD>
         </TR>  
         
         <TR>
              <TD align="RIGHT">活動規則：</TD>
             <TD align="LEFT" >
                <input type="text" name="ACT_Loc" value="${ab.ACT_Loc}${param.ACT_Loc}" >
                <font color='red' size='-3'>${error.ACT_Loc}</font>
             </TD>
         </TR>      
         
         <TR>
              <TD align="RIGHT">活動簡介：</TD>
             <TD align="LEFT" >
                <input type="text" name="ACT_Intro" value="${ab.ACT_Intro}${param.ACT_Intro}" >
                <font color='red' size='-3'>${error.ACT_Intro}</font>
             </TD>
         </TR>   
         
          <TR>
              <TD align="RIGHT">活動嘉賓：</TD>
             <TD align="LEFT" >
                <input type="text" name="ACT_Guest" value="${ab.ACT_Guest}${param.ACT_Guest}" >
                <font color='red' size='-3'>${error.ACT_Guest}</font>
             </TD>
         </TR>      
         
          <TR>
              <TD align="RIGHT">活動人數：</TD>
             <TD align="LEFT" >
                <input type="text" name="ACT_Pax" value="${ab.ACT_Pax}${param.ACT_Pax}" >
                <font color='red' size='-3'>${error.ACT_Pax}</font>
             </TD>
         </TR>
         
         <TR>
              <TD align="RIGHT">活動規則：</TD>
             <TD align="LEFT" >
                <input type="text" name="ACT_Rule" value="${ab.ACT_Rule}${param.ACT_Rule}" >
                <font color='red' size='-3'>${error.ACT_Rule}</font>
             </TD>
         </TR>          
         
         <TR>
              <TD align="RIGHT">活動標籤：</TD>
             <TD align="LEFT" >
                <input type="text" name="ACT_Tag" value="${ab.ACT_Tag}${param.ACT_Tag}" >
                <font color='red' size='-3'>${error.ACT_Tag}</font>
             </TD>
         </TR>
         
         <TR>
              <TD align="RIGHT">活動場所：</TD>
             <TD align="LEFT" >
                <input type="text" name="ACT_Place" value="${ab.ACT_Place}${param.ACT_Place}" >
                <font color='red' size='-3'>${error.ACT_Place}</font>
             </TD>
         </TR>                                        

        <TR>
            <TD colspan="2" align="center">     
            <input type="submit" value="更新" name='updateBtn' onclick="return confirmUpdate('${ab.ACT_Name}');"> 
            <input type="submit" value="刪除" name='deleteBtn' onclick="return confirmDelete('${ab.ACT_Name}');" >
            </TD>
            </TR>
         </Table>
         <c:if test="${not empty requestScope.modify}">   
           <c:remove var="act" scope="request" />       
         </c:if>
</Form>
<p/>
<small>&lt;&lt;<a href="/QueryAllActsServlet">回上一頁</a>&gt;&gt;</small>
</div>
</body>

</html>
