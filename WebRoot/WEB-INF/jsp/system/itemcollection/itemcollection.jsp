<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
  </head>
  <form action="/smart/itemCollection/saveItemCollection" method="get" >
        <input type="hidden" name="token" value="${token}" />
	   <input type="hidden" name="SmartBallID" value="simulate22">
	   <input type="hidden" name="No" value="0001">
	   <input type="hidden" name="url" value="/smart/itemCollection/itemCollection">
	   
	   <input type="submit" value="放置小球"> 
   </form>
   
   <form action="/smart/itemCollection/updateItemCollection" method="get">
       <input type="hidden" name="token" value="${token}" />
	   <input type="hidden" name="SmartBallID" value="simulate22">
	   <input type="hidden" name="No" value="0001">
	   <input type="hidden" name="url" value="/smart/itemCollection/itemCollection">
	   <input type="submit" value="拿走小球">
   </form>
  <body>
    
  </body>
</html>
