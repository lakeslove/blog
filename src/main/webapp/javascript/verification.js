
/**
 * email的格式验证
 * @param email
 * @returns
 */
function isEmail(email){
	if(email.length!=0){    
        var reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;    
        if(reg.test(email)){    
            return true;    
        }    
    } 
	return false;
}


/**
 * url的格式验证
 * @param str_url
 * @returns
 */
function IsURL(str_url){
	  var strRegex = /^((https|http|ftp|rtsp|mms)?:\/\/)+[\w-]+(\/[\w- .\/?%&=]*)?/i;
	  var re=new RegExp(strRegex); 
	   if (re.test(str_url)){
	       return (true); 
	   }else{ 
	       return (false); 
	   }
}
