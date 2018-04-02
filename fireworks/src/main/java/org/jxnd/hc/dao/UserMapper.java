package org.jxnd.hc.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.jxnd.hc.bean.User;

public interface UserMapper {
	
	/**
	 * 查询所有用户
	 * @param start 开始数
	 * @param pageSize 每页个数
	 * @return
	 */
	List<User> findAllUser(@Param("start")Integer start,@Param("pageSize")Integer pageSize);
	
	/**
	 * 查询用户
	 * @param id 主键id
	 * @param account 账号
	 * @param pwd 密码
	 * @return
	 */
	User findUser(@Param("id")Integer id,@Param("account")String account,@Param("pwd")String pwd);
	
	/**
	 * 取得用户数量
	 * @return
	 */
	int getUserCount();
	
	/**
	 * 添加用户
	 * @param id 主键id
	 * @param account 账号
	 * @param pwd 密码
	 * @param headUrl 用户头像
	 * @param phone 电话
	 * @param userInfo_id 信息id
	 * @param createTime 创建时间
	 * @param deleteState 删除状态
	 * @param isAdmin 是否管理员
	 * @return
	 */
	int addUser(@Param("id")Integer id,@Param("account")String account,@Param("pwd")String pwd,@Param("headUrl")String headUrl,
			@Param("phone")String phone,@Param("userInfo_id")String userInfo_id,@Param("createTime")Timestamp createTime,
			@Param("deleteState")Integer deleteState,@Param("isAdmin")Integer isAdmin);
	
	/**
	 * 更新用户
	 * @param account 账号
	 * @param pwd 密码
	 * @param headUrl 头像地址
	 * @param phone 电话
	 * @param id 主键id
	 * @return
	 */
	int updateUser(@Param("account")String account,@Param("pwd")String pwd,@Param("headUrl")String headUrl,
			@Param("phone")String phone,@Param("deleteState")Integer deleteState,@Param("id")Integer id);
	
}
