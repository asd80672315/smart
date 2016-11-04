    	$(function(){
    		
    		var args=$("#getcommondataScript").attr('data');
    		if(args!=null){
	    		var attrs=args.split("&");
	    		var vals=new Array(attrs.length);    		
	    		for(var i=0;i<attrs.length;i++){
	    			vals[i]=attrs[i].split("=")[1];
	    		}
	    		var occupationid=vals[0];
	    		var positionid=vals[1];
	    		var industryid=vals[2];
	    		$.getJSON("/smart/common/occupation",function(data){
	    			$(data).each(function(){
	    				if(this.OccupationID.toString()==occupationid.toString()){
	    					$("<option/>").html(this.Name).val(this.OccupationID).attr('selected','selected').appendTo("#OccupationID");
	    				}else{
	    					$("<option/>").html(this.Name).val(this.OccupationID).appendTo("#OccupationID");
	    				}
	    			});
	    		});
	    		$.getJSON("/smart/common/position",function(data){
	    			$(data).each(function(){
	    				if(this.PositionID.toString()==positionid.toString()){
	    					$("<option/>").html(this.Name).val(this.PositionID).attr('selected','selected').appendTo("#PositionID");
	    				}else{
	    					$("<option/>").html(this.Name).val(this.PositionID).appendTo("#PositionID");
	    				}
	    			});
	    		});
	    		$.getJSON("/smart/common/industry",function(data){
	    			$(data).each(function(){
	    			if(this.IndustryID.toString()==industryid.toString()){
	    			$("<option/>").html(this.Name).val(this.IndustryID).attr('selected','selected').appendTo("#IndustryID");
	    			$("<option/>").html(this.Name).val(this.IndustryID).attr('selected','selected').appendTo("#GroupIndustryID");
	    			}else{
	    				$("<option/>").html(this.Name).val(this.IndustryID).appendTo("#IndustryID");
	    				$("<option/>").html(this.Name).val(this.IndustryID).appendTo("#GroupIndustryID");
	    			}
	    			});
	    		});
    		}
    	});
