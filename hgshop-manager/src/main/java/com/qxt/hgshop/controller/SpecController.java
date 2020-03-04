package com.qxt.hgshop.controller;

import java.util.function.Predicate;

import javax.servlet.http.HttpServletRequest;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.qxt.hgshop.pojo.Spec;
import com.qxt.hgshop.pojo.SpecOption;
import com.qxt.hgshop.service.SpecService;

@Controller
@RequestMapping("spec")
public class SpecController {
	@Reference
	SpecService specService;
	
	/**
	 * 进入规格的列表
	 * @param page
	 * @return
	 */
	@RequestMapping("list")
	public String list(HttpServletRequest request,
			@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="") String name
	) {
		 PageInfo<Spec> pageInfo = specService.list(name, page);
		 request.setAttribute("pageInfo", pageInfo);
		return "spec/list";
	}
	
	/**
	 * 添加
	 * @param request
	 * @param page
	 * @param name
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public String add(HttpServletRequest request,Spec spec 
	) {
		spec.getOptions().removeIf(new Predicate<SpecOption>() {
			public boolean test(SpecOption x) {return x.getOptionName()==null;}
		});
		//调用服务
		int add = specService.add(spec);
		return add>0?"success":"false";
	}
}
