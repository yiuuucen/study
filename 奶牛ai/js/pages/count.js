
//date range picker related js
var startTime = new Date();
var year = startTime.getFullYear();
var month = startTime.getMonth();
var day = startTime.getDate();
var hour = startTime.getHours();
var minute = startTime.getMinutes();
$('#timeRange').daterangepicker({
	"timePicker": true,
	"format": "YYYY-MM-DD HH:00:00", 
	"separator": " ~ ",
	"timePickerIncrement": 1,
	"ranges": {
		"最近7天": [
			new Date(year,month,day-7,hour,minute),
			startTime
		],
		"最近30天": [
			new Date(year,month,day-30,hour,minute),
			startTime
		],
		"本月时间": [
			new Date(year,month,1,hour,minute),
			startTime
		],
		"上月时间": [
			new Date(year,month-1,1,hour,minute),
			new Date(year,month,0,hour,minute)
		]
	},
	"locale": {
		"applyLabel": "确定",
		"cancelLabel": "取消",
		"fromLabel": "从",
		"toLabel": "到",
		"customRangeLabel": "自定时间",
		"daysOfWeek": [
			"周日",
			"周一",
			"周二",
			"周三",
			"周四",
			"周五",
			"周六"
		],
		"monthNames": [
			"一月",
			"二月",
			"三月",
			"四月",
			"五月",
			"六月",
			"七月",
			"八月",
			"九月",
			"十月",
			"十一月",
			"十二月"
		],
		"firstDay": 1
	},
	"startDate": startTime,
	"endDate": new Date(year,month,day+7),
	"opens": "center",
	"drops": "down",
	"buttonClasses": "btn btn-sm",
	"applyClass": "btn-success",
	"cancelClass": "btn-default"
}, function(start, end, label) {
});



//datatable related js
//search the table is going to be paged, this is for data table plugin.
function pagingDT(table){
	var obj = $(table);
	if(obj.parent().prev().val().trim()==''){return false;}
	else {
		var id = obj.parents(".dataTables_paginate").attr('id').trim().split('_')[0];
		$("#"+id).dataTable().fnPageChange(parseInt(obj.parent().prev().val().trim()-1));
	}
}

