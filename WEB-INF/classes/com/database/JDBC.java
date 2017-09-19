package com.database;

import java.sql.*;

import java.io.*;

import java.util.Random;
import java.util.ArrayList;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
/*
 
 Functions:
 
 *  boolean validateUsername(String username)
 *  boolean addUser(String firstname, String lastname, String gender, String address, 
                    String city, String state, String zip, String email, String username, String password)
 *
 */

public class JDBC implements Serializable{

	// JDBC driver name and database URL
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	final String DB_URL = "jdbc:mysql://localhost:3306/ShoppingMall";

	// Database credentials
	final String USER = "root";
	final String PASS = "370bc@AA#cgm";
	
	Connection conn = null;

	//public static void main(String[] args) {
		 public JDBC() {

		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
    
    
    
    // this function checks whether the username os already registered in the database or not.
    public boolean validateUsername(String username){
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select username from customer where username ='" + username+"'");

            if(rs.next()){
                return false;
            }
            return true;
		} catch (Exception e){
            return false;
        }
	}
    
    // add a new user to the database
    public boolean addUser(String firstname,
                           String lastname,
                           String gender,
                           String address,
                           String city,
                           String state,
                           String zip,
                           String email,
                           String username,
                           String password){
        boolean pk_available=false;
        Random r = new Random();
        int pk=0;
        while(!pk_available){
            pk = r.nextInt(899999)+100000;
            try{
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select custID from customer where custID = '" + pk + "'");
                if(rs.next()){
                    continue;
                } else break;
            } catch(Exception e){
                
            }
        }
        if(gender.equals("male"))
            gender = "M";
        else
            gender = "F";
       
        try{
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO customer values ("+pk+", '"+username+"', '"+password+"', '"+lastname+"', '"+firstname+"', '"+gender+"', '"+state+"', '"+city+"', "+Integer.parseInt(zip)+", '"+address+"', '"+email+"')";
            stmt.executeUpdate(query);

            return true;
        } catch(Exception e){
            //StringWriter errors = new StringWriter();
            //e.printStackTrace(new PrintWriter(errors));
            //return errors.toString();
            return false;
        }
    }
    
