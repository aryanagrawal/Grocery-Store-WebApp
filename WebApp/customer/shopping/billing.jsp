<html>
    <head>
        <title>Billing Conformation</title>
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                
            }
        
        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        
        tr: {
            background-color: #dddddd;
        }
        </style>
    </head>
    
    <h3>Billing Page</h3>
    <p>Note: Cash on delivery is the only available option.</p><br>
    <p>Receipt:</p>
    <%@ page import="java.util.ArrayList" %>
    <%
        ArrayList<Object[]> products = (ArrayList<Object[]>) session.getAttribute("products");
        
        Object[] userDetails = (Object[]) session.getAttribute("userDetails");
        session.setAttribute("userDetails", userDetails);
        
        StringBuilder sb = new StringBuilder();
        sb.append("<form action=\"confirmPayment.jsp\"><table>");
        sb.append("<tr bgcolor=\"#B2B853\">");
        sb.append("<td>Item</td><td>Category</td><td>Price per item</td><td>Total</td>");
        sb.append("</tr>");
        
        int price, quantity;
        ArrayList<Object[]> purchased = new ArrayList<Object[]>();
        
        for(int i=0; i<products.size(); i++){
            if(request.getParameter(""+i) != null){
                sb.append("<tr>");
                sb.append("<td>"+products.get(i)[0].toString() + "</td>");
                sb.append("<td>"+products.get(i)[1].toString() + "</td>");
                sb.append("<td>"+products.get(i)[2].toString() + "</td>");
                quantity = Integer.parseInt(request.getParameter("quantity"+i));
                price = Integer.parseInt(products.get(i)[2].toString());
                sb.append("<td>"+(quantity*price) + "</td>");
                sb.append("</tr>");
                purchased.add(new Object[] {products.get(i)[0].toString(), products.get(i)[1].toString(), products.get(i)[2].toString(), (quantity*price), products.get(i)[4]});
            }
        }
        
        session.setAttribute("purchased", purchased);

        sb.append("</table><input type=\"Submit\" value=\"Confirm\"/></form>");
        out.print(sb.toString());
    %>
    
   
</html>
