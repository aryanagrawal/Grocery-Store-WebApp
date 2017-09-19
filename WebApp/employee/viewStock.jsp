<html>
    <head>
        <title>Stock Summary</title>
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 60%;
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
        <h3>Current Stock Summary</h3>

        <%@ page import="java.util.ArrayList"%>
        <jsp:useBean id="user" class="com.database.JDBC"/>
        
        <%
            Object[] userDetails = (Object[]) session.getAttribute("userDetails");
            session.setAttribute("userDetails", userDetails);
            
            ArrayList<Object[]> allStock = user.getStock();
            StringBuilder sb = new StringBuilder();
            
            sb.append("<table>");
            sb.append("<tr><td>Barcode</td><td>Name</td><td>Category</td><td>Price Per Item</td><td>Quantity Available</td><td>Re-Stock</td></tr>");
            
            for(Object[] o : allStock){
                sb.append("<tr>");
                sb.append("<td>"+o[0]+"</td>");
                sb.append("<td>"+o[1]+"</td>");
                sb.append("<td>"+o[2]+"</td>");
                sb.append("<td>"+o[3]+"</td>");
                sb.append("<td>"+o[4]+"</td>");
                
                sb.append("<td><form action=\"restock.jsp\">");
                sb.append("<input type=\"hidden\" name=\"restock\" value="+o[0]+">");
                sb.append("<input type=\"submit\" value=\"Re-Stock\"/>");
                sb.append("</form></td>");
            }
            sb.append("</tr></table>");
            out.print(sb.toString());

        %>
        
    </body>
</html>
