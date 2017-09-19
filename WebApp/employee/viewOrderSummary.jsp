
<html>
    <head>
        <title>Summary Of Order</title>
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
        <h3>Customer Order Summary</h3>
        <%@ page import="java.util.ArrayList" %>
        <jsp:useBean id="user" class="com.database.JDBC"/>
        <%
            int orderID = Integer.parseInt(""+ request.getParameter("view"));
            ArrayList<Object[]> orderHist = user.getorderHistory(orderID);
            
            out.print("Summary for Order ID: " + orderID);
            StringBuilder sb = new StringBuilder();
            
            sb.append("<table><tr>");
            sb.append("<td>Barcode Number</td>");
            sb.append("<td>Name of Product</td>");
            sb.append("<td>Category</td>");
            sb.append("<td>Quantity Purchased</td>");
            sb.append("<td>Price Per Item</td></tr>");
            
            for(int i=0; i<orderHist.size(); i++){
                sb.append("<tr>");
                sb.append("<td>"+orderHist.get(i)[1].toString()+"</td>");
                sb.append("<td>"+orderHist.get(i)[2].toString()+"</td>");
                sb.append("<td>"+orderHist.get(i)[3].toString()+"</td>");
                sb.append("<td>"+orderHist.get(i)[4].toString()+"</td>");
                sb.append("<td>"+orderHist.get(i)[5].toString()+"</td></tr>");
            }
            out.print(sb.toString());
            
            %>
        
    </body>
</html>
