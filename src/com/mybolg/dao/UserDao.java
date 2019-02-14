package com.mybolg.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mybolg.bean.User;
import com.mybolg.utils.DBUtils;

public class UserDao {
	private DBUtils dbUtils=new DBUtils();
	
	private User getBean(ResultSet rs) throws SQLException{
		User user=new User();
		
		user.setEmail(rs.getString("email"));
		user.setIntro(rs.getString("intro"));
		user.setPassword(rs.getString("password"));
		user.setPhone(rs.getString("phone"));
		user.setType(rs.getInt("type"));
		user.setUid(rs.getInt("uid"));
		user.setUsername(rs.getString("username"));
		
		return user;
	}
	
	/**
	 * 用户登录
	 * @param username
	 * @param password
	 * @return
	 */
	public User userLogin(String username,String password){
		String sql="select * from user where username='"
				+username+"' and password='"+password+"'";
		User user=null;
		ResultSet rs=dbUtils.doQuery(sql);
		if(rs!=null){
			try {
				while(rs.next()){
					user=getBean(rs);
				}
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return user;
	}
	
	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	public int userRegist(User user){
		String sql="insert into user(username,password,email,phone,intro) values('"
				+user.getUsername()+"','"+user.getPassword()+"','"
				+user.getEmail()+"','"+user.getPhone()+"','"
				+user.getIntro()+"')";
		try {
			dbUtils.doUpdate(sql);
			return 	1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public int updateUser(User user){
		String sql="update user set email='"
				+user.getEmail()+"',phone='"+user.getPhone()+"',intro='"
				+user.getIntro()+"' where uid="+user.getUid();
		try {
			dbUtils.doUpdate(sql);
			return 	1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	
	public User getUserByUid(String uid){
		String sql="select * from user where uid="+uid;
		User user=null;
		ResultSet rs=dbUtils.doQuery(sql);
		if(rs!=null){
			try {
				while(rs.next()){
					user=getBean(rs);
				}
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return user;
	}
}
