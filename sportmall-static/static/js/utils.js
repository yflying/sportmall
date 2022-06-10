function getUrlParam(key){
	var url = decodeURI( window.location.toString() );
	var arr = url.split("?");
	if(arr.length>1){
		var params = arr[1].split("&");
		for(var i=0; i<params.length; i++){
			var param = params[i];  //"pid=101"
			if(param.split("=")[0] == key ){
				return param.split("=")[1];
			}
		}
	}
	return null;
}

function rTime(date) {
        var json_date = new Date(date).toJSON();
        return new Date(+new Date(json_date) + 8 * 3600 * 1000).toISOString().replace(/T/g, ' ').replace(/\.[\d]{3}Z/, '')
}
function blobToBase64(blob) {
       return new Promise((resolve, reject) => {
         const fileReader = new FileReader();
         fileReader.onload = (e) => {
           resolve(e.target.result);
         };
         // readAsDataURL
         fileReader.readAsDataURL(blob);
         fileReader.onerror = () => {
           reject(new Error('文件流异常'));
         };
       });
   }

		function clearCookie() {
			var keys = document.cookie.match(/[^ =;]+(?=\=)/g);
			if (keys) {
				for (var i = keys.length; i--;) {
					document.cookie = keys[i] + '=0;path=/;expires=' + new Date(0).toUTCString();//清除当前域名下的,例如：m.kevis.com
					document.cookie = keys[i] + '=0;path=/;domain=' + document.domain + ';expires=' + new Date(0).toUTCString();//清除当前域名下的，例如 .m.kevis.com
					document.cookie = keys[i] + '=0;path=/;domain=kevis.com;expires=' + new Date(0).toUTCString();//清除一级域名下的或指定的，例如 .kevis.com
				}
			}
			console.log('已清除');
		}