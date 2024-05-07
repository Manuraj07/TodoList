<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.TodoDAO"%>
<%@page import="com.entity.TodoDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="AllComponent/allCss.jsp" %>
</head>
<body>
    <%@ include file="AllComponent/navbar.jsp" %>
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h3 class="text-center">Add Todo</h3>
                
                <% 
                int id = Integer.parseInt(request.getParameter("id"));
                TodoDAO dao = new TodoDAO(DBconnect.getConnetion());
                TodoDetails t = dao.getTodoById(id);
                %>
                <form action="update1?id=<%= id %>" method="post">
                
                
                <input type="hidden" value="<%= t.getId()%>">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Name</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="username" value="<%= t.getName()%>">
                    </div>
                    
                    <div class="form-group">
                        <label for="exampleInputEmail1">TODO</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="todo" value="<%= t.getTodo()%>">
                    </div>
                    
                    <div class="form-group">
                        <label for="inputState">Status</label>
                        <select id="inputState" class="form-control" name="status">
                        <%
                        if("pending".equals(t.getStatus())) {
                        %>
                        	
                        <option value="pending">Pending</option>
                        <option value="complete">Complete</option>
                        	
                        <% } else { %>
                       
                        <option value="complete">Complete</option>
                        <option value="pending">Pending</option>
                       
                        <% } %>
                        </select>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
