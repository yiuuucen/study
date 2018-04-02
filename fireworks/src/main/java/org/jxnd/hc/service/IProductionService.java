package org.jxnd.hc.service;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.jxnd.hc.bean.Production;

public interface IProductionService {
	
	/**
	 * 查询所有作品
	 * @param user_id 用户id
	 * @param deleteState 删除状态
	 * @param byThis 排序字段
	 * @param start 开始数
	 * @param pageSize 每页个数
	 * @return
	 */
	List<Production> findAllProduction(Integer user_id,Integer deleteState,String byThis,Integer start,Integer pageSize);
	
	/**
	 * 取得单个作品
	 * @param id 主键id
	 * @return
	 */
	Production findProduction(Integer id);
	
	/**
	 * 查询作品数量
	 * @param user_id 用户id
	 * @return
	 */
	int getProductionCount(Integer user_id);
	
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
	int addProduction(Integer id,String imgurl,String pro_name,Timestamp createTime,Integer like_num,Integer view_num,Integer user_id,Integer deleteState,String pro_tail);
	
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
	int updateProduction(String imgurl,String pro_name,Integer like_num,Integer view_num,Integer deleteState,String pro_tail,Integer id);
}
