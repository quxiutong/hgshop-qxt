<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<div>
	<input id="firstChar" value="${firstChar}"/>
	<button type="button" class="btn btn-primary" onclick="query()">
   	查询 </button>
   	
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
   	添加 </button>
   	   	
</div>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">添加规格</h5>
         <button type="button" onclick="addProp('#addbrand')"> 添加属性</button>
         
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        	
      </div>
      <div class="modal-body">
        	<form id="addbrand">
        		 <div class="form-group">
    				<label for="brandName">品牌名称</label>
    				<input type="text" class="form-control" name="name" id="name" aria-describedby="brandNamelHelp">
    				<small id="brandNamelHelp" class="form-text text-muted">请输入规格名称</small>
  				</div>
  				<div class="form-group form-group-proper">
    				<label for="inputAddress">属性值</label>
    				<input type="text" name="firstChar" class="form-control" id="inputAddress" placeholder="1234 Main St">
  				</div>
  				
    			
        	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="commitbrand()">提交</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="staticBackdropUpdate" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">添加规格</h5>
         <button type="button" onclick="addProp('#updatebrand')"> 添加属性</button>
         
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        	
      </div>
      <div class="modal-body">
        	<form id="updatebrand">
        		 <input type="hidden" name="id" id="upId">
        		 <div class="form-group">
    				<label for="brandName">规格名称</label>
    				<input type="text" class="form-control" name="brandName" id="upbrandName" aria-describedby="brandNamelHelp">
    				<small id="brandNamelHelp" class="form-text text-muted">请输入规格名称</small>
  				</div>
  				<div class="form-group form-group-proper">
    				<label for="inputAddress">属性值</label>
    				<input type="text" name="firstChar" class="form-control" id="inputAddress" placeholder="1234 Main St">
    				<button onclick="$(this).parent().remove()">删除</buttonn>
  				</div>
  				
    			
        	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="commitUpdatebrand()">提交</button>
      </div>
    </div>
  </div>
</div>


<table class="table">
	
	<tr> 
		<th>id</th>
		<th>品牌名称</th>
		<th>首字母</th>
		<th>操作</th>
	</tr>
	<c:forEach items="${pageInfo.list}" var="brand">
		<tr>
			<td>${brand.id}</td>
			<td>${brand.name}</td>
			<td>${brand.firstChar}</td>
			<td>
				<button type="button" class="btn btn-danger" onclick="delBrand(${brand.id})">删除</button>
				<button type="button" class="btn btn-warning" onclick="openUpdatebrand(${brand.id})">修改</button>
			</td>
			
		</tr>
	</c:forEach>
	
	<!-- pageInfo -->
	<tr>
		<td colspan="3">
			<jsp:include page="../common/page.jsp"></jsp:include>
		</td>
	</tr>
</table>    

<script type="text/javascript">
	var addindex=1;
	//fomId 标志给那个form 添加属性
	function addProp(fomId){
			$(fomId).append('<div class="form-group form-group-proper">'+
    				'<label for="inputAddress">属性值</label>'+
    				'<input type="text" name="firstChar" class="form-control" id="inputAddress" placeholder="1234 Main St">'+
    				'<button onclick="$(this).parent().remove()">删除</button>'+
    				'</div>')
    				
    				
    	addindex++;
	} 
	
	// 提交修改
	function commitUpdatebrand(){
		
		
		var formData = new FormData($("#updatebrand")[0]);
		$.ajax({url:"/brand/update",
			 // dataType:"json",
			  data:formData,
			  // 让jQuery 不要再提交数据之前进行处理
			  processData : false,
			  // 提交的数据不能加消息头
			  contentType : false,
			  // 提交的方式 
			  type:"post",
			  // 成功后的回调函数
			  success:function(data){
				 if(data=="success"){
					 alert("数据提交成功");
					 $('#staticBackdropUpdate').modal('hide')
				 }else{
					 alert("数据保存失败")
				 }
				 
			  }
			  })
		
	}
	// 弹出修改的窗口
	function openUpdatebrand(id){
		
		//清空数据
		$(".form-group-proper").each(function(){
			$(this).remove();
		})
		addindex=0;
		$("#upbrandName").val("")
		
		
		$.post("/brand/getbrand",{id:id},function(data){
			//规格的id
			$("#upId").val(data.id)
			$("#upbrandName").val(data.brandName)
			// 添加规格的选项
			addindex=0;
			for(var i=0;i<data.options.length;i++){
				var option=data.options[i];
				$("#updatebrand").append('<div class="form-group form-group-proper">'+
	    				'<label for="inputAddress">属性值</label>'+
	    				'<input type="hidden" name="options['+addindex+'].id" value="'+option.id+'">' +
	    				'<input type="text" name="options['+addindex+'].optionName" value="'+option.optionName+'"class="form-control" id="inputAddress" >'+
	    				'<button onclick="$(this).parent().remove()">删除</button>'+
	    				'</div>')
	    		addindex++;
			}
			
		});
		
		$("#staticBackdropUpdate").modal('show')
	}
	/**
		删除品牌
	*/
	function delBrand(id){
		if(confirm("您确认删除该条数据么？")){
			$.post("/brand/delbrand",{id:id},function(data){
				if(data="success"){
					alert("删除成功")
					refresh();
				}else{
					alert("删除失败")
				}
				
			});
		}else{
			return;
		}
	}
		
	
    /**
          查询
    */
    function query(){
		var url="/brand/list?firstChar="+$("#firstChar").val();
		$("#main").load(url);
	}
	
	/**
	* 分页 
	*/
	function goPage(pagenum){
		
		var url="/brand/list?firstChar="+$("#firstChar").val()+'&page='+pagenum;
		$("#main").load(url);
	}
	
	/**
	* 刷新 而且保持查询条件和页码
	*/
	function refresh(){
		
		var url="/brand/list?name=${queryName}"+'&page=${pageInfo.pageNum}';
		$("#main").load(url);
	}
	
	
	
	//添加窗口的复位
	function resetAddForm(){
		$(".form-group-proper").each(function(){
			$(this).remove();
		})
		addindex=1;
		$("#brandName").val("")
		
	}
	
	// 给添加规格模态框增加显示成成功后的事件  
	$('#staticBackdrop').on('shown.bs.modal', function (e) {
		  // do something...
		resetAddForm();
	})
	
	// 给添加规格模态框增加关闭以后的事件  
	$('#staticBackdrop').on('hidden.bs.modal', function (e) {
		  // do something...
		refresh();
	})
	
	// 给修改规格模态框增加关闭以后的事件  
	$('#staticBackdropUpdate').on('hidden.bs.modal', function (e) {
		  // do something...
		refresh();
	})
	
	
	
	/**
	  提交数据	
	*/
	function commitbrand(){
		//addbrand
		var formData = new FormData($("#addbrand")[0]);
		$.ajax({url:"/brand/add",
			 // dataType:"json",
			  data:formData,
			  // 让jQuery 不要再提交数据之前进行处理
			  processData : false,
			  // 提交的数据不能加消息头
			  contentType : false,
			  // 提交的方式 
			  type:"post",
			  // 成功后的回调函数
			  success:function(data){
				 if(data=="success"){
					 alert("数据提交成功");
					 $('#staticBackdrop').modal('hide')
				 }else{
					 alert("数据保存失败")
				 }
				 
			  }
			  })
		
	}
</script>