<html>
    <head>
        <title>Customer Shopping Record</title>
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
        <h3>Customer Shopping Record</h3>
        <%@ page import="java.util.ArrayList"%>
        <jsp:useBean id="user" class="com.database.JDBC"/>
        
        <%
            ArrayList<Object[]> allOrders = user.viewAllOrders();
            StringBuilder sb = new StringBuilder();
            sb.append("<table>");
            sb.append("<tr>");
            sb.append("<td>Order ID</td><td>Date</td><td>Total $</td><td>View Summary</td>");
            sb.append("</tr>");
            
            for(Object[] record : allOrders){
                    sb.append("<tr>");
                    sb.append("<td>"+record[0]+"</td><td>"+record[1]+"</td><td>"+record[2]+"</td>");
                    sb.append("<td><form action=\"viewOrderSummary.jsp\">");
                    sb.append("<input type=\"hidden\" name=\"view\" value="+record[0]+">");
                    sb.append("<input type=\"submit\" value=\"View Summary\"/>");
                    sb.append("</form></td>");
                    sb.append("</tr>");
                
            }
            sb.append("</table>");
            out.print(sb.toString());
        %>
    </body>
</html>
