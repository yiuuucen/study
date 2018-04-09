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
	"opens": "left",
	"drops": "down",
	"buttonClasses": "btn btn-sm",
	"applyClass": "btn-success",
	"cancelClass": "btn-default"
}, function(start, end, label) {
});


    //line chart
    var myChart = echarts.init(document.getElementById('lineChart'));

    option = {
            title : {
                text: '未来一周气温变化',
                subtext: '纯属虚构'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['最高气温','最低气温']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data : ['周一','周二','周三','周四','周五','周六','周日']
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisLabel : {
                        formatter: '{value} °C'
                    }
                }
            ],
            series : [
                {
                    name:'最高气温',
                    type:'line',
                    data:[11, 11, 15, 13, 12, 13, 10],
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '平均值'}
                        ]
                    }
                },
                {
                    name:'最低气温',
                    type:'line',
                    data:[1, -2, 2, 5, 3, 2, 0],
                    markPoint : {
                        data : [
                            {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name : '平均值'}
                        ]
                    }
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    