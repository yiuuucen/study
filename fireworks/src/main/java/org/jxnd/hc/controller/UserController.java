package org.jxnd.hc.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.jxnd.hc.bean.User;
import org.jxnd.hc.service.IUserInfoService;
import org.jxnd.hc.service.IUserService;
import org.jxnd.hc.util.RandomUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class UserController {
	
	@Resource
	private IUserService iUserService;
	
	@Resource
	private IUserInfoService iUserInfoService;
	
	/**
	 * 用户登录
	 * @param account 账号
	 * @param pwd 密码
	 * @param session
	 * @return 1去到主页 、2 去到管理系统主页 、3用户名或密码错误 、4 账号或密码不能为空
	 */
	@RequestMapping("/toLogin")
	@ResponseBody
	public String toLogin(String account,String pwd,HttpSession session){
		if(account != null && pwd !=null){
			User user=iUserService.findUser(0, account, pwd);
			if(user != null){
				if(user.getIsAdmin()==2){
					session.setAttribute("loginUser", user);
					return "1";
				}else{
					session.setAttribute("adminInfo", user);
					return "2";
				}
			}else
				return "3";
		}else
			return "4";
	}
	
	/**
	 * 用户注册
	 * @param account 账号
	 * @param pwd 密码
	 * @param phone 电话
	 * @return 1注册成功去到登录页面、2注册失败、3用户已存在
	 */
	@RequestMapping("/toRegister")
	@ResponseBody
	public String toRegister(String account,String pwd,String phone){
		User user=iUserService.findUser(0, account, null);
		if(user != null){
			return "3";
		}else{
			Timestamp createTime=new Timestamp(new Date().getTime());
			String uuid=RandomUtil.createOrderNumber();
			iUserInfoService.addUserInfo(uuid, "XX", "XXXX", 0, 0, "", "", "这个人很LAN什么都没留下~~", 0);
			int i=iUserService.addUser(0, account, pwd, "/1.jpg", phone, uuid, createTime, 1, 2);
			if(i>0)
				return "1";
			else
				return "2";
		}
			
	}
	
	/**
	 * 查询所有用户
	 * @param pn 当前页
	 * @param pageSize 每页个数
	 * @return 用户列表
	 */
	@RequestMapping("/findAllUser")
	@ResponseBody
	public List<User> findAllUser(Integer pn,String pageSize){
		return iUserService.findAllUser(pn, Integer.parseInt(pageSize));
	}
	
	/**
	 * 去到中心页面
	 * @param id 主键id
	 * @param session
	 * @return 1去到作者中心、2未登录，提示登录
	 */
	@RequestMapping("/toUser")
	
	public String toUser(Integer id,HttpSession session){
		User spaceUser=iUserService.findUser(id, null, null);
			session.setAttribute("spaceUser", spaceUser);
			return "reception/myView/my-design";
	}
	
	/**
	 * 完善信息
	 * @param account 账号
	 * @param profession 职业
	 * @param address 地址
	 * @param hobby 爱好
	 * @param phone 电话
	 * @param qq qq
	 * @param idiograph 个人说明
	 * @param id 主键id
	 * @return 1完善信息成功、2完善失败、3用户名相同
	 */
	@RequestMapping("/updateUser")
	@ResponseBody
	public String updateUser(String account,String profession,String address,String hobby,String phone,String qq,String idiograph,Integer id,
			HttpSession session){
		
		User theUser=iUserService.findUser(0, account, null);
		if(theUser == null){
			int i=iUserService.updateUser(account, null, null, phone, 0, id);
			User user=iUserService.findUser(id, null, null);
			int j=iUserInfoService.updateUserInfo(profession, address, 0, 0, hobby, qq, idiograph, 0, user.getUserInfo_id());
			if(i*j>0){
				User newUser=iUserService.findUser(id, null, null);
				session.setAttribute("loginUser", newUser);
				return "1";
			}
			else
				return "2";
		}else if(theUser.getId()==id){
			int i=iUserService.updateUser(account, null, null, phone, 0, id);
			User user=iUserService.findUser(id, null, null);
			int j=iUserInfoService.updateUserInfo(profession, address, 0, 0, hobby, qq, idiograph, 0, user.getUserInfo_id());
			if(i*j>0){
				User newUser=iUserService.findUser(id, null, null);
				session.setAttribute("loginUser", newUser);
				return "1";
			}
			else
				return "2";
		}else
			return "3";
			
		
		
	}
	
	
	
}
