/**
 * img,x,y,width,height,angle,success
 */
var pictureUtil = {
		createImgString:function(settings){
   		 if(settings.img=="undefined"||settings.img==null){
       		 consol.error("img undefined");
       		 return;
       	 }
//   		 var img = settings.img;
//   		 var x = settings.x;
//   		 var y = settings.y;
//   		 var width = settings.width;
//   		 var height = settings.height;
//   		 var angle = settings.angle;
   		 var result = imgString(settings.img,settings.x,settings.y,settings.width,settings.height,settings.angle);
   		 if(typeof settings.success == "function"){
   			settings.success(result);
   		 }
   	 },
   	imgString:function(img,x,y,width,height,angle){
   		x = parseInt(x);
        y = parseInt(y);
        width = parseInt(width);
        height = parseInt(height)
        /* var img_canvas = document.getElementById("myCanvas"); */
        var img_canvas = document.createElement('canvas');
        var imgW = (img.width)*2;
        var imgH = img.height*2;
        img_canvas.width = imgW;
        img_canvas.height = imgH;
        var img_ctx = img_canvas.getContext('2d');
        img_ctx.translate(imgW/2,imgH/2);
        img_ctx.rotate(angle*Math.PI/180);
        img_ctx.translate(-imgW/4,-imgH/4);
        img_ctx.drawImage(img,0,0);
//        console.log(x);
//        console.log(imgW/4);
//        console.log(parseInt(x)+parseInt(imgW/4)+","+imgH/4+","+width+","+height);
        var subImgData = img_ctx.getImageData(x+imgW/4,y+imgH/4,width,height);
        
        var sub_canvas = document.createElement('canvas');
        sub_canvas.width = width;
        sub_canvas.height = height;
        var sub_ctx = sub_canvas.getContext('2d');
        sub_ctx.putImageData(subImgData,0,0);
        var imgString = sub_canvas.toDataURL("image/png");
        return imgString;	 
	}
}