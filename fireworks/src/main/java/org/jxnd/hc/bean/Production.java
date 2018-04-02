package org.jxnd.hc.bean;

import java.sql.Timestamp;

/**
 * 作品实体类
 * @author Administrator
 *
 */
public class Production {
	private Integer id;
	private String imgurl;
	private String pro_name;
	private Timestamp createTime;
	private Integer like_num;
	private Integer view_num;
	private Integer user_id;
	private Integer deleteState;
	private String pro_tail;
	private User user;
	public Production() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public Integer getLike_num() {
		return like_num;
	}
	public void setLike_num(Integer like_num) {
		this.like_num = like_num;
	}
	public Integer getView_num() {
		return view_num;
	}
	public void setView_num(Integer view_num) {
		this.view_num = view_num;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getDeleteState() {
		return deleteState;
	}
	public void setDeleteState(Integer deleteState) {
		this.deleteState = deleteState;
	}
	public String getPro_tail() {
		return pro_tail;
	}
	public void setPro_tail(String pro_tail) {
		this.pro_tail = pro_tail;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Production(Integer id, String imgurl, String pro_name,
			Timestamp createTime, Integer like_num, Integer view_num,
			Integer user_id, Integer deleteState, String pro_tail, User user) {
		super();
		this.id = id;
		this.imgurl = imgurl;
		this.pro_name = pro_name;
		this.createTime = createTime;
		this.like_num = like_num;
		this.view_num = view_num;
		this.user_id = user_id;
		this.deleteState = deleteState;
		this.pro_tail = pro_tail;
		this.user = user;
	}
	@Override
	public String toString() {
		return "Production [id=" + id + ", imgurl=" + imgurl + ", pro_name="
				+ pro_name + ", createTime=" + createTime + ", like_num="
				+ like_num + ", view_num=" + view_num + ", user_id=" + user_id
				+ ", deleteState=" + deleteState + ", pro_tail=" + pro_tail
				+ ", user=" + user + "]";
	}
	
	
}
