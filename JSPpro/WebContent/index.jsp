<h1>Welcome to Product Page</h1>
<form  action="Addpro.jsp">
Id<input type="number" name="id" /><br>
Name<input type="text" name="name" /><br>
Price<input type="number" name="price" /><br>
Category<select name="cat">
        <option>leptop</option>
        <option>mobile</option>
        <option>teblet</option>
       </select><br>
Company<select name="cmp">
       <option>MI</option>
       <option>Dell</option>
       <option>1+</option>
       </select><br>
<input type="submit" value="AddProduct"/>
</form>
<a href="show.jsp">show product</a>
<br>
<a href="view.jsp?pno=1">view pagination</a>