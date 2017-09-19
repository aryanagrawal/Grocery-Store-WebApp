<html>
    <head>
        <title>Shopping Page</title>
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }
        
        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        
        tr:nth-child(even) {
            background-color: #dddddd;
        }
        </style>
    </head>
    
    <body>
        
        <h3>Shopping</h3>
        <p>Check all the items you wish to buy<br>
        
        <jsp:useBean id="user" class="com.database.JDBC"/>
        <%@ page import="java.util.ArrayList" %>
        <%
            Object[] userDetails = (Object[])session.getAttribute("userDetails");
            session.setAttribute("userDetails", userDetails);
            
            ArrayList<Object[]> products = new ArrayList<Object[]>();
            products = user.getListOfProducts();
            int numOfProducts = products.size();
            
            session.setAttribute("products", products);
            //out.print(user.getListOfProductstoString(products));
            StringBuilder sb = new StringBuilder();
            sb.append("<form action=\"shopping/billing.jsp\"><table>");
            sb.append("<tr>");
            sb.append("<td>Check</td><td>Quantity</td><td>Item</td><td>Category</td><td>Price per item</td><td>Available in Store</td>");
            sb.append("</tr>");
            for(int i=0; i<products.size(); i++){
                sb.append("<tr>");
                sb.append("<td><input type=\"checkbox\" name=\""+i+"\"></td>");
                sb.append("<td><input type=\"number\" name=\"quantity"+i+"\" min=\"0\" max=\""+
                          products.get(i)[3]+"\"></td>");
                          sb.append("<td>"+products.get(i)[0].toString() + "</td>");
                          sb.append("<td>"+products.get(i)[1].toString() + "</td>");
                          sb.append("<td>"+products.get(i)[2].toString() + "</td>");
                          sb.append("<td>"+products.get(i)[3].toString() + "</td>");
                          sb.append("</tr>");
            }
            sb.append("<tr><td><input type=\"submit\" value=\"Check Out\"></td></tr>");
            sb.append("</table></form>");
            
            
            out.print(sb.toString());
            %>
        
    </body>
    
    
</html>
