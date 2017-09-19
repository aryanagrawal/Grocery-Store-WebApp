<html>
    <head>
        <title>Employee Home</title>
    </head>
    
    <body>
    <center>
        <h3>Employee Home</h3>

        <form action="viewProfile.jsp">
            <input type="submit" value="My Profile"/>
        </form>
        
        <form action="viewCustomers.jsp">
            <input type="submit" value="View Customer Record"/>
        </form>
        
        <form action="viewStock.jsp">
            <input type="submit" value="View Stock"/>
        </form>
    </center>
    </body>
    
    <%
        Object[] userDetails = (Object[]) session.getAttribute("userDetails");
        session.setAttribute("userDetails", userDetails);
    %>
</html>


