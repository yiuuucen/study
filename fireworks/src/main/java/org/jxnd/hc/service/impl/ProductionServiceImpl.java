package org.jxnd.hc.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.jxnd.hc.bean.Production;
import org.jxnd.hc.dao.ProductionMapper;
import org.jxnd.hc.service.IProductionService;
import org.jxnd.hc.util.RandomUtil;
import org.springframework.stereotype.Service;

@Service
public class ProductionServiceImpl implements IProductionService {
	
	@Resource
	private ProductionMapper productionMapper;
	
	@Override
	public List<Production> findAllProduction(Integer user_id,
			Integer deleteState, String byThis, Integer start, Integer pageSize) {
		// TODO Auto-generated method stub
		start=(start-1)*pageSize;
		List<Production> list=productionMapper.findAllProduction(user_id, deleteState, byThis, start, pageSize);
		if(list != null){
			for (Production production : list) {
				production.setImgurl(RandomUtil.baseUrl+production.getImgurl());
			}
		}
		return list;
	}

	@Override
	public Production findProduction(Integer id) {
		// TODO Auto-generated method stub
		Production production=productionMapper.findProduction(id);
		if(production != null)
			production.setImgurl(RandomUtil.baseUrl+production.getImgurl());
		return production;
	}

	@Override
	public int getProductionCount(Integer user_id) {
		// TODO Auto-generated method stub
		return productionMapper.getProductionCount(user_id);
	}

	@Override
	public int addProduction(Integer id, String imgurl, String pro_name,
			Timestamp createTime, Integer like_num, Integer view_num,
			Integer user_id, Integer deleteState,String pro_tail) {
		// TODO Auto-generated method stub
		return productionMapper.addProduction(id, imgurl, pro_name, createTime, like_num, view_num, user_id, deleteState,pro_tail);
	}

	@Override
	public int updateProduction(String imgurl, String pro_name,
			Integer like_num, Integer view_num, Integer deleteState,String pro_tail ,Integer id) {
		// TODO Auto-generated method stub
		return productionMapper.updateProduction(imgurl, pro_name, like_num, view_num, deleteState, pro_tail,id);
	}

}