/* ---------- Additional functions for data table ---------- After the change, the first and last choices are added here by Hequn 2014-7-2 16:56:09 */
$.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
{
	return {
		"iStart":         oSettings._iDisplayStart,
		"iEnd":           oSettings.fnDisplayEnd(),
		"iLength":        oSettings._iDisplayLength,
		"iTotal":         oSettings.fnRecordsTotal(),
		"iFilteredTotal": oSettings.fnRecordsDisplay(),
		"iPage":          Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
		"iTotalPages":    Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
	};
}
$.extend( $.fn.dataTableExt.oPagination, {
	"bootstrap": {
		"fnInit": function( oSettings, nPaging, fnDraw ) {
			var oLang = oSettings.oLanguage.oPaginate;
			var fnClickHandler = function ( e ) {
				e.preventDefault();
				if ( oSettings.oApi._fnPageChange(oSettings, e.data.action) ) {
					fnDraw( oSettings );
				}
			};

			$(nPaging).append(
				'<div class="col-sm-8"><ul class="pagination">'+
					'<li class="paginate_button first disabled"><a href="#">' + oLang.sFirst + '</a></li>' +
					'<li class="paginate_button prev disabled"><a href="#">'+oLang.sPrevious+'</a></li>'+
					'<li class="paginate_button next disabled"><a href="#">'+oLang.sNext+'</a></li>'+
					'<li class="paginate_button last disabled"><a href="#">' + oLang.sLast + '</a></li>' +
				'</ul></div>'
				+'<div class="pagerLayout col-sm-4"><div class="form-group"><div class="input-group input-group-sm"><input type="text" id="pager-input" class="form-control input-sm" style="width:40px;"/>'+
				'<span class="input-group-btn"><input type="button" class="btn btn-small btn-success" onclick="pagingDT(this);" value="Go"/></span>'+
				'</div><div style="margin-top:10px;font-weight: bold;display:table;" class="labelS">共<span class= "totalPShow">0</span>页，第<span class= "totalPShowNow">0</span>页</div></div>'+
				'</div>'	
			);
			var els = $('a', nPaging);
			$(els[0]).bind('click.DT', { action: "first" }, fnClickHandler);
			$(els[1]).bind('click.DT', { action: "previous" }, fnClickHandler);
			$(els[2]).bind('click.DT', { action: "next" }, fnClickHandler);
			$(els[3]).bind('click.DT', { action: "last" }, fnClickHandler);
		},

		"fnUpdate": function ( oSettings, fnDraw ) {
			var iListLength = 5;
			var oPaging = oSettings.oInstance.fnPagingInfo();
			var an = oSettings.aanFeatures.p;
			var i, j, sClass, iStart, iEnd, iHalf=Math.floor(iListLength/2);

			if ( oPaging.iTotalPages < iListLength) {
				iStart = 1;
				iEnd = oPaging.iTotalPages;
			}
			else if ( oPaging.iPage <= iHalf ) {
				iStart = 1;
				iEnd = iListLength;
			} else if ( oPaging.iPage >= (oPaging.iTotalPages-iHalf) ) {
				iStart = oPaging.iTotalPages - iListLength + 1;
				iEnd = oPaging.iTotalPages;
			} else {
				iStart = oPaging.iPage - iHalf + 1;
				iEnd = iStart + iListLength - 1;
			}
			var iLen;
			for ( i=0, iLen=an.length ; i<iLen ; i++ ) {
				// remove the middle elements
				$('li:gt(0)', an[i]).filter(':not(.first,.prev,.next,.last)').remove();
				//give total pages numbers
				$('.pagerLayout', an[i]).find('.labelS').children('.totalPShow').html(oPaging.iTotalPages);
				//right now page
				$('.pagerLayout', an[i]).find('.labelS').children('.totalPShowNow').html(oPaging.iPage+1);
				// add the new list items and their event handlers
				for ( j=iStart ; j<=iEnd ; j++ ) {
					sClass = (j==oPaging.iPage+1) ? 'class="active"' : '';
					$('<li '+sClass+'><a href="#">'+j+'</a></li>')
						.insertBefore( $('li[class~=next]', an[i])[0] )
						.bind('click', function (e) {
							e.preventDefault();
							oSettings._iDisplayStart = (parseInt($('a', this).text(),10)-1) * oPaging.iLength;
							fnDraw( oSettings );
						} );
				}

				// add / remove disabled classes from the static elements
				if ( oPaging.iPage === 0 ) {
					$('li[class~=first]', an[i]).addClass('disabled');
					$('li[class~=prev]', an[i]).addClass('disabled');
				} else {
					$('li[class~=first]', an[i]).removeClass('disabled');
					$('li[class~=prev]', an[i]).removeClass('disabled');
				}

				if ( oPaging.iPage === oPaging.iTotalPages-1 || oPaging.iTotalPages === 0 ) {
					$('li[class~=next]', an[i]).addClass('disabled');
					$('li[class~=last]', an[i]).addClass('disabled');
				} else {
					$('li[class~=next]', an[i]).removeClass('disabled');
					$('li[class~=last]', an[i]).removeClass('disabled');
				}
			}
		}
	}
});
var data = [
    [
        "Tiger Nixon",
        "System Architect",
        "Edinburgh",
        "5421",
        "2011/04/25",
        "$3,120",
        "zzz"
    ],
    [
        "Garrett Winters",
        "Director",
        "Edinburgh",
        "8422",
        "2011/07/25",
        "$5,300",
        "zzz"
    ]
];

