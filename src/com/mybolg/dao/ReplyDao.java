package com.mybolg.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mybolg.bean.Reply;
import com.mybolg.utils.DBUtils;

public class ReplyDao {
	private DBUtils dbUtils=new DBUtils();
	
	private Reply getBean(ResultSet rs) throws SQLException{
		Reply reply=new Reply();
		reply.setAid(rs.getInt("aid"));
		reply.setContent(rs.getString("content"));
		reply.setCreate_time(rs.getString("create_time"));
		reply.setRid(rs.getInt("rid"));
		reply.setUid(rs.getInt("uid"));
		
		return reply;
	}
	/**
	 * 查找文章的评论
	 * @param aid
	 * @return
	 */
	public ArrayList<Reply> getReplysByAid(String aid){
		ArrayList<Reply>  replys=new ArrayList<Reply> ();
		String sql="select * from reply where aid="+aid;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					replys.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return replys;
	}
	/**
	 * 添加评论
	 * @param reply
	 * @return
	 */
	public int addReply(Reply reply){
		String sql="insert into reply(aid,uid,content,create_time) values("
				+reply.getAid()+","+reply.getUid()+",'"
				+reply.getContent()+"','"+reply.getCreate_time()+"')";
		try {
			dbUtils.doUpdate(sql);
			return 	1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
}
