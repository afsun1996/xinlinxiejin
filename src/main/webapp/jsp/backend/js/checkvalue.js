function checkDoctor() {
	var msg = "提示："
	var flag = false;
	var name = document.getElementById('name').value;
	var gender = document.getElementById('gender').value;
	var age = document.getElementById('age').value;
	if(name == '' || name == null) {
		msg = msg+"名医名称字段不能为空。";
		flag = true;
	}
	if(gender == '' || gender == null) {
		msg = msg+"性别称字段不能为空。";
		flag = true;
	}
	if(age == '' || age == null) {
		msg = msg+"年龄字段不能为空。";
		flag = true;
	}
	if(flag) {
		alert(msg);
		return false;
	}
	return true;
	
}
function checkMmaterial() {
	var flag = false;
	var msg = "提示："
	var name = document.getElementsByName("mname")[0].value;
	var effect = document.getElementsByName("effect")[0].value;
	if(name == '' || name == null) {
		msg = msg+"名称字段不能为空。";
		flag = true;
	}
	if(effect == '' || effect == null) {
		msg = msg+"功效字段不能为空。";
		flag = true;
	}
	if(flag) {
		alert(msg);
		return false;
	}
	return true;
}
function checkPrescription() {
	var flag = false;
	var msg = "提示："
	var name = document.getElementsByName("name")[0].value;
	var constituent = document.getElementsByName("constituent")[0].value;
	var indications = document.getElementsByName("indications")[0].value;
	if(name == '' || name == null) {
		msg = msg+"名称字段不能为空。";
		flag = true;
	}
	if(constituent == '' || constituent == null) {
		msg = msg+"组成成分字段不能为空。";
		flag = true;
	}
	if(indications == '' || indications == null) {
		msg = msg+"主治字段不能为空。";
		flag = true;
	}
	if(flag) {
		alert(msg);
		return false;
	}
	return true;
		
}

function checkArticle(){
	var flag = false;
	var msg = "提示："
	var name = document.getElementsByName("titlename")[0].value;
	if(name == '' || name == null) {
		msg = msg+"标题字段不能为空。";
		flag = true;
	}
	if(flag) {
		alert(msg);
		return false;
	}
	return true;
}