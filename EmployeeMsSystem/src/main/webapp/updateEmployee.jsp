<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ems.www.dao.*,com.ems.www.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Employee</title>
</head>
<body>
	<% 
	EmployeeDAO dao=new EmployeeDAOImpl();
	if("post".equalsIgnoreCase(request.getMethod())){
		
		long id=Long.parseLong(request.getParameter("id"));
		String name=request.getParameter("Name");
		//String lastName=request.getParameter("lastName");
		String email=request.getParameter("email");
		double salary=Double.parseDouble(request.getParameter("salary"));
		String address = request.getParameter("address");
		
		Employee updatedEmp = new Employee();
        updatedEmp.setId(id);
        updatedEmp.setName(name);
        updatedEmp.setEmail(email);
        updatedEmp.setSalary(salary);
        updatedEmp.setAddress(address);
        dao.updateEmployee(id, updatedEmp);

	%>
	<h3 style="color: green;">Employee updated successfully!</h3>
    <a href="employeeList.jsp">Back to Employee List</a>
    <%}else{ 
    	String empStr=request.getParameter("id");
    	long empId=Long.parseLong(empStr);
    	Employee emp=dao.getEmployeeById(empId);
    
    if(emp==null){
    %>
    <h3 style="color: red;">Employee not found!</h3>
    <%}else{ %>
	 <h2>Update Employee</h2>
	 <form action="updateEmployee.jsp" method="post">
        <input type="hidden" name="id" value="<%=emp.getId()%>" />

        <label>Name:</label><br/>
        <input type="text" name="name" value="<%=emp.getName()%>" required/><br/><br/>

        <label>Email:</label><br/>
        <input type="email" name="email" value="<%=emp.getEmail()%>" required/><br/><br/>

        <label>Salary:</label><br/>
        <input type="number" step="0.01" name="salary" value="<%=emp.getSalary()%>" required/><br/><br/>

        <label>Address:</label><br/>
        <textarea name="address" required><%=emp.getAddress()%></textarea><br/><br/>

        <input type="submit" value="Update"/>
    </form>
    <%}
    }%>
</body>
</html>