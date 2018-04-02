package org.jxnd.hc.bean;

import java.sql.Timestamp;

/**
 * 用户实体类
 * @author Administrator
 *
 */
public class User {
	private Integer id;
	private String account;
	private String pwd;
	private String headUrl;
	private String phone;
	private String userInfo_id;
	private Timestamp createTime;
	private Integer deleteState;
	private Integer isAdmin;
	private UserInfo userInfo;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(Integer id, String account, String pwd, String headUrl,
			String phone, String userInfo_id, Timestamp createTime,
			Integer deleteState, Integer isAdmin, UserInfo userInfo) {
		super();
		this.id = id;
		this.account = account;
		this.pwd = pwd;
		this.headUrl = headUrl;
		this.phone = phone;
		this.userInfo_id = userInfo_id;
		this.createTime = createTime;
		this.deleteState = deleteState;
		this.isAdmin = isAdmin;
		this.userInfo = userInfo;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getHeadUrl() {
		return headUrl;
	}
	public void setHeadUrl(String headUrl) {
		this.headUrl = headUrl;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserInfo_id() {
		return userInfo_id;
	}
	public void setUserInfo_id(String userInfo_id) {
		this.userInfo_id = userInfo_id;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public Integer getDeleteState() {
		return deleteState;
	}
	public void setDeleteState(Integer deleteState) {
		this.deleteState = deleteState;
	}
	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	
	public Integer getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(Integer isAdmin) {
		this.isAdmin = isAdmin;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", account=" + account + ", pwd=" + pwd
				+ ", headUrl=" + headUrl + ", phone=" + phone
				+ ", userInfo_id=" + userInfo_id + ", createTime=" + createTime
				+ ", deleteState=" + deleteState + ", isAdmin=" + isAdmin
				+ ", userInfo=" + userInfo + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	
}
