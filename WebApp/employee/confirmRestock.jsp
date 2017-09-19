<jsp:useBean id="user" class="com.database.JDBC"/>
<%@ page import="java.util.ArrayList"%>
<%
    int restockby = Integer.parseInt(request.getParameter("restock"));
    int barcode   = Integer.parseInt(request.getParameter("barcode"));

    Object[] userDetails = (Object[]) session.getAttribute("userDetails");
    session.setAttribute("userDetails", userDetails);

    out.print(""+restockby);
    out.print("<br>"+barcode);
    // increase the qty available in products
    // make a new order
    
    ArrayList<Object[]> restock = new ArrayList<Object[]>();
    restock.add(new Object[]{barcode, (restockby*(-1))});
    if(user.reStock(userDetails[0].toString(), restock)){
        response.sendRedirect("restockOrderPlaced.jsp");
    } else{
        response.sendRedirect("restockFailed.jsp");
    }
    
    
%>
