package org.jxnd.hc.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.jxnd.hc.bean.Production;
import org.jxnd.hc.bean.User;
import org.jxnd.hc.service.IProductionService;
import org.jxnd.hc.service.IUserInfoService;
import org.jxnd.hc.service.IUserService;
import org.jxnd.hc.util.RandomUtil;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class Tset {
	
	@Resource
	private IUserService iUserService;
	
	@Resource
	private IUserInfoService iUserInfoService;
	
	@Resource
	private IProductionService iProductionService;
	
	@Test
	public void test1(){
		Timestamp createTime=new Timestamp(new Date().getTime());
		/*int i=iUserService.addUser(0, "胡成", "123", "sssss", "123456", "1", createTime, 1, 1);
		System.out.println(i);*/
		System.out.println(iUserService.findUser(11, null, null));
		/*int i=iUserService.updateUser("江建清", null, null, null,0, 1);
		System.out.println(i);*/
		//System.out.println(iUserService.getUserCount());
	}
	
	@Test
	public void test2(){ 
		/*int i=iUserInfoService.addUserInfo(0, "老师", "江西-加大", 10, 100, "苏打水", "12323213", "努力努力", 100);
		System.out.println(i);*/
		/*System.out.println(iUserInfoService.findUserInfo(1));*/
		/*String uuid=RandomUtil.createOrderNumber();
		int i=iUserInfoService.addUserInfo(uuid, "", "", 0, 0, "", "", "", 0);
		System.out.println(i);*/
		
	}
	
	@Test
	public void test3(){
		/*Timestamp createTime=new Timestamp(new Date().getTime());
		int i=iProductionService.addProduction(0, "/3.jpg", "大萨达", createTime, 0, 0, 1, 1);
		System.out.println(i);*/
		List<Production> list=iProductionService.findAllProduction(0, 0, "p.createTime", 1, 0);
		for (Production production : list) {
			System.out.println(production);
		}
		//System.out.println(iProductionService.findProduction(1));
		/*int i=iProductionService.updateProduction(null, null, 10, 20, 0, 1);
		System.out.println(i);*/
	}
	
}
