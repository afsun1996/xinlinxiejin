function updateActive(a) {
	console.log(a.getAttribute("class"));
	var activetags = document.getElementsByTagName("a");
	for (var i=0;i<activetags.length;i++)
	{
		activetags[i].className = "";
	}
	a.className="active";
}


function changeFrameHeight(){
    var ifm= document.getElementById("iframepage"); 
    console.log(ifm);
    ifm.height=document.documentElement.clientHeight;

}

window.onresize=function(){  
     changeFrameHeight();  

} 
