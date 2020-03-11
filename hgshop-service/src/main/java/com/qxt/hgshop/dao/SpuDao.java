package com.qxt.hgshop.dao;

import java.util.List;

import com.qxt.hgshop.pojo.Spu;
import com.qxt.hgshop.pojo.SpuVo;

public interface SpuDao {
	
	int add(Spu spu);

	int deleteSpuBatch(int[] ids);

	int update(Spu spu);

	List<Spu> list(SpuVo vo);

	int delete(int id);

	Spu findById(int id);


}
