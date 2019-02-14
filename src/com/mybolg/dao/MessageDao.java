package com.mybolg.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mybolg.bean.Article;
import com.mybolg.bean.Message;
import com.mybolg.utils.DBUtils;

public class MessageDao {
	private DBUtils dbUtils=new DBUtils();
	
	private Message getBean(ResultSet rs) throws SQLException{
		Message message=new Message();
		
		message.setContent(rs.getString("content"));
		message.setCreate_time(rs.getString("create_time"));
		message.setUid(rs.getInt("uid"));
		message.setMid(rs.getInt("mid"));
		
		return message;
	}
	
	/**
	 * 添加消息
	 * @param message
	 * @return
	 */
	public int addMessage(Message message){
		String sql="insert into message(uid,content,create_time) values("
				+message.getUid()+",'"+message.getContent()+"','"
				+message.getCreate_time()+"')";
		try {
			dbUtils.doUpdate(sql);
			return 	1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	/**
	 * 得到用户留言信息
	 * @param uid
	 * @return
	 */
	public ArrayList<Message> getMessagesByUid(int uid){
		ArrayList<Message>  messages=new ArrayList<Message> ();
		String sql="select * from message where uid="+uid;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					messages.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return messages;
	}
	/**
	 * 得到所有的消息
	 * @return
	 */
	public ArrayList<Message> getMessages(){
		ArrayList<Message>  messages=new ArrayList<Message> ();
		String sql="select * from message";
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					messages.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return messages;
	}
}
