package org.jxnd.hc.bean;

/**
 * 用户信息实体类
 * @author Administrator
 *
 */
public class UserInfo {
	private String id;
	private String profession;
	private String address;
	private Integer worksPop;
	private Integer thumpWork;
	private String hobby;
	private String qq;
	private String idiograph;
	private Integer pro_num;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getWorksPop() {
		return worksPop;
	}
	public void setWorksPop(Integer worksPop) {
		this.worksPop = worksPop;
	}
	public Integer getThumpWork() {
		return thumpWork;
	}
	public void setThumpWork(Integer thumpWork) {
		this.thumpWork = thumpWork;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getIdiograph() {
		return idiograph;
	}
	public void setIdiograph(String idiograph) {
		this.idiograph = idiograph;
	}
	public Integer getPro_num() {
		return pro_num;
	}
	public void setPro_num(Integer pro_num) {
		this.pro_num = pro_num;
	}
	
	public UserInfo(String id, String profession, String address,
			Integer worksPop, Integer thumpWork, String hobby, String qq,
			String idiograph, Integer pro_num) {
		super();
		this.id = id;
		this.profession = profession;
		this.address = address;
		this.worksPop = worksPop;
		this.thumpWork = thumpWork;
		this.hobby = hobby;
		this.qq = qq;
		this.idiograph = idiograph;
		this.pro_num = pro_num;
	}
	public UserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", profession=" + profession
				+ ", address=" + address + ", worksPop=" + worksPop
				+ ", thumpWork=" + thumpWork + ", hobby=" + hobby + ", qq="
				+ qq + ", idiograph=" + idiograph + ", pro_num=" + pro_num
				+ "]";
	}
	
}
