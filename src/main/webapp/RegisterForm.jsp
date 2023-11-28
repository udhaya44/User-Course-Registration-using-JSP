<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Student Register Portal</title>
</head>
<body bgcolor="#9fede9">

<h3 align="right"><a href="ViewForm.jsp">View Students</a></h3>
<h1 align="center">Student Registration Form</h1>
<form method="post">
    <table align="center">
        <tr>
            <td>Enter the Name </td>
            <td><input type="text" name="n"></td>
        </tr>
        <tr>
            <td>Enter the Email ID </td>
            <td><input type="email" name="m"></td>
        </tr>
        <tr>
            <td>Enter the Age </td>
            <td><input type="number" name="age"></td>
        </tr>
        <tr>
            <td>Choose the Gender </td>
            <td>
                <input type="radio" name="gen" value="male">Male
                <input type="radio" name="gen" value="female">Female
                <input type="radio" name="gen" value="Not Preferred">Prefer not to Say
            </td>
        </tr>
        <tr>
            <td>Select the Location </td>
            <td>
                <select name="loc">
                    <option>--select--</option>
                    <option>India</option>
                    <option>Others</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Choose the Courses </td>
            <td>
                <input type="checkbox" name="tech" value="J2EE">Java
                <input type="checkbox" name="tech" value="Angular/React">UI
                <input type="checkbox" name="tech" value="Core Java">Core java
                <input type="checkbox" name="tech" value="Dotnet">C#
                <input type="checkbox" name="tech" value="Selenium">Testing
            </td>
        </tr>
        <tr align="center">
            <td colspan="2">
                <input type="submit" value="Register" name="btn">
                <input type="reset" value="Cancel">
            </td>
        </tr>
    </table>
</form>

<%
    String b = request.getParameter("btn");
    if (b != null && b.equals("Register")) {
        String sname = request.getParameter("n");
        String smail = request.getParameter("m");
        int sage = Integer.parseInt(request.getParameter("age"));
        String sgender = request.getParameter("gen");
        String slocation = request.getParameter("loc");
        String[] res = request.getParameterValues("tech");
        String scourses = "";
        for (String i : res) {
            scourses = scourses + i + " ";
        }
%>

<jsp:useBean id="obj" class="demos.DBCode" />
<h4 align="center">

<%
        int r = obj.insert(sname, smail, sage, sgender, slocation, scourses);
        out.print((r > 0) ? "Registered" : "Not Registered");
    }
%>

</h4>

</body>
</html>