$('#rank-table').dataTable({
    "data":data,
// 	  "paging": true,
// 	  "lengthChange": true,
// 	  "searching": true,
// 	  "info": true,
// 	  "autoWidth": false,
// 	  "bProcessing": true,//是否显示procssing界面（图标）
// 	  "bServerSide": false,//启用ajax类型的server-side
// 	  "sAjaxSource": "roaming/groups/list.do",//数据源
// 	  "sAjaxDataProp": "items",//修改object对象中数组的名称，默认为aaData（数据直接入口）
// 	  "bFilter":true,
// 	  "bSort": true,
// 	  "aaSorting" : [[1, "desc"]], //默认的排序方式，第3列，升序排列
// 	  "sDom": "<'row'<'col-sm-6'l>r<'col-sm-6'f>>t<'row fixedP'<'col-sm-4 tableCell'i><'col-sm-8 tableCell'p>>",
	  "sPaginationType": "bootstrap",
// 	  "oSearch": {"bSmart":true},
// 	  "aLengthMenu": [[5, 10, 15], [5, 10, 15]],
// 	  "iDisplayLength":5,
// 	  "fnDrawCallback": function( oSettings  ) {
// 		$("#pager-input").bind("keyup", function(e) {
// 			if(e.keyCode == 13) {
// 				$(this).next().find(".btn").click();
// 			}
// 		});
// 	  },
// 	  "fnServerData": function ( sSource, aoData, fnCallback ) {//与server端交互入口函数

// 			aoData.push({"name": "bQuery", "value": true});//自定义post数据，个性化传递参数到server端
		
// 			$.ajax( {//通过ajax请求，得到数据（一般为json数据）
// 				"dataType": 'json',//注意切回jsonp
// 				"type": "post",
// 				"url": sSource,
// 				"data": aoData,
// 				"success": function(data){
// 					console.log(data);
// 					fnCallback(data);//重要，通知dataTables加载数据
// 				}
// 			} );
// 	  },
// 	  "aoColumns": [//mData属性直接标识了Object对象中的属性名，从而直接得到json object 属性的值
// //  			  { "sTitle": "#任务ID" , "sClass": "item-center","mData": "taskId","sWidth": "10%","bSortable":false,"sName":"task_id",
// //  				  "mRender": function(data, type, full) {//加入mRender可以自定义数据展示类型（很方便）
// //  					  var sReturn = data;
// //  					  return sReturn;
// //  				  }
// //  			  },
//   			  { "sTitle": "排名" , "sClass": "item-center","mData": "ranking","sWidth": "10%","bSortable":false,"sName":"ranking",
//   				  "mRender": function(data, type, full) {//加入mRender可以自定义数据展示类型（很方便）
//   					  var sReturn = data;
//   					  return sReturn;
//   				  }
//   			  },	  			
//   			  { "sTitle": "ID" , "sClass": "item-center","mData": "id","sWidth": "10%","bSortable":true,"sName":"id",
//   				  "mRender": function(data, type, full) {//加入mRender可以自定义数据展示类型（很方便）
//   					  var sReturn = '<span title="'+data+'">'+data+'</span>';
//   					  return sReturn;
//   				  }
//   			  },
//   			  { "sTitle": "所属牛棚", "sClass": "item-center","mData": "cowshed","sWidth": "15%","sName":"cowshed","bSortable":false,
//   				  "mRender": function(data, type, full) {//加入mRender可以自定义数据展示类型（很方便）
//   					  var sReturn = '<span title="'+data+'">'+data+'</span>';
//   					  return sReturn;
//   				  }
//   			  },
//   			  { "sTitle": "年龄", "sClass": "item-center","mData": "age","sWidth": "10%","sName":"age","bSortable":false,
//   				  "mRender": function(data, type, full) {//加入mRender可以自定义数据展示类型（很方便）
//   					  var sReturn = '<span title="'+data+'">'+data+'</span>';
//   					  return sReturn;
//   				  }
//   			  },
//   			  { "sTitle": "是否发情", "sClass": "item-center","mData": "estrus","sWidth": "15%","sName":"estrus","bSortable":false,
//   				  "mRender": function(data, type, full) {//加入mRender可以自定义数据展示类型（很方便）
//   					  var sReturn = '<span title="'+data+'">'+data+'</span>';
//   					  return sReturn;
//   				  }
//   			  },
//   			  { "sTitle": "详细健康状况", "sClass": "item-center","mData": "healthStatus","sWidth": "25%","sName":"healthStatus","bSortable":false,
//   				  "mRender": function(data, type, full) {//加入mRender可以自定义数据展示类型（很方便）
//   					  var sReturn = '<span title="'+data+'">'+data+'</span>';
//   					  return sReturn;
//   				  }
//   			  },
//   			  { "sTitle": "备注", "sClass": "item-center","mData": "note","sWidth": "15%","sName":"note","bSortable":false,
//   				  "mRender": function(data, type, full) {//加入mRender可以自定义数据展示类型（很方便）
//   					  var sReturn = '<span title="'+data+'">'+data+'</span>';
//   					  return sReturn;
//   				  }
//   			  }
//       ],
	  "oLanguage": {
			"sLengthMenu": "每页显示 _MENU_ 条记录",
			"sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
			"sInfoEmpty": "没有数据",
			"sInfoFiltered": "",
			"sSearch": "搜索:",
			"oPaginate": {
				"sFirst": "首页",
				"sPrevious": "前一页",
				"sNext": "后一页",
				"sLast": "尾页"
			},
			"sZeroRecords": "没有检索到数据",
			"sProcessing": '<i class="fa fa-refresh fa-spin" style="font-size: 20px"></i>'
		}
});
//Call dataTables, and return the API to the variable for use in our code
//Binds dataTables to all elements with a class of dataTable
var dtable = $("#rank-table").dataTable().api();

//Grab the dataTables input box and alter how it is bound to events
$(".dataTables_filter input")
	.unbind() // Unbind previous default bindings
	.bind("keyup", function(e) { // Bind our desired behavior,input event can be used to automatically search
		// If the length is 3 or more characters, or the user pressed ENTER, search
		if(this.value.length >= 2 && e.keyCode == 13) {
			// Call the API search function
			dtable.search(this.value).draw();
		}
		// Ensure we clear the search if they backspace far enough
		if(this.value == "") {
			dtable.search("").draw();
		}
		return;
});