function ajax(obj)
{
	var xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function ()
	{
		if (xhr.readyState == 4 && xhr.status == 200) {
			obj.success(xhr.responseText);
		}
	}


	var param = [];
	for (key in obj.data) {
		var key = encodeURIComponent(key);
		var value = encodeURIComponent(obj.data[key]);
		param.push(key + '=' + value);
	}
	obj.data = param.join('&');

	// if (obj.method == 'get') {
	// 	obj.url += '&' + obj.data;
	// }

	xhr.open(obj.method, obj.url, obj.async);
	if (obj.method == 'get') {
		xhr.send();
	} else {
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send(obj.data);
	}
}