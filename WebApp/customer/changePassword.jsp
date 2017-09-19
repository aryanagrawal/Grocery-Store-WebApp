<html>
    <head>
        <title>Change Password</title>
    </head>
    
    <body>
        
        <%
            Object[] userDetails = (Object[]) session.getAttribute("userDetails");
            session.setAttribute("userDetails", userDetails);
        %>
        <h3>You are about to change your Password</h3>
        <form action="changePassword/authenticate.jsp">
            <table>
                <tr>
                    <td>Enter Old Password</td>
                    <td><input type="password" name="oldPassword"/></td>
                </tr>
                <tr>
                    <td>Enter New Password</td>
                    <td><input type="password" name="newPassword"/></td>
                </tr>
                <tr>
                    <td>Re-Enter New Password</td>
                    <td><input type="password" name="reNewPassword"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Change Password"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
