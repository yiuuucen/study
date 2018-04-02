package org.jxnd.hc.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * 获得随机名称或目录工具类
 * @author JJq
 * @version 1.0.0
 *
 */
public class RandomUtil {
	
	/**
	 * 图片显示基础地址
	 */
	public static final String baseUrl="/imgs";
	/**
	 * 图片存储基础路径
	 */
	public static final String theUrl="D://fireWorks";
	
	/**
	 * 生成uuid32位文件名
	 * @param fileName 带有路径的文件名
	 * @return
	 */
	public static String createRandomNameByUUID(String fileName){
		fileName = fileName.trim();
		//去掉路径取得文件名
        String fName = fileName.substring(fileName.lastIndexOf("/")+1);
        //获得文件扩展名
        String prefix=fName.substring(fName.lastIndexOf("."));
        //生成uuid32位随机字符
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        //新文件名
        String newFileName=uuid+prefix;
        return newFileName;
	}
	/**
	 * 生成随机目录
	 * @return
	 */
	public static String createRandomCatalog(){
		StringBuffer sb=new StringBuffer();
		sb.append("/");
		for(int i=0;i<4;i++){
			int radom2=(int) ((97+Math.random()*(122-97+1)));
			char c=(char) radom2;
			sb.append(c);
		}
			
		return sb.toString();
	}
	
	/**
	 * 生成随机6位数
	 * @return
	 */
	public static int createRandomNum(){
		int i=(int)((Math.random()*9+1)*100000);
		return i;
	}
	
	/**
	 * 生成订单编号
	 * @return
	 */
	public static String createOrderNumber(){
		//生成当前时间字符串
		String str = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
		int i=createRandomNum();
		return str+i;
		
	}
	
	
}
