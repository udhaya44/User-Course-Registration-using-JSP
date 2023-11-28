<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Stack" %>
<%@ page import="demos.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Student Entries</title>
</head>
<body bgcolor="#9fede9">
<h3><a href="RegisterForm.jsp">Register Student</a></h3>
<jsp:useBean id="obj" class="demos.DBCode"/>
<%
    Stack<Student> st=obj.select();
    String b=request.getParameter("name");
    if(b != null && b.equals("del")) {
        int id = Integer.parseInt(request.getParameter("id"));
        obj.delete(id);            
    }
%>
<h1 align="center">Registered Student Details</h1>
<table align="center" border="1" rules="all">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>EMAIL</th>
        <th>AGE</th>
        <th>GENDER</th>
        <th>LOCATION</th>
        <th>COURSES</th>
        <th>BRANCH</th>
        <th colspan="2">OPERATIONS</th>
    </tr>
    <%
        for(Student i : st) {
    %>
    <tr>
        <td align="center"><%=i.getSid() %></td>
        <td align="center"><%=i.getSname() %></td>
        <td><%=i.getSmail() %></td>
        <td align="center"><%=i.getSage() %></td>
        <td><%=i.getSgender() %></td>
        <td><%=i.getSlocation() %></td>
        <td><%=i.getScourses() %></td>
        <td><%=i.getBranch() %></td>
        <td><a href="EditForm.jsp?sid=<%=i.getSid()%>">Edit</a></td>
        <td><a href="ViewForm.jsp?name=del&id=<%=i.getSid()%>">Remove</a></td>
    </tr>
    <%        
        }
    %>
</table>
</body>
</html>
