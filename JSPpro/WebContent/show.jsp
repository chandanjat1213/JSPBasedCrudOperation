<%@page import="PP.Product"%>
<%@page import="java.util.List"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="r" class="PP.Rdao"></jsp:useBean>
<table align='center' border='1px'>
<%
  List<Product> al = r.show();
  for(Product p:al)  
  {
	%>
	<form action="updatepro.jsp">
    <tr>
    <td><%= p.getId() %> <input type="hidden" name="id" value="<%= p.getId() %>"/></td>
    <td><input type="text" name="name" value="<%= p.getName() %>"/></td>
    <td><input type="number" name="price" value="<%= p.getPrice() %>"/></td>
    <td><input type="text" name="cat" value="<%= p.getCat() %>"/></td>
    <td><input tupe="text" name="cmp" value="<%= p.getCmp() %>"/></td>
    <td><input type="submit" value="update"/></td>
    </form>
    <td><a href="delpro.jsp?id=<%= p.getId() %>">Delete</a></td>
    </tr>
    
	<%  
  }
%>
</table>