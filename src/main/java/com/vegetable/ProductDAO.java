package com.vegetable;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;


public class ProductDAO {

	private Connection con;
	
    public ProductDAO(Connection con) {
		super();
		this.con = con;
	}
    // Insert Product
	public static void addProduct(Product p, Part part, ServletContext ctx) throws Exception {
        Connection con = DbConnect.Connect();
        PreparedStatement ps = con
                .prepareStatement("INSERT into products(pname,pcat,price,disc_price,remarks,descr) VALUES(?,?,?,?,?,?)",
                        Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, p.getPname());
        ps.setString(2, p.getPcat());
        ps.setFloat(3, p.getPrice());
        ps.setFloat(4, p.getDisc_price());
        ps.setString(5, p.getRemarks());
        ps.setString(6, p.getDescr());
        ps.executeUpdate();
        ResultSet rs = ps.getGeneratedKeys();
        rs.next();
        String id = rs.getString(1);
        ps = con.prepareStatement("update products set photo=? where prodid=?");
        ps.setString(1, id + ".jpg");
        ps.setString(2, id);
        ps.executeUpdate();
        fileCopy(ctx, part, id + ".jpg");

        con.close();
        System.out.println("All done with product");
    }

    public static void fileCopy(ServletContext ctx, Part part, String filename) throws Exception {
        Files.copy(part.getInputStream(),
                Paths.get(ctx.getRealPath("/images2/"), filename),
                StandardCopyOption.REPLACE_EXISTING);
    }
    
    //Edit product
    public Product getProductById(int prodid) {
		Product p = null;
		
		try {
			String sql="select * from products where prodid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, prodid);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				p=new Product();
				p.setProdid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcat(rs.getString(3));
				p.setPrice(rs.getFloat(4));
				p.setDisc_price(rs.getFloat(5));
				p.setPhoto(rs.getString(6));
				p.setRemarks(rs.getString(7));
				p.setDescr(rs.getString(8));
				p.setInstock(rs.getString(9));
				p.setFeatured(rs.getString(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

    public static List<String> getProductNames() throws Exception {
        List<String> list = new ArrayList<String>();
        Connection con=DbConnect.Connect();
        ResultSet rs = con.createStatement().executeQuery("select pname from products");
        while (rs.next()) {
            list.add(rs.getString("pname"));
        }
        con.close();
        return list;
    }

    public static List<Product> getProducts(boolean sort, boolean desc) throws Exception {
        List<Product> list = new ArrayList<Product>();
        Connection con = DbConnect.Connect();
        ResultSet rs = null;
        if (sort) {
            rs = con.createStatement().executeQuery("SELECT * FROM products order by disc_price");
            if (desc) {
                rs = con.createStatement().executeQuery("SELECT * FROM products order by disc_price desc");
            }
        } else {
            rs = con.createStatement().executeQuery("SELECT * FROM products order by prodid");
        }
        while (rs.next()) {
            Product p = new Product();
            p.setProdid(rs.getInt("prodid"));
            p.setPname(rs.getString("pname"));
            p.setPcat(rs.getString("pcat"));
            p.setPhoto(rs.getString("photo"));
            p.setPrice(rs.getFloat("price"));
            p.setDisc_price(rs.getFloat("disc_price"));
            p.setRemarks(rs.getString("remarks"));
            p.setDescr(rs.getString("descr"));
            p.setFeatured(rs.getString("featured"));
            p.setInstock(rs.getString("instock"));
            p.setCreate_date(rs.getString("create_date"));
            list.add(p);
        }
        con.close();
        return list;
    }
    
    //
    public static List<Product> getPagedProducts(int pagesize,int pageno) throws Exception {
        List<Product> list = new ArrayList<Product>();
        Connection con = DbConnect.Connect();
        ResultSet rs = null;            
        //pagesize 8 pageno 1 1-8  2  9-16  start=pageno*pagesize-pagesize+1
        int start=(pageno*pagesize)-pageno+1;
        int end=pagesize;
        System.out.println("end "+end);
        rs = con.createStatement().executeQuery("SELECT * FROM products order by prodid limit "+start+","+end);
        while (rs.next()) {
            Product p = new Product();
            p.setProdid(rs.getInt("prodid"));
            p.setPname(rs.getString("pname"));
            p.setPcat(rs.getString("pcat"));
            p.setPhoto(rs.getString("photo"));
            p.setPrice(rs.getFloat("price"));
            p.setDisc_price(rs.getFloat("disc_price"));
            p.setRemarks(rs.getString("remarks"));
            p.setDescr(rs.getString("descr"));
            p.setFeatured(rs.getString("featured"));
            p.setInstock(rs.getString("instock"));
            p.setCreate_date(rs.getString("create_date"));
            list.add(p);
        }
        con.close();
        return list;
    }

    public static List<Product> findByName(String pname) throws Exception {
        List<Product> list = new ArrayList<Product>();
        Connection con = DbConnect.Connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM products WHERE pname like '%" + pname + "%'");
        while (rs.next()) {
            Product p = new Product();
            p.setProdid(rs.getInt("prodid"));
            p.setPname(rs.getString("pname"));
            p.setPcat(rs.getString("pcat"));
            p.setPhoto(rs.getString("photo"));
            p.setPrice(rs.getFloat("price"));
            p.setDisc_price(rs.getFloat("disc_price"));
            p.setRemarks(rs.getString("remarks"));
            p.setDescr(rs.getString("descr"));
            p.setFeatured(rs.getString("featured"));
            p.setInstock(rs.getString("instock"));
            p.setCreate_date(rs.getString("create_date"));
            list.add(p);
        }
        con.close();
        return list;
    }

    public static Product findByID(String prodid) throws Exception {
        Product p = new Product();
        Connection con = DbConnect.Connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM products WHERE prodid='"+prodid+"'");
        rs.next();
        p.setProdid(rs.getInt("prodid"));
        p.setPname(rs.getString("pname"));
        p.setPcat(rs.getString("pcat"));
        p.setPhoto(rs.getString("photo"));
        p.setPrice(rs.getFloat("price"));
        p.setFeatured(rs.getString("featured"));
        p.setInstock(rs.getString("instock"));
        p.setDisc_price(rs.getFloat("disc_price"));
        p.setRemarks(rs.getString("remarks"));
        p.setDescr(rs.getString("descr"));
        p.setCreate_date(rs.getString("create_date"));
        con.close();
        return p;
    }

    public static void removeProduct(String prodid) throws Exception {

    }

    //update product
    public static void updateProduct(Product p) throws Exception {
        Connection con = DbConnect.Connect();

        PreparedStatement ps = con
                .prepareStatement("UPDATE products set pname=?,pcat=?,price=?,disc_price=?,remarks=?,descr=?,instock=?,featured=? where prodid=?");
        ps.setString(1, p.getPname());
        ps.setString(2, p.getPcat());
        ps.setFloat(3, p.getPrice());
        ps.setFloat(4, p.getDisc_price());
        ps.setString(5, p.getRemarks());
        ps.setString(6, p.getDescr());
        ps.setString(7, p.getInstock());
        ps.setString(8, p.getFeatured());
        ps.setInt(9, p.getProdid());

        ps.executeUpdate();
        con.close();
        System.out.println("Product Updated..!!");
    }

    public static int totalProducts() throws Exception {
        Connection con = DbConnect.Connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT count(*) from products");
        rs.next();
        int total = rs.getInt(1);
        con.close();
        return total;
    }
}