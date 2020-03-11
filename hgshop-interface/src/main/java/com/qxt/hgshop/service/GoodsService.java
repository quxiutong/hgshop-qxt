package com.qxt.hgshop.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.qxt.hgshop.pojo.Brand;
import com.qxt.hgshop.pojo.Category;
import com.qxt.hgshop.pojo.Sku;
import com.qxt.hgshop.pojo.Spu;
import com.qxt.hgshop.pojo.SpuVo;

public interface GoodsService {
	int addBrand(Brand brand);
	int updateBrand(Brand brand);
	int deleteBrand(Integer id);
	/**
	 * 
	 * @param firstChar 首字母
	 * @param page 页码
	 * @return
	 */
	PageInfo<Brand> listBrand( String firstChar,int page); 
	
	
	int addCategory(Category category);
	int updateCategory(Category category);
	int deleteCategory(Integer id);
	/**
	 * 
	 * @param firstChar 首字母
	 * @param page 页码
	 * @return
	 */
	PageInfo<Category> listCategory( String firstChar,int page); 
	/**
	 * 以树的形式显示列表
	 * @return
	 */
	List<Category> treeCategory(); 
	

	// spu的管理
	PageInfo<Spu>  listSpu(int page,SpuVo vo);
	int addSpu(Spu spu);
	int updateSpu(Spu spu);
	int deleteSpu(int id);
	Spu getSpu(int id);
	int deleteSpuBatch(int[] id);
	
	// sku的管理
	PageInfo<Sku>  listSku(int page,Sku sku);
	int addSku(Sku sku);
	Sku getSku(int id);//获取详情
	int updateSku(Sku sku);
	int deleteSku(int id);
	int deleteSkuBatch(int[] id);
	
	
	List<Brand> getAllBrands();
	
	/**
	 * 根据spu 获取所有的sku
	 * @param spuId
	 * @return
	 */
	List<Sku>  listSkuBySpu(int spuId);
}
