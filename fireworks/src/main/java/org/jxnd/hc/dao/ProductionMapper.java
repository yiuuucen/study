package org.jxnd.hc.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.jxnd.hc.bean.Production;

public interface ProductionMapper {
	
	/**
	 * 查询所有作品
	 * @param user_id 用户id
	 * @param deleteState 删除状态
	 * @param byThis 排序字段
	 * @param start 开始数
	 * @param pageSize 每页个数
	 * @return
	 */
	List<Production> findAllProduction(@Param("user_id")Integer user_id,@Param("deleteState")Integer deleteState,
			@Param("byThis")String byThis,@Param("start")Integer start,@Param("pageSize")Integer pageSize);
	
	/**
	 * 取得单个作品
	 * @param id 主键id
	 * @return
	 */
	Production findProduction(@Param("id")Integer id);
	
	/**
	 * 查询作品数量
	 * @param user_id 用户id
	 * @return
	 */
	int getProductionCount(@Param("user_id")Integer user_id);
	
	/**
	 * 添加作品
	 * @param id 主键id
	 * @param imgurl 图片地址
	 * @param pro_name 作品名称
	 * @param createTime 创建时间
	 * @param like_num 点赞数
	 * @param view_num 浏览数
	 * @param user_id 用户id
	 * @param deleteState 删除状态
	 * @return
	 */
	int addProduction(@Param("id")Integer id,@Param("imgurl")String imgurl,@Param("pro_name")String pro_name,@Param("createTime")Timestamp createTime,
			@Param("like_num")Integer like_num,@Param("view_num")Integer view_num,@Param("user_id")Integer user_id,@Param("deleteState")Integer deleteState,@Param("pro_tail")String pro_tail);
	
	/**
	 * 更新用户
	 * @param imgurl 图片地址
	 * @param pro_name 作品名称
	 * @param like_num 点赞数
	 * @param view_num 浏览数
	 * @param deleteState 删除状态
	 * @param id 主键id
	 * @return
	 */
	int updateProduction(@Param("imgurl")String imgurl,@Param("pro_name")String pro_name,@Param("like_num")Integer like_num,
			@Param("view_num")Integer view_num,@Param("deleteState")Integer deleteState,@Param("pro_tail")String pro_tail,@Param("id")Integer id);
	
}
