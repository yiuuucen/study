function drag(id) {
	var obj=document.getElementById('id');
	var disX=0;
	var disY=0;
	obj.onmousedown=function(ev){
		disX=ev.pageX-obj.offsetLeft;
		dixY=ev.pageY-obj.offsetTop;

		obj.onmousemove=function(){
			obj.style.left=ev.clientX-disX+'px';
			obj.style.top=ev.clientY-disY+'px';
		}
	}
}