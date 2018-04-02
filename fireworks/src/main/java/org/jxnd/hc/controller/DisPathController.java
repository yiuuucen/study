package org.jxnd.hc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class DisPathController {
	
	/**
	 * 去到登录注册界面
	 * @param url 文件名
	 * @return
	 */
	@RequestMapping("/{url}")
	public String toLogin(@PathVariable("url")String url){
		return url;
	}
	
	/**
	 * 去到前台页面
	 * @param url 文件名
	 * @return
	 */
	@RequestMapping("/pn/{url}")
	public String toMy(@PathVariable("url")String url){
		return "reception/"+url;
	}
	
	/**
	 * 去到后台页面
	 * @param url 文件名
	 * @return
	 */
	@RequestMapping("/bg/{url}")
	public String tobg(@PathVariable("url")String url){
		return "background/"+url;
	}
	
	/**
	 * 去到用户中心页面
	 * @param url
	 * @return
	 */
	@RequestMapping("/my/{url}")
	public String toMyView(@PathVariable("url")String url){
		return "reception/myView/"+url;
	}
	
}
