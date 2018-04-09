var warningPopover={
    title:'添加待办事项',
    placement:'bottom',
    popout:false,
    btnOkLabel:'确定',
    btnOkClass:'btn btn-success btn-sm',
    btnCancelClass:'btn btn-info btn-sm',
    btnCancelLabel:'放弃',
    onConfirm:function(e){
        $('#popover-custom').html('<i class="fa fa-refresh fa-spin" style="font-size: 30px"></i>');//loading image	    
        var dataObj = {};
        $('#roamingGroupsForms .form-control').each(function(){
            var obj = $(this);
            if(obj.attr('name')=='timeRange'){
                var arrayTmp = $('#timeRange').val().split('~');
                dataObj['startTime']=arrayTmp[0].trim();
                dataObj['endTime']=arrayTmp[1].trim();
            }
            else dataObj[obj.attr('name')]=obj.val();
        });
        $.ajax({
            url : "roaming/groups/addRoamingGroup",
            type : "POST",
            data:dataObj,
            success : function(data){
                $('#task-status').dataTable().api().draw();
                $(this).confirmation('destroy');
            },
            error:function() {  
                alert("提交任务异常！");  
            }  
        });
    },
    onCancel:function(){
        $(this).confirmation('destroy');
    },
    onShown:function(event, element){
        
    },
      onHide: function(event, element){
          $('#popover-custom').html('');
    }
};
$('#confirm1').confirmation(warningPopover);
$('#confirm2').confirmation(warningPopover);
$('#confirm3').confirmation(warningPopover);
