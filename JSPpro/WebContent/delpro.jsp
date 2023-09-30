<%@page errorPage="error.jsp" %>
<jsp:useBean id="p" class="PP.Product"></jsp:useBean>
<jsp:useBean id="r" class="PP.Rdao"></jsp:useBean>
<jsp:setProperty property="id" name="p"></jsp:setProperty>
<%
  
  int i = r.deleteProduct(p);
  if(i>0){
  RequestDispatcher rd = request.getRequestDispatcher("show.jsp");
  rd.include(request,response);
  out.println(i+" product deleted");
  }
  else{
	  out.println("not delete product");
  }
	  
%>
