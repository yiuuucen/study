package org.jxnd.hc.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jxnd.hc.bean.Production;
import org.jxnd.hc.bean.User;
import org.jxnd.hc.bean.UserInfo;
import org.jxnd.hc.service.IProductionService;
import org.jxnd.hc.service.IUserInfoService;
import org.jxnd.hc.util.RandomUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/production")
public class ProductionController {
	
	@Resource
	private IProductionService iProductionService;
	
	@Resource
	private IUserInfoService iUserInfoService;
	
	/**
	 * 查询所有作品
	 * @param deleteState 删除状态
	 * @param pn 当前页 
	 * @param pageSize 每页个数
	 * @param byThis 排序字段
	 * @param session
	 * @return
	 */
	@RequestMapping("/findAllProduction")
	@ResponseBody
	public List<Production> findAllProduction(String deleteState,Integer pn,String pageSize,String byThis,HttpSession session){
		User user=(User) session.getAttribute("spaceUser");
		List<Production> list=null;
		if(user != null){
			list=iProductionService.findAllProduction(user.getId(), Integer.parseInt(deleteState), byThis, pn, Integer.parseInt(pageSize));
		}else
			list=iProductionService.findAllProduction(0, Integer.parseInt(deleteState), byThis, pn, Integer.parseInt(pageSize));
		return list;
	}
	
	/**
	 * 添加作品
	 * @param file
	 * @param pro_name 作品名字
	 * @param pro_tail 作品说明
	 * @param user_id 用户id
	 * @return 
	 */
	@RequestMapping("/addProduction")
	
	public String addProduction(@RequestParam("filename")MultipartFile file,String pro_name,String pro_tail,HttpSession session){
		
		//取得带路径文件名
		String fileName=file.getOriginalFilename();
		//生成新文件名
		String newName=RandomUtil.createRandomNameByUUID(fileName);
		//图片保存路径
		String filePath=RandomUtil.theUrl+"/production/"+newName;
		File newFile=new File(filePath);
		if(!newFile.getParentFile().exists()){
			newFile.getParentFile().mkdirs();
        }
		try {
			file.transferTo(newFile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String savePath="/production/"+newName;
		Timestamp createTime=new Timestamp(new Date().getTime());
		User loginUser=(User) session.getAttribute("loginUser");
		int i=iProductionService.addProduction(0, savePath, pro_name, createTime, 0, 0, loginUser.getId(), 1, pro_tail);
		if(i>0){
			session.setAttribute("spaceUser", loginUser);
			return "reception/myView/my-design";
		}else{
			return "reception/myView/make-detail";
		}
	}
	
	/**
	 * 显示作品
	 * @param id 主键id
	 * @param req
	 * @return
	 */
	public String showProduction(Integer id,HttpServletRequest req){
		Production production=iProductionService.findProduction(id);
		UserInfo userInfo=iUserInfoService.findUserInfo(production.getUser().getUserInfo_id());
		List<Object> list=new ArrayList();
		list.add(production);
		list.add(userInfo);
		req.setAttribute("proInfo", list);
		return "";
	}
	
	/**
	 * 修改作品
	 * @param file
	 * @param pro_name 作品名字
	 * @param pro_tail 作品说明
	 * @param id 主键id
	 * @return
	 */
	@RequestMapping("/updateProduction")
	public String updatePRoduction(@RequestParam("filename")MultipartFile file,String pro_name,String pro_tail,Integer id){
		//取得带路径文件名
		String fileName=file.getOriginalFilename();
		//生成新文件名
		String newName=RandomUtil.createRandomNameByUUID(fileName);
		//图片保存路径
		String filePath=RandomUtil.theUrl+"/production/"+newName;
		File newFile=new File(filePath);
		try {
			file.transferTo(newFile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String savePath="/production/"+newName;
		int i=iProductionService.updateProduction(savePath, pro_name, 0, 0, 0, pro_tail, id);
		if(i>0)
			return "";
		else
			return "";
	}
	
	/**
	 * 删除作品
	 * @param id 主键id
	 * @return 1删除成功跳转作品页面、2删除失败
	 */
	@RequestMapping("/deleteProduction")
	@ResponseBody
	public String deleteProduction(Integer id){
		int i=iProductionService.updateProduction(null, null, 0, 0, 2, null, id);
		if(i>0)
			return "1";
		else
			return "2";
	}

	/**
	 * 去到修改页面
	 * @param id 主键id
	 * @param req
	 * @return
	 */
	@RequestMapping("/toUpdate")
	public String toUpdate(Integer id,HttpServletRequest req){
		Production production=iProductionService.findProduction(id);
		req.setAttribute("thePro", production);
		return "reception/myView/make-detail";
	}
	
	/**
	 * 取得作品数量
	 * @param session
	 * @return
	 */
	@RequestMapping("/getProCount")
	@ResponseBody
	public int getProCount(HttpSession session){
		User spaceUser=(User) session.getAttribute("spaceUser");
		if(spaceUser != null){
			return iProductionService.getProductionCount(spaceUser.getId());
		}else
			return iProductionService.getProductionCount(0);
	}
	
}
