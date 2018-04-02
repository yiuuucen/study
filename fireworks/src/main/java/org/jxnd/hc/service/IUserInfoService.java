package org.jxnd.hc.service;

import java.util.List;

import org.jxnd.hc.bean.UserInfo;

public interface IUserInfoService {
	
	/**
	 * 查询所有用户信息
	 * @param start 开始数
	 * @param pageSize 每页个数
	 * @return
	 */
	List<UserInfo> findAllUserInfo(Integer start,Integer pageSize);
	
	/**
	 * 查询用户信息
	 * @param id 主键id
	 * @return
	 */
	UserInfo findUserInfo(String id);
	
	/**
	 * 查询数量
	 * @return
	 */
	int getUserInfoCount();
	
	/**
	 * 添加用户信息
	 * @param id 主键id
	 * @param profession 职业
	 * @param address 地址
	 * @param worksPop 作品人气
	 * @param thumpWork 作品点赞数
	 * @param hobby 爱好
	 * @param qq qq号
	 * @param idiograph 个人签名
	 * @param pro_num 作品数量
	 * @return
	 */
	int addUserInfo(String id,String profession,String address,Integer worksPop,Integer thumpWork,String hobby,String qq,String idiograph,Integer pro_num);
	
	/**
	 * 更新用户信息
	 * @param profession 职业
	 * @param address 地址
	 * @param worksPop 作品人气
	 * @param thumpWork 作品点赞数
	 * @param hobby 爱好
	 * @param qq qq号
	 * @param idiograph 个人签名
	 * @param pro_num 作品数量
	 * @param id 主键id
	 * @return
	 */
	int updateUserInfo(String profession,String address,Integer worksPop,Integer thumpWork,String hobby,String qq,String idiograph,Integer pro_num,String id);
	
}
