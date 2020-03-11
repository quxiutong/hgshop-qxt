package com.qxt.hgshop.dao;

import java.util.List;

import com.qxt.hgshop.pojo.Category;

public interface CategoryDao {
	
	 List<Category> tree();

		int add(Category category);

		/**
		 * 
		 * @param id
		 * @return
		 */
		int delete(Integer id);

		/**
		 * 修改
		 * @param category
		 * @return
		 */
		int update(Category category);
}
