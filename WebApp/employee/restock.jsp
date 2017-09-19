<html>
    <head>
        <title>Re-Stock Form</title>
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
        <jsp:useBean id="user" class="com.database.JDBC"/>
        <h3>Restock Product</h3>
        <%
            Object[] userDetails = (Object[]) session.getAttribute("userDetails");
            session.setAttribute("userDetails", userDetails);
            
            int barcode = Integer.parseInt(request.getParameter("restock"));
            Object[] productDetails = user.getProductDetail(barcode);
        
            StringBuilder sb = new StringBuilder();
            sb.append("<form action=\"confirmRestock.jsp\"><table>");
            sb.append("<tr><td>Barcode</td><td>"+barcode+"</td></tr>");
            sb.append("<tr><td>Name</td><td>"+productDetails[0]+"</td></tr>");
            sb.append("<tr><td>Category</td><td>"+productDetails[1]+"</td></tr>");
            sb.append("<tr><td>Price Per Item</td><td>"+productDetails[2]+"</td></tr>");
            sb.append("<tr><td>Quantity Available</td><td>"+productDetails[3]+"</td></tr>");
            sb.append("<tr><td>Restock By</td>");
            sb.append("<td>");
            sb.append("<input type=\"number\" name=\"restock\">");
            sb.append("<input type=\"hidden\" value="+barcode+" name=\"barcode\"></td></tr>");
            sb.append("<tr><td></td><td><input type=\"submit\" value=\"Process ReStock\"></td></tr></table></form>");
            out.print(sb.toString());
        %>
    </body>
</html>
