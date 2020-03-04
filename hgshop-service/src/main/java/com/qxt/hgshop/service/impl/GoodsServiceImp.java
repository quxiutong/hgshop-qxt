package com.qxt.hgshop.service.impl;

import java.util.List;

import org.apache.dubbo.config.annotation.Service;

import com.github.pagehelper.PageInfo;
import com.qxt.hgshop.pojo.Brand;
import com.qxt.hgshop.pojo.Category;
import com.qxt.hgshop.service.GoodsService;
@Service(interfaceClass = GoodsService.class)
public class GoodsServiceImp implements GoodsService {

	public int addBrand(Brand brand) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateBrand(Brand brand) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteBrand(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public PageInfo<Brand> listBrand(String firstChar, int page) {
		// TODO Auto-generated method stub
		return null;
	}

	public int addCategory(Category category) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateCategory(Category category) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteCategory(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public PageInfo<Category> listCategory(String firstChar, int page) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Category> treeCategory() {
		// TODO Auto-generated method stub
		return null;
	}

}
