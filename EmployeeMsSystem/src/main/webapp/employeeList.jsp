<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.ems.www.dao.*,com.ems.www.model.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table,td,th{
border: 1px solid black;
border-collapse: collapse;
padding:8px
}</style>
</head>
<body>
	<%
	EmployeeDAO dao = new EmployeeDAOImpl();
	List<Employee> employees = dao.getEmployeeList();
	%>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>EMAIL</th>
				<th>SALARY</th>
				<th>ADDRESS</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<%if(employees!=null && !employees.isEmpty()){
			for(Employee emp:employees){
				%>
			<tr>
				<td><%=emp.getId()%></td>
				<td><%=emp.getName()%></td>
				<td><%=emp.getEmail()%></td>
				<td><%=emp.getSalary()%></td>
				<td><%=emp.getAddress()%></td>

				<td><a href="updateEmployee.jsp?id=<%=emp.getId()%>"
					style="padding: 6px 12px; background-color: lightblue; color: black; text-decoration: none; border: 1px solid gray; border-radius: 4px;">Edit</a>
					<a href="deleteEmployee.jsp?id=<%=emp.getId()%>"
					onclick="return confirm('Are you sure?');"
					style="padding: 6px 12px; background-color: tomato; color: white; text-decoration: none; border: 1px solid gray; border-radius: 4px;">Delete</a>
				</td>
			</tr>
			<% }
			}else{%>
			<tr>
			<td colspan="6">No Records..</tr>
		</tbody>
		<%} %>

	</table>
</body>
</html>