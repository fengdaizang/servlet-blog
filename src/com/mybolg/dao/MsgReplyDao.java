package com.mybolg.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mybolg.bean.Article;
import com.mybolg.bean.Message;
import com.mybolg.bean.MsgReply;
import com.mybolg.utils.DBUtils;

public class MsgReplyDao {
	private DBUtils dbUtils=new DBUtils();
	
	private MsgReply getBean(ResultSet rs) throws SQLException{
		MsgReply msgReply=new MsgReply();
		
		msgReply.setContent(rs.getString("content"));
		msgReply.setCreate_time(rs.getString("create_time"));
		msgReply.setMrid(rs.getInt("mrid"));
		msgReply.setMid(rs.getInt("mid"));
		
		return msgReply;
	}
	
	/**
	 * 添加回复
	 * @param msgReply
	 * @return
	 */
	public int addMsgReply(MsgReply msgReply){
		String sql="insert into msgreply(mid,content,create_time) values("
				+msgReply.getMid()+",'"+msgReply.getContent()+"','"
				+msgReply.getCreate_time()+"')";
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
	public MsgReply getMsgReplyByMid(int mid){
		MsgReply  msgReply=null;
		String sql="select * from msgreply where mid="+mid;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					msgReply=getBean(rSet);
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return msgReply;
	}
}
