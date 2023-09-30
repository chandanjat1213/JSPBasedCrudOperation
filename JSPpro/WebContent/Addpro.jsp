<%@ page errorPage="error.jsp" %>  
<jsp:useBean id="p" class="PP.Product"></jsp:useBean>
<jsp:useBean id="rd" class="PP.Rdao"></jsp:useBean>
<jsp:setProperty property="*" name="p"/>
<%

int i=rd.Addproduct(p);
if(i>0){
RequestDispatcher r=request.getRequestDispatcher("index.jsp");
r.include(request, response);
out.println(i+" product added");
}
else{
	out.println("not add product");
}
%>