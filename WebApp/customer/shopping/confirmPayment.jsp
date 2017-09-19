
<title>Processing...</title>

<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="user" class="com.database.JDBC"/>
<%
    
    // Get User Details
    Object[] userDetails = (Object[]) session.getAttribute("userDetails");
    
    // Get shopping done by the user
    ArrayList<Object[]> shopping = (ArrayList<Object[]>) session.getAttribute("purchased");

    String username = userDetails[0].toString();
    
                // barcode      quantityPurchased
    ArrayList<Object[]> productsPurchased = new ArrayList<Object[]>();
    
    int barcode, quantityPurchased, totalPrice, priceOfOne;
    for(int i=0; i<shopping.size(); i++){
        barcode = Integer.parseInt(""+shopping.get(i)[4]);
        totalPrice = Integer.parseInt(""+shopping.get(i)[3]);
        priceOfOne = Integer.parseInt(""+shopping.get(i)[2]);
        quantityPurchased = totalPrice/priceOfOne;
        productsPurchased.add(new Object[] {barcode, quantityPurchased});
    }
    
    if(user.purchaseProducts(username, productsPurchased))
        response.sendRedirect("success.jsp");
    else{
        out.print("Something Went Wrong");
        }
    
    //1. update Product Changes
    
    //2. Update pOrderChanges
    
    //3. Update Order History
 
%>
