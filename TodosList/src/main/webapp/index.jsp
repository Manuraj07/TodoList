<%@page import="com.entity.TodoDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.TodoDAO"%>
<%@page import="javax.crypto.SealedObject"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP file index.</title>
    <%@include file="AllComponent/allCss.jsp" %>
</head>
<body>
    <%@include file="AllComponent/navbar.jsp" %>
    
    <% Connection con = DBconnect.getConnetion(); %>

    <h1 class="text-center text-success">TODO-APP</h1>

    <% 
    String successMsg = (String)session.getAttribute("successMsg");

    if(successMsg != null) {
    %>
    <div class="alert alert-success" role="alert">
        <%= successMsg %>
    </div>
    <% 
    session.removeAttribute("successMsg");
    }
    %>

    <% 
    String failedMsg = (String)session.getAttribute("failedMsg");

    if(failedMsg != null) {
    %>
    <div class="alert alert-danger" role="alert">
        <%= failedMsg %>
    </div>
    <% 
    session.removeAttribute("failedMsg");
    }
    %>

    <div class="container">
        <table class="table table-striped" border="1px">
            <thead class="bg-success text-white">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Todo</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                TodoDAO dao = new TodoDAO(DBconnect.getConnetion());
                List<TodoDetails> todo = dao.getTodo();
                for(TodoDetails t : todo) {
                %>
                <tr>
                    <th scope="row"><%= t.getId() %></th>
                    <td><%= t.getName() %></td>
                    <td><%= t.getTodo() %></td>
                    <td><%= t.getStatus() %></td>
                    <td>
                        <a href="edit.jsp?id=<%=t.getId() %>" class="btn btn-sm btn-success">Edit</a>
                        <a href="delete?id=<%=t.getId() %>" class="btn btn-sm btn-danger">Delete</a>
                        
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</body>
</html>
