package PP;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Rdao {

	public Connection con;
	public Connection getCon() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/sprnew","root","1213");
	}
	public int Addproduct(Product p) throws ClassNotFoundException,SQLException
	{
		con= getCon();
		String qr="insert into product value(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(qr);
		ps.setInt(1, p.getId());
		ps.setString(2, p.getName());
		ps.setInt(3, p.getPrice());
		ps.setString(4, p.getCat());
		ps.setString(5, p.getCmp());
		int i = ps.executeUpdate();
		con.close();
		return i;
	}
	public int updateProduct(Product p) throws ClassNotFoundException , SQLException
	{
		con = getCon();
		String qr = "update product set name=?,price=?,cat=?,cmp=? where id=?";
		PreparedStatement ps = con.prepareStatement(qr);
		ps.setInt(5,p.getId());
		ps.setString(1,p.getName());
		ps.setInt(2, p.getPrice());
		ps.setString(3, p.getCat());
		ps.setString(4,p.getCmp());
		int i = ps.executeUpdate();
		con.close();
		return i;
	}
	public int deleteProduct(Product p) throws ClassNotFoundException,SQLException
	{
		con=getCon();
		String qr = "delete from product where id=?";
		PreparedStatement ps = con.prepareStatement(qr);
		ps.setInt(1, p.getId());
		int i = ps.executeUpdate();
		con.close();
		return i;
	}
	public List show() throws ClassNotFoundException,SQLException
	{
		con=getCon();
		String qr = "select * from product";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(qr);
		List<Product> al = new ArrayList<Product>();
		while(rs.next())
		{
			Product p = new Product();
			p.setId(rs.getInt("id"));
			p.setName(rs.getString("name"));
			p.setPrice(rs.getInt("price"));
			p.setCat(rs.getString("cat"));
			p.setCmp(rs.getString("cmp"));
			al.add(p);
		}
	  con.close();
	  return al;
	}
	public List showbypage(int s, int t) throws ClassNotFoundException,SQLException
	{
		con=getCon();
		String qr = "select * from product limit "+s+","+t;
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(qr);
		List<Product> al = new ArrayList<Product>();
		while(rs.next())
		{
		   Product p = new Product();
		   p.setId(rs.getInt("id"));
		   p.setName(rs.getString("name"));
		   p.setPrice(rs.getInt("price"));
		   p.setCat(rs.getString("cat"));
		   p.setCmp(rs.getString("cmp"));
		   al.add(p);
		}
		con.close();
		return al;
	}
}
