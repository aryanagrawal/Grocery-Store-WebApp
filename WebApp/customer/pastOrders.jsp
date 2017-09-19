<html>
    <head>
        <title>Past Orders</title>
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
        <h3>View Past Orders Here</h3>
        
        <jsp:useBean id="user" class="com.database.JDBC"/>
        <%@ page import="java.util.ArrayList" %>
        
        <%
            Object[] userDetails = (Object[]) session.getAttribute("userDetails");
            String username = userDetails[0].toString();
            ArrayList<Object[]> pastOrders = user.getPastOrders(username);
            
            StringBuilder sb = new StringBuilder();
            sb.append("<table>");
            sb.append("<td>Order Number</td><td>Date</td><td>Total Amount</td><td>Description</td>");
            for(Object[] o : pastOrders){
                sb.append("<tr>");
                sb.append("<td>"+o[0]+"</td><td>"+o[1]+"</td><td>"+o[2]+"</td>");
                sb.append("<td><form action=\"pastOrders/viewPurchase.jsp?\">");
                sb.append("<input type=\"hidden\" value="+o[0]+" name=\"view\">");
                sb.append("<input type=\"submit\" value=\"view\"\"></form></td>");
                sb.append("</tr>");
            }
            
            sb.append("</table>");
            
            out.print(sb.toString());
        %>
        
        
    </body>
</html>
