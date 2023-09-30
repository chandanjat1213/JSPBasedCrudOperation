<%@page import="PP.Product"%>
<%@page import="java.util.List"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="r" class="PP.Rdao"></jsp:useBean>
<table align='center' border='1px'>
<%
  String p1 = request.getParameter("pno");
  int pno = Integer.parseInt(p1);
  int totle = 5;
  if(pno==1)
  {
	  pno=pno-1;
  }
  else
  {
	  pno=pno-1;
	  pno=totle*pno;
  }
  List<Product> al= r.showbypage(pno,totle);
  for(Product p:al)
  {
	  %>
	  <tr>
	  <td><%=p.getId() %></td>
	  <td><%=p.getName() %></td>
	  <td><%=p.getPrice() %></td>
	  <td><%=p.getCat() %></td>
	  <td><%=p.getCmp() %></td>
	  </tr>
	  <%
   }
%>
</table>
<%
  int s = r.show().size();
  int c = 1;  
  for(int i=1; i<=s; i=i+5)
  {
		%>
		<a href="view.jsp?pno=<%= c %>"><%=c %></a>
		<%
		c++;
  }
%>