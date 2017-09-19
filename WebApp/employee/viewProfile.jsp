<html>
    <head>
        <title>My Profile</title>
    </head>
    
    <body>
        <h3>Employee Profile</h3><br>
        <%
            Object[] userDetails = (Object[]) session.getAttribute("userDetails");
            StringBuilder sb = new StringBuilder();
            sb.append("<table>");
            sb.append("<tr>");
            sb.append("<td>Name:</td><td>"+userDetails[3].toString() + " " + userDetails[2] + "</td>");
            sb.append("</tr>");
            
            sb.append("<tr>");
            sb.append("<td>Sex:</td><td>"+userDetails[4].toString() + "</td>");
            sb.append("</tr>");
            
            sb.append("<tr>");
            sb.append("<td>Salary:</td><td>"+userDetails[5].toString() + "</td>");
            sb.append("</tr>");
            
            sb.append("<tr>");
            sb.append("<td>Position:</td><td>"+userDetails[7].toString() + "</td>");
            sb.append("</tr>");
            sb.append("</table>");
            out.print(sb.toString());
        %>
    </body>
</html>
