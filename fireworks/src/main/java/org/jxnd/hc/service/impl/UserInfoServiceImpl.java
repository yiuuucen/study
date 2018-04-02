package org.jxnd.hc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.jxnd.hc.bean.UserInfo;
import org.jxnd.hc.dao.UserInfoMapper;
import org.jxnd.hc.service.IUserInfoService;
import org.springframework.stereotype.Service;

@Service
public class UserInfoServiceImpl implements IUserInfoService{
	
	@Resource
	private UserInfoMapper userInfoMapper;
	
	@Override
	public List<UserInfo> findAllUserInfo(Integer start, Integer pageSize) {
		// TODO Auto-generated method stub
		start=(start-1)*pageSize;
		return userInfoMapper.findAllUserInfo(start, pageSize);
	}

	@Override
	public UserInfo findUserInfo(String id) {
		// TODO Auto-generated method stub
		return userInfoMapper.findUserInfo(id);
	}

	@Override
	public int getUserInfoCount() {
		// TODO Auto-generated method stub
		return userInfoMapper.getUserInfoCount();
	}

	@Override
	public int addUserInfo(String id, String profession, String address,
			Integer worksPop, Integer thumpWork, String hobby, String qq,
			String idiograph, Integer pro_num) {
		// TODO Auto-generated method stub
		return userInfoMapper.addUserInfo(id, profession, address, worksPop, thumpWork, hobby, qq, idiograph, pro_num);
	}

	@Override
	public int updateUserInfo(String profession, String address,
			Integer worksPop, Integer thumpWork, String hobby, String qq,
			String idiograph, Integer pro_num, String id) {
		// TODO Auto-generated method stub
		return userInfoMapper.updateUserInfo(profession, address, worksPop, thumpWork, hobby, qq, idiograph, pro_num, id);
	}
	
	
	
}
