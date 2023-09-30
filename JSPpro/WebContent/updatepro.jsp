<%@page errorPage="error.jsp"%>
<jsp:useBean id="r" class="PP.Rdao"></jsp:useBean>
<jsp:useBean id="p" class="PP.Product"></jsp:useBean>
<jsp:setProperty property="*" name="p"></jsp:setProperty>
<%
  int i = r.updateProduct(p);
  if(i>0)
  {
	  RequestDispatcher rd = request.getRequestDispatcher("show.jsp");
	  rd.include(request,response);
	  out.println(i+" product updated");
  }
  else
  {
	  out.println("product not updated");
  }
%>