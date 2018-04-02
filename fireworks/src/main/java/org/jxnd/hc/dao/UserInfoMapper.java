package org.jxnd.hc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.jxnd.hc.bean.UserInfo;

public interface UserInfoMapper {
	
	/**
	 * 查询所有用户信息
	 * @param start 开始数
	 * @param pageSize 每页个数
	 * @return
	 */
	List<UserInfo> findAllUserInfo(@Param("start")Integer start,@Param("pageSize")Integer pageSize);
	
	/**
	 * 查询用户信息
	 * @param id 主键id
	 * @return
	 */
	UserInfo findUserInfo(@Param("id")String id);
	
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
	int addUserInfo(@Param("id")String id,@Param("profession")String profession,@Param("address")String address,
			@Param("worksPop")Integer worksPop,@Param("thumpWork")Integer thumpWork,@Param("hobby")String hobby,
			@Param("qq")String qq,@Param("idiograph")String idiograph,@Param("pro_num")Integer pro_num);
	
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
	int updateUserInfo(@Param("profession")String profession,@Param("address")String address,
			@Param("worksPop")Integer worksPop,@Param("thumpWork")Integer thumpWork,@Param("hobby")String hobby,
			@Param("qq")String qq,@Param("idiograph")String idiograph,@Param("pro_num")Integer pro_num,@Param("id")String id);
	
}
