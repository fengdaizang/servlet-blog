$(function(){
			//添加学生窗口
			var $add=$("#add");
			$add.hide();

			$("input[name='add']").click(function(){
				$add.show();
			});
			$("input[name='close']").click(function(){
				$add.hide();
			});
			
			var $sname=$("#sname");
			var $sno=$("#sno");
			var $sage=$("#sage");
			
			$sname.blur(function(){
	  			if($sname.val()==""){
	  				$sname.after("<span style='color:red'>*not null</span>");
	  			}
	  		}).focus(function(){
	  			var $span=$("#sname+span");
	        	$span.remove();
	        });
			$sno.blur(function(){
	  			if($sno.val()==""){
	  				$sno.after("<span style='color:red'>*not null</span>");
	  			}
	  		}).focus(function(){
	  			var $span=$("#sno+span");
	        	$span.remove();
	        });
			$sage.blur(function(){
	  			if($sage.val()==""){
	  				$sage.after("<span style='color:red'>*not null</span>");
	  			}else if(isNaN($sage.val())){
	  				$sage.after("<span style='color:red'>*not number</span>");
	  			}
	  		}).focus(function(){
	  			var $span=$("#sage+span");
	        	$span.remove();
	        });
			
			//删除时的确认
			$("#delete").click(function(){
				var jsp=$("#delete").attr("href");
				if(confirm("Are you sure ?")){
					window.location.href=jsp;
				}
				return false;
			});
	});