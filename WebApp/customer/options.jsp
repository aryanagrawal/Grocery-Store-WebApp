<html>
    <head>
        <title>Customer Home Page</title>
        
        <style>
            .div{
                float="left";
            }
            
        </style>
    </head>
    <body>
        <%
            
            Object[] userDetails = (Object[])session.getAttribute("userDetails");
            session.setAttribute("userDetails", userDetails);
            out.print("<h6>Welcome "+userDetails[3]+", This is your home page</h6><br>");
        %>
        
        <div><center>
        <form action="pastOrders.jsp">
            <input type="submit" value="View Past Orders"/><br>
        </form>
        
        <form action="shopping.jsp">
            <input type="submit" value="Shop Now"/><br>
        </form>
        
        <form action="changePassword.jsp">
            <input type="submit" value="Change Password"/><br>
        </form>
        </center>
        </div>
    
    </body>
</html>
