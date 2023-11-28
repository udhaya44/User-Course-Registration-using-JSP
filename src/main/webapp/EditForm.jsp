<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="demos.Student" %>
<jsp:useBean id="obj" class="demos.DBCode"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Student Details</title>
</head>
<body bgcolor="#9fede9">

<%
    int sid = Integer.parseInt(request.getParameter("sid"));
    Student student = obj.selectSingle(sid);
%>

<h1 align="center">Edit Student Details</h1>
<form method="post">
    <table align="center">
        <tr>
            <td>Enter the Name</td>
            <td><input type="text" name="n" value="<%=student.getSname()%>"></td>
        </tr>
        <tr>
            <td>Enter the Email ID</td>
            <td><input type="email" name="m" value="<%=student.getSmail()%>"></td>
        </tr>
        <tr>
            <td>Enter the Age</td>
            <td><input type="number" name="age" value="<%=student.getSage()%>"></td>
        </tr>
        <tr>
            <td>Choose the Gender</td>
            <td>
                <input type="radio" name="gen" value="male" <%= student.getSgender().equals("male") ? "checked" : "" %>>Male
                <input type="radio" name="gen" value="female" <%= student.getSgender().equals("female") ? "checked" : "" %>>Female
                <input type="radio" name="gen" value="Not Preferred" <%= student.getSgender().equals("Not Preferred") ? "checked" : "" %>>Prefer not to Say
            </td>
        </tr>
        <tr>
            <td>Select the Location</td>
            <td>
                <select name="loc">
                    <option value="India" <%= student.getSlocation().equals("India") ? "selected" : "" %>>India</option>
                    <option value="Others" <%= student.getSlocation().equals("Others") ? "selected" : "" %>>Others</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Choose the Courses</td>
            <td>
                <input type="checkbox" name="tech" value="J2EE" <%= student.getScourses().contains("J2EE") ? "checked" : "" %>>Java
                <input type="checkbox" name="tech" value="Angular/React" <%= student.getScourses().contains("Angular/React") ? "checked" : "" %>>UI
                <input type="checkbox" name="tech" value="Dotnet" <%= student.getScourses().contains("Dotnet") ? "checked" : "" %>>C#
                <input type="checkbox" name="tech" value="Dotnet" <%= student.getScourses().contains("Core Java") ? "checked" : "" %>>Core java
                <input type="checkbox" name="tech" value="Selenium" <%= student.getScourses().contains("Selenium") ? "checked" : "" %>>Testing
            </td>
        </tr>
        <tr>
            <td>Enter Branch</td>
            <td><input type="text" name="branch" value="<%=student.getBranch()%>"></td>
        </tr>
        <tr align="center">
            <td colspan="2">
                <input type="submit" value="Update" name="btn">
            </td>
        </tr>
    </table>
</form>

<%
    if(request.getParameter("btn") != null && request.getParameter("btn").equals("Update")) {
        student.setSname(request.getParameter("n"));
        student.setSmail(request.getParameter("m"));
        student.setSage(Integer.parseInt(request.getParameter("age")));
        student.setSgender(request.getParameter("gen"));
        student.setSlocation(request.getParameter("loc"));
        String[] courses = request.getParameterValues("tech");
        StringBuilder courseStr = new StringBuilder();
        for (String course : courses) {
            courseStr.append(course).append(" ");
        }
        student.setScourses(courseStr.toString().trim());
        student.setBranch(request.getParameter("branch"));

        int result = obj.update(student);
        out.print(result > 0 ? "Updated Successfully" : "Update Failed");
    }
%>

</body>
</html>
