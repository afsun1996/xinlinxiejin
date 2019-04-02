
function updateActive(a) {
	console.log(a.getAttribute("class"));
	var activetags = document.getElementsByTagName("a");
	for (var i=0;i<activetags.length;i++)
	{
		activetags[i].className = "";
	}
	a.className="active";
}
