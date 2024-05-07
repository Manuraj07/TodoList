
package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.TodoDetails;

public class TodoDAO {
	
	private Connection con ;
	private PreparedStatement st;

	public TodoDAO(Connection con) {
		super();
		this.con = con;
	}
	
	public List<TodoDetails>getTodo()
	{
		List<TodoDetails> list = new ArrayList<TodoDetails>();
		TodoDetails t = null;
		
		try {
			String sql = "select * from todo_list";
			
			PreparedStatement statement = con.prepareStatement(sql);
			ResultSet res = statement.executeQuery();
			
			while(res.next())
			{
				t = new TodoDetails();
				t.setId(res.getInt(1));
				t.setName(res.getString(2));
				t.setTodo(res.getString(3));
				t.setStatus(res.getString(4));
				list.add(t);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
		
		
		
		
		
		return list;
	}
	public boolean addTodo(String name,String todo,String status) {
		boolean f = false;
		
		try {
			
			String sql = "Insert into todo_list(name,todo,status) values(?,?,?)";
			st = con.prepareStatement(sql);
			st.setString(1, name);
			st.setString(2, todo);
			st.setString(3, status);
			int i = st.executeUpdate();
			
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
		}
		return f;
	}
	
	
	public TodoDetails getTodoById(int id) {
		
		TodoDetails t = null;
		
		try {
			String sql = "select * from todo_list where id=?";
			 PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, id);
			ResultSet res = statement.executeQuery();
			
			while(res.next()) {
				
				t = new TodoDetails();
				t.setId(res.getInt(1));
				t.setName(res.getString(2));
				t.setTodo(res.getString(3));
				t.setStatus(res.getString(4));
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	
	public boolean updateTodo(TodoDetails t) {
		boolean b = false;
		try {
			
			String sql = "update todo_list set name=?,todo=?,status=? where id=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,t.getName());
			ps.setString(2,t.getTodo());
			ps.setString(3,t.getStatus());
			ps.setInt(4, t.getId());
			
			int i = ps.executeUpdate();
			if(i==1) {
				b = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	
	
	public boolean deleteTodo(int id)
	{
		boolean f = false;
		try {
			
			String sql = "delete from todo_list where id = ?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