    public ArrayList<Object[]> getListOfProducts(){
        ArrayList<Object[]> products = new ArrayList<Object[]>();
        
        try{
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select name, category, price, qty, barcode from product order by category");
            
            while(rs.next()){
                products.add(new Object[]{rs.getString(1), rs.getString(2), rs.getBigDecimal(3), rs.getInt(4), rs.getInt(5)});
            }
            
            return products;
            
        } catch (Exception e){
            return null;
        }
        
    }
    public String getListOfProductstoString(ArrayList<Object[]> products){
        StringBuilder s = new StringBuilder();
        for(Object[] o : products)
            s.append(o[0]+"\t" + o[1]+"\t" +o[2]+"\t" +o[3]+"<br>");
        return s.toString();
    }
    
    
    
    
    
    
    // Customer Queries
    public boolean authenticate(String username, String password){
        try{
            Statement stmt= conn.createStatement();
            String query = "select username from customer where password = '"+password+"'";
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                return true;
            }
            return false;
            
        } catch (Exception e){
            return false;
        }
    }
    
    public boolean authenticateEmployee(String username, String password){
        try{
            Statement stmt= conn.createStatement();
            String query = "select username from employee where password = '"+password+"'";
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                return true;
            }
            return false;
            
        } catch (Exception e){
            return false;
        }
    }
    
    public boolean authenticateManager(String username, String password){
        try{
            Statement stmt= conn.createStatement();
            String query = "select username from employee where password = '"+password+"' and position='manager'";
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                return true;
            }
            return false;
            
        } catch (Exception e){
            return false;
        }
    }
    
    public Object[] getCustomerDetails(String username){
        Object[] details = new Object[10];
        try{
            Statement stmt = conn.createStatement();
            String query = "select * from customer where username = '" + username+"'";
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                details[0] = rs.getString(2);
                details[1] = rs.getString(3);
                details[2] = rs.getString(4);
                details[3] = rs.getString(5);
                details[4] = rs.getString(6);
                details[5] = rs.getString(7);
                details[6] = rs.getString(8);
                details[7] = rs.getInt(9);
                details[8] = rs.getString(10);
                details[9] = rs.getString(11);
                return details;
            }
        } catch (Exception e){
            return null;
        }
        return null;
    }
    public Object[] getEmployeeDetails(String username){
        Object[] details = new Object[8];
        try{
            Statement stmt = conn.createStatement();
            String query = "select * from employee where username = '" + username+"'";
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                details[0] = rs.getString(2);
                details[1] = rs.getString(3);
                details[2] = rs.getString(4);
                details[3] = rs.getString(5);
                details[4] = rs.getString(6);
                details[5] = rs.getInt(7);
                details[6] = rs.getInt(8);
                details[7] = rs.getString(9);
                return details;
            }
        } catch (Exception e){
            return null;
        }
        return null;
    }
    
    public boolean changePassword(String username, String newPassword){
        
        try{
            Statement stmt = conn.createStatement();
            String query = "update customer set password = '"+newPassword+"' where username = '"+username+"'";
            stmt.executeUpdate(query);
            return true;
        } catch (Exception e){
            
        }
        
        return false;
    }
    
    
    
    
    
    
    
    
    // Queries for customer shopping
    
    // provided the username of the customer
    // shopping in the form {barcode , quantityPurchased}
    // update the tables relevantly.
    public boolean purchaseProducts(String username, ArrayList<Object[]> shopping) {
        // get all required user details
        try {
            
            // first get the product table update done.
            // for each product, update the table.
            int totalPrice = 0;
            int priceOfOne=0;
            int totalQuantityAvailable=0;
            int quantityPurchased=0;
            
            String barcode="";
            
            // Connection for getting product details
            Statement productStmt;
            String productQuery;
            ResultSet productRS;
            
            // Connection for product table update
            int newQuantity;
            Statement updateProduct;
            String productUpdateQuery;
            
            // iterate over each product
            for (int i = 0; i < shopping.size(); i++) {
                barcode = ""+shopping.get(i)[0];
                productStmt = conn.createStatement();
                productQuery = "select * from product where barcode = " + barcode;
                productRS = productStmt.executeQuery(productQuery);
                
                // productRS has details of one product purchased.
                if(!productRS.next())
                    return false;
                priceOfOne = (int) productRS.getInt(4);
                totalQuantityAvailable = (int) productRS.getInt(5);
                totalPrice += priceOfOne * (int)shopping.get(i)[1];
                // here we have total price.
                
                quantityPurchased = (int)shopping.get(i)[1];
                newQuantity = totalQuantityAvailable - quantityPurchased;
                
                updateProduct = conn.createStatement();
                productUpdateQuery = "update product set qty = " + newQuantity + " where barcode = " + barcode;
                updateProduct.executeUpdate(productUpdateQuery);
                
                // we have now updated all records in product table.
            }
            
            // now we need a new unique orderID;
            Statement orderIDStmt = conn.createStatement();
            String OrderIDQuery = "select count(orderID) from pOrder";
            ResultSet orderIDRS = orderIDStmt.executeQuery(OrderIDQuery);
            int orderID=-1;
            if(orderIDRS.next()){
                orderID= orderIDRS.getInt(1) + 1;
            } else{
                return false;
            }
            // we have our new orderID.
            
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yy");
            LocalDate localDate = LocalDate.now();
            String date = dtf.format(localDate);
            
            
            
            // Now we need user details
            Statement userStmt = conn.createStatement();
            String userQuery = "select * from customer where username = '" + username+"'";
            ResultSet userRS = userStmt.executeQuery(userQuery);
            if(!userRS.next())
                return false;
            
            int cID = userRS.getInt(1);
            String state = userRS.getString(7);
            String city = userRS.getString(8);
            int zip = userRS.getInt(9);
            String address = userRS.getString(10);
            
            Statement updatePOrder = conn.createStatement();
            String updatePOrderQuery = "insert into pOrder values ("+orderID+", '"+date+"', "+totalPrice+
            ", "+cID+ ", '"+state+"', '"+city+"', "+zip+", '"+address+"')";
            
            updatePOrder.executeUpdate(updatePOrderQuery);
            
            // update pOrder;*******
            
            // we have orderID 			= orderID
            // we have date				= date
            // we have total			= totalPrice
            // we have cID				= cID
            //							  state5 city6 zip7 address8
            
            
            
            Statement insertOrderHist;
            String insertOrderHistQuery;
            
            
            
            // now, for each product add record in orderHist.
            // orderID is constant				orderID
            // productID(barcode) is 			shopping.get(i)[0].toString()
            // qty (qty of this purchased)		shopping.get(i)[1].toString()
            // price per item					
            for(int i=0; i<shopping.size(); i++){
                barcode = ""+shopping.get(i)[0];
                productStmt = conn.createStatement();
                productQuery = "select * from product where barcode = " + barcode;
                productRS = productStmt.executeQuery(productQuery);
                
                if(!productRS.next())
                    return false;
                // productRS has details of one product purchased.
                priceOfOne = (int) productRS.getInt(4);
                quantityPurchased = (int)shopping.get(i)[1];
                
                insertOrderHist = conn.createStatement();
                insertOrderHistQuery = "insert into orderHist values ("+orderID+", "+barcode+", "+quantityPurchased+", "+priceOfOne+")";
                insertOrderHist.executeUpdate(insertOrderHistQuery);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
    
    public ArrayList<Object[]> getPastOrders(String username) {
        ArrayList<Object[]> pastOrders = new ArrayList<Object[]>();
        try {
            Statement stmt = conn.createStatement();
            String query = "select orderID, pdate, total from pOrder, customer where username='" + username
            + "' and customer.custID=pOrder.cID";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                pastOrders.add(new Object[] { rs.getInt(1), rs.getString(2), rs.getInt(3) });
            }
            return pastOrders;
        } catch (Exception e) {
            
        }
        return null;
    }
    
    
    public ArrayList<Object[]> getorderHistory(int orderID){
        try{
            Statement stmt = conn.createStatement();
            String query = "select orderID, pID, name, category, orderHist.qty, product.price from orderHist, product where orderHist.pID=product.barcode and orderID="+orderID;
            ResultSet rs = stmt.executeQuery(query);
            ArrayList<Object[]> orderHist = new ArrayList<Object[]>();
            while(rs.next()){
                orderHist.add(new Object[]{rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6)});
            }
            return orderHist;
        } catch(Exception e){
            
        }
        return null;
    }
    
    // get all records of all orders made by all customers combined.
    public ArrayList<Object[]> viewAllOrders() {
        ArrayList<Object[]> allOrders = new ArrayList<Object[]>();
        try {
            
            Statement stmt = conn.createStatement();
            String query = "select orderID, pDate, total from pOrder where total>0";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                allOrders.add(new Object[] { rs.getInt(1), rs.getString(2), rs.getInt(3) });
            }
        } catch (Exception e) {
            
        }
        return allOrders;
    }
    
    
    
    
    public ArrayList<Object[]> getStock(){
        ArrayList<Object[]> allStock = new ArrayList<Object[]>();
        try {
            
            Statement stmt = conn.createStatement();
            String query = "select * from product order by category";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                //barcode  | name         | category   | price | qty
                allStock.add(new Object[] { rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)});
            }
        } catch (Exception e) {
            
        }
        return allStock;
    }
    
    
    
    public Object[] getProductDetail(int barcode){
        try{
            Statement stmt = conn.createStatement();
            String query = "select * from product where barcode="+barcode;
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                Object[] productDetails = new Object[]{rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)};
                return productDetails;
            }
        } catch (Exception e){
            
        }
        return null;
    }
    
    
    
    
    // Queries for customer shopping
    
    // provided the username of the customer
    // shopping in the form {barcode , quantityPurchased}
    // update the tables relevantly.
    public boolean reStock(String username, ArrayList<Object[]> shopping) {
        // get all required user details
        try {
            
            // first get the product table update done.
            // for each product, update the table.
            int totalPrice = 0;
            int priceOfOne=0;
            int totalQuantityAvailable=0;
            int quantityPurchased=0;
            
            String barcode="";
            
            // Connection for getting product details
            Statement productStmt;
            String productQuery;
            ResultSet productRS;
            
            // Connection for product table update
            int newQuantity;
            Statement updateProduct;
            String productUpdateQuery;
            
            // iterate over each product
            for (int i = 0; i < shopping.size(); i++) {
                barcode = ""+shopping.get(i)[0];
                productStmt = conn.createStatement();
                productQuery = "select * from product where barcode = " + barcode;
                productRS = productStmt.executeQuery(productQuery);
                
                // productRS has details of one product purchased.
                if(!productRS.next())
                    return false;
                priceOfOne = (int) productRS.getInt(4);
                totalQuantityAvailable = (int) productRS.getInt(5);
                totalPrice += priceOfOne * (int)shopping.get(i)[1];
                // here we have total price.
                
                quantityPurchased = (int)shopping.get(i)[1];
                newQuantity = totalQuantityAvailable - quantityPurchased;
                
                updateProduct = conn.createStatement();
                productUpdateQuery = "update product set qty = " + newQuantity + " where barcode = " + barcode;
                updateProduct.executeUpdate(productUpdateQuery);
                
                // we have now updated all records in product table.
            }
            
            // now we need a new unique orderID;
            Statement orderIDStmt = conn.createStatement();
            String OrderIDQuery = "select count(orderID) from pOrder";
            ResultSet orderIDRS = orderIDStmt.executeQuery(OrderIDQuery);
            int orderID=-1;
            if(orderIDRS.next()){
                orderID= orderIDRS.getInt(1) + 1;
            } else{
                return false;
            }
            // we have our new orderID.
            
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yy");
            LocalDate localDate = LocalDate.now();
            String date = dtf.format(localDate);
            
            
            
            // Now we need user details
            Statement userStmt = conn.createStatement();
            String userQuery = "select * from customer where username = '" + username+"'";
            ResultSet userRS = userStmt.executeQuery(userQuery);
            if(!userRS.next())
                return false;
            
            int cID = userRS.getInt(1);
            String state = userRS.getString(7);
            String city = userRS.getString(8);
            int zip = userRS.getInt(9);
            String address = userRS.getString(10);
            
            Statement updatePOrder = conn.createStatement();
            String updatePOrderQuery = "insert into pOrder values ("+orderID+", '"+date+"', "+totalPrice+
            ", "+cID+ ", '"+state+"', '"+city+"', "+zip+", '"+address+"')";
            
            updatePOrder.executeUpdate(updatePOrderQuery);
            
            // update pOrder;*******
            
            // we have orderID 			= orderID
            // we have date				= date
            // we have total			= totalPrice
            // we have cID				= cID
            //							  state5 city6 zip7 address8
            
            
            
            Statement insertOrderHist;
            String insertOrderHistQuery;
            
            
            
            // now, for each product add record in orderHist.
            // orderID is constant				orderID
            // productID(barcode) is 			shopping.get(i)[0].toString()
            // qty (qty of this purchased)		shopping.get(i)[1].toString()
            // price per item
            for(int i=0; i<shopping.size(); i++){
                barcode = ""+shopping.get(i)[0];
                productStmt = conn.createStatement();
                productQuery = "select * from product where barcode = " + barcode;
                productRS = productStmt.executeQuery(productQuery);
                
                if(!productRS.next())
                    return false;
                // productRS has details of one product purchased.
                priceOfOne = (int) productRS.getInt(4);
                quantityPurchased = (int)shopping.get(i)[1];
                
                insertOrderHist = conn.createStatement();
                insertOrderHistQuery = "insert into orderHist values ("+orderID+", "+barcode+", "+quantityPurchased*(-1)+", "+priceOfOne+")";
                insertOrderHist.executeUpdate(insertOrderHistQuery);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    
    
}














