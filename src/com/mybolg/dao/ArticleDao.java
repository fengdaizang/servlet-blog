package com.mybolg.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mybolg.bean.Article;
import com.mybolg.bean.Message;
import com.mybolg.utils.DBUtils;

public class ArticleDao {
	
	private DBUtils dbUtils=new DBUtils();
	
	private Article getBean(ResultSet rs) throws SQLException{
		Article article=new Article();
		
		article.setAid(rs.getInt("aid"));
		article.setContent(rs.getString("content"));
		article.setCreate_time(rs.getString("create_time"));
		article.setIntro(rs.getString("intro"));
		article.setTitle(rs.getString("title"));
		
		return article;
	}
	/**
	 * 得到所有的文章信息
	 * @return
	 */
	public ArrayList<Article> getArticles(){
		ArrayList<Article>  articles=new ArrayList<Article> ();
		String sql="select * from article";
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					articles.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return articles;
	}
	/**
	 * 通过id得到文章信息
	 * @param aid
	 * @return
	 */
	public Article getArticleByAid(String aid){
		Article  article=new Article();
		String sql="select * from article where aid="+aid;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					article=getBean(rSet);
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return article;
	}
	/**
	 * 发表文章
	 * @param article
	 * @return
	 */
	public int addArticle(Article article){
		String sql="insert into article(title,content,intro,create_time) values('"
				+article.getTitle()+"','"+article.getContent()+"','"
				+article.getIntro()+"','"+article.getCreate_time()+"')";
		try {
			dbUtils.doUpdate(sql);
			return 	1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	/**
	 * 更新文章
	 * @param article
	 * @return
	 */
	public int updateArticle(Article article){
		String sql="update article set title='"+article.getTitle()
				+"',content='"+article.getContent()
				+"',intro='"+article.getIntro()
				+"',create_time='"+article.getCreate_time()
				+"' where aid="+article.getAid();
		try {
			dbUtils.doUpdate(sql);
			return 	1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	/**
	 * 删除文章
	 * @param aid
	 * @return
	 */
	public int deleteArticle(int aid){
		String sql="delete from article where aid="+aid;
		try {
			dbUtils.doUpdate(sql);
			return 	1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
}
