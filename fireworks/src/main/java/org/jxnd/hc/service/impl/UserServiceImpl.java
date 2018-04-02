package org.jxnd.hc.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.jxnd.hc.bean.User;
import org.jxnd.hc.dao.UserMapper;
import org.jxnd.hc.service.IUserService;
import org.jxnd.hc.util.RandomUtil;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements IUserService {
	
	@Resource
	private UserMapper userMapper;
	
	@Override
	public List<User> findAllUser(Integer start, Integer pageSize) {
		// TODO Auto-generated method stub
		start=(start-1)*pageSize;
		List<User> list=userMapper.findAllUser(start, pageSize);
		for (User user : list) {
			user.setHeadUrl(RandomUtil.baseUrl+user.getHeadUrl());
		}
		return list;
	}

	@Override
	public User findUser(Integer id, String account, String pwd) {
		// TODO Auto-generated method stub
		User user=userMapper.findUser(id, account, pwd);
		if(user != null){
			user.setHeadUrl(RandomUtil.baseUrl+user.getHeadUrl());
		}
		return user;
	}

	@Override
	public int getUserCount() {
		// TODO Auto-generated method stub
		return userMapper.getUserCount();
	}

	@Override
	public int addUser(Integer id, String account, String pwd, String headUrl,
			String phone, String userInfo_id, Timestamp createTime,
			Integer deleteState, Integer isAdmin) {
		// TODO Auto-generated method stub
		return userMapper.addUser(id, account, pwd, headUrl, phone, userInfo_id, createTime, deleteState, isAdmin);
	}

	@Override
	public int updateUser(String account, String pwd, String headUrl,
			String phone, Integer deleteState,Integer id) {
		// TODO Auto-generated method stub
		return userMapper.updateUser(account, pwd, headUrl, phone,deleteState ,id);
	}

}
