<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(document).ready(function() {
	$.changeSelectedNav("nav-others-id");
});
</script>
<style>
        #Map {
            position: relative;
            float:left;
            width: 1728px;
            height: 2240px;
        }
        
        #line {
            position: relative;
            float:left;
            width: 200px;
            height: 2240px;
        }
        
        #row {
            position: relative;
            float:left;
            width: 200px;
            height: 2000px;
        }
        
        #number {
            position: relative;
            float:left;
            width: 200px;
            height: 2000px;
        }
        
        #stroke {
            position: relative;
            float:left;
            width: 2000px;
            height: 2000px;
        }
        
        #result_list {
            position: relative;
            float:left;
            width: 200px;
            height: 1700px;
            border: 1px solid red;
        }
        
        .result_list_children {
            position: relative;
            width: 200px;
            height: 49px;
            border: solid 1px;
            font-size: 40px;
        }
.blocks{
overflow:auto;
}
</style>
<div class="blocks">
    <button onclick="start()">start</button><br>
    <img src="images/9_adjustRotate3_rotate.png" style="width:800px;height:1600px;float:left;" id="testPicture">
    <div id="result_list"></div>
    <div style="position:relative;top:10px;display:none;">
    <canvas id="stroke" width="2000" height="2000" style="border:solid 1px red;"></canvas>
    <canvas id="number" width="200" height="2000" style="border:solid 1px red;"></canvas>
    <canvas id="row" width="200" height="2000" style="border:solid 1px red;"></canvas>
    <canvas id="line" width="200" height="2240" style="border:solid 1px red;"></canvas>
    <canvas id="Map" width="1728" height="2240" style="border:solid 1px red;"></canvas>
    </div>
    <script>
        function start(){
        var stroke = document.getElementById("stroke");
        stro = stroke.getContext('2d');
        stro.fillStyle = "red";
        stro.fillRect(0, 0, 2000, 2000);
        error = 0;
        // 设置绘图环境  
        var myMap = document.getElementById("Map");
        var ctx = myMap.getContext('2d');
        //        ctx.save();
        var img = document.getElementById("testPicture");
//                ctx.rotate(10*Math.PI/180);
        ctx.drawImage(img, 0, 0);
        //        ctx.restore();
        ctx.fillStyle = "skyBlue";
        ctx.fillRect(0, 0, 400, 10);
        var ctxTest1 = ctx.getImageData(180, 190, 300, 25);
        var ctxTest2 = ctx.getImageData(1250, 190, 300, 25);
        var point1 = average(ctxTest1);
        var point2 = average(ctxTest2);
        ctx.putImageData(ctxTest1, 100, 0);
        ctx.putImageData(ctxTest2, 600, 0);
        var temK = 0;
        if (point2[1] != point1[1]) {
            var temX = 1250 + point2[0] - (180 + point1[0])
            temK = (point1[1] - point2[1]) / temX;
        }
        ctx.rotate(Math.atan(temK));

        ctx.clearRect(0, 0, 1728, 2240);
        ctx.drawImage(img, 0, 0);
        //0   770：x:311,510,709,908  y：405  r：+0.02
        //0   698：x:288,487,686,885  y：453  r：+0.0225
        //四0 792：x:288,487,686,907  y：460  r：+0.0230
        //0   423：x:329,528,727,926  y：425  r：-0.0030 
        //四1   377：x:955,528,727,926  y：429  r：-0.0130 
        //  9_adjustRotate3_rotate.png x:955,528,727,926  y：429  r：-0.0130 
        var lineData1 = ctx.getImageData(312,429,709,1800);



        var line = document.getElementById("line");
        line_ctx = line.getContext('2d');
        line_ctx.putImageData(lineData1, 0, 0);

        var row = document.getElementById("row");
        row_ctx = row.getContext('2d');
        row_ctx.fillStyle = "red";
        row_ctx.fillRect(0, 0, 200, 1800);
        num_ctx = number.getContext('2d');
        num_ctx.fillStyle = "red";
        num_ctx.fillRect(0, 0, 200, 1800);
        splitRow();
        alert("识别错误的个数:"+error);
        }
        function splitRow() {
            var tempheight = 51;
            for (var i = 0; i < 31; i++) {

                if (i < 10) {
                    var rowData = line_ctx.getImageData(0, 0.9 + i * 52.8, 200, 44);
                    row_ctx.putImageData(rowData, 0, i * tempheight);
                    splitNum(rowData, i, 3)
                } else if (i < 20) {
                    var rowData = line_ctx.getImageData(0, 0.1 + i * 52.8100, 200, 44);
                    row_ctx.putImageData(rowData, 0, i * tempheight);
                    splitNum(rowData, i, 2)
                } else {
                    var rowData = line_ctx.getImageData(0, 0.1 + i * 52.8200, 200, 44);
                    row_ctx.putImageData(rowData, 0, i * tempheight);
                    splitNum(rowData, i, 0)
                }

            }

        }

        //        row_ctx.drawImage(img,327,428,200,1581,0,0,200,1581);
        function splitNum(rowData, seq, startH) {
            var number = document.getElementById("number");
            var num = number.getContext('2d');
            num.clearRect(0, 0, 200, 52);
            num.putImageData(rowData, 0, 0);
            var num_t = startH;
            var num_w = 35;
            var num_h = 48 - num_t;
            var numData1 = num.getImageData(22, num_t, num_w, num_h);
            var resultString = splitStroke(numData1, seq, 0) + "";
            var numData2 = num.getImageData(62, num_t, num_w, num_h);
            resultString = resultString + splitStroke(numData2, seq, 500) + " : ";
            var numData3 = num.getImageData(107, num_t, num_w, num_h);
            resultString = resultString + splitStroke(numData3, seq, 1000);
            var numData4 = num.getImageData(148, num_t, num_w, num_h);
            resultString = resultString + splitStroke(numData4, seq, 1500);
            //            alert(resultString.toString);
            result_div(resultString);
            num.putImageData(numData1, 0, seq * 51);
            num.putImageData(numData2, 50, seq * 51);
            num.putImageData(numData3, 100, seq * 51);
            num.putImageData(numData4, 150, seq * 51);
        }


        //        num.drawImage(img,327,428,200,1581,0,0,200,1581);

        function splitStroke(numData, seq, leftP) {


            var a, b, c, d, e, f, g;
            var aw = 16;
            var ah = 6;
            var ah2 = 9;
            var bw = 7;
            var bw2 = 9;
            var bh = 10;
            var start_x = 0;
            var start_y = 0;
            var ax = start_x + bw,
                ay = start_y;
            var bx = aw + ax,
                by = ay + ah;
            var cx = bx,
                cy = by + ah + bh;
            var dx = ax,
                dy = ay + ah * 2 + 2 * bh;
            var ex = start_x,
                ey = cy;
            var fx = start_x,
                fy = by;
            var gx = ax,
                gy = by + bh;
            stro.putImageData(numData, 0, 0);
            a = stro.getImageData(ax, ay, aw, ah2);
            b = stro.getImageData(bx - 1, by, bw2, bh);
            c = stro.getImageData(cx-1,cy, bw2, bh);
            d = stro.getImageData(dx, dy-1, aw, ah2);
            e = stro.getImageData(ex, ey, bw2, bh);
            f = stro.getImageData(fx, fy, bw2, bh);
            g = stro.getImageData(gx, gy-1, aw, ah2);
            var arr = [a, b, c, d, e, f, g];
            var result_num = [0, 0, 0, 0, 0, 0, 0]
            for (var i = 0; i < 7; i++) {
                stro.putImageData(arr[i], 50 * i + leftP, seq * 51);
                result_num[i] = judgeStro2(arr[i]);
            }

            return judgeNum(result_num)
        }

        function judgeStro2(temArr) {
            var sum = 0;
            var boundary = 200;
            var judgelittle = 0.02;
            var judgelittlesum = 0.02;
            var judgebig = 0.90;
            var judgebigsum=0.70;
            var times = 50;
            var temdata = temArr.data;
            var temwidth = temArr.width;
            var temheight = temArr.height;
            //            alert(temheight);
            var sum = 0
            if (temwidth > 9) {
                for (var i = 0; i < temwidth; i++) {
                    var temsum = 0
                    for (var j = 0; j < temheight; j++) {
                        if (temdata[j * temwidth * 4 + i * 4] < boundary) {
                            temsum += 1;
                        }
                    }
                    if (temsum / temheight > judgelittle) {
                        sum += 1;
                    }
                }
                //                alert(sum/temwidth);
                if (sum / temwidth > judgebig) {
                    return 1;
                } else if (sum / temwidth > 0.6) {
                    var sum2 = 0;
                    for (var i = 0; i < temwidth - 0; i++) {
                        var temsum = 0
                        for (var j = 1; j < temheight-1; j++) {
                            if (temdata[j * temwidth * 4 + i * 4] < boundary) {
                                temsum+=1;
//                                temsum += (temwidth / 2 - Math.abs(i - temwidth / 2));
                            }
                        }
                        var sumheight = temheight;
                        if (temsum / sumheight > judgelittlesum) {
                            sum2 += 1;
                        }
                    }
                    if (sum2 / (temwidth-2) > judgebigsum) {
                        return 1;
                    } else {
                        return 0;
                    }
                } else {
                    return 0;
                }

            } else {
                for (var i = 0; i < temheight; i++) {
                    var temsum = 0
                    for (var j = 0; j < temwidth; j++) {
                        if (temdata[i * temwidth * 4 + j * 4] < boundary) {
                            temsum += 1;
                        }
                    }
                    if (temsum / (temwidth) > judgelittle) {
                        sum += 1;
                    }
                }
                //                alert(sum/temwidth);
                if (sum / temheight > judgebig) {
                    return 1;
                } else if (sum / temheight > 0.6) {
                    var sum2 = 0;
                    for (var i = 1; i < temheight-1 ; i++) {
                        var temsum = 0
                        for (var j = 0; j < temwidth; j++) {
                            if (temdata[i * temwidth * 4 + j * 4] < boundary) {
                                temsum += 1;
//                                temsum += (temheight / 2 - Math.abs(i - temheight / 2));
                            }
                        }
                        if (temsum / temwidth > judgelittlesum) {
                            sum2 += 1;
                        }
                    }
                    if (sum2 / (temheight-2) > judgebigsum) {
                        return 1;
                    } else {
                        return 0;
                    }

                } else {
                    return 0;
                }
            }
        }

        function judgeNum(tem_result) {
            var none = "0,0,0,0,0,0,0";
            var one = "0,1,1,0,0,0,0";
            var two = "1,1,0,1,1,0,1";
            var three = "1,1,1,1,0,0,1";
            var four = "0,1,1,0,0,1,1";
            var five = "1,0,1,1,0,1,1";
            var six = "1,0,1,1,1,1,1";
            var seven = "1,1,1,0,0,0,0";
            var eight = "1,1,1,1,1,1,1";
            var nine = "1,1,1,1,0,1,1";
            var zero = "1,1,1,1,1,1,0";
            var result_str = tem_result.toString();
            switch (result_str) {
                case none:
                    return "";
                    break;
                case one:
                    return 1;
                    break;
                case two:
                    return 2;
                    break;
                case three:
                    return 3;
                    break;
                case four:
                    return 4;
                    break;
                case five:
                    return 5;
                    break;
                case six:
                    return 6;
                    break;
                case seven:
                    return 7;
                    break;
                case eight:
                    return 8;
                    break;
                case nine:
                    return 9;
                    break;
                case zero:
                    return 0;
                    break;
                default:
                    error += 1;
                    return "错";
                    break;
            }

        }

        function average(temArr) {
            var sumY = 0;
            var sumX = 0;
            var ave = 0;
            var temLen = 0;

            var w = temArr.width * 4;
            var h = temArr.height;
            //            alert("w:"+w+",h:"+h+",length:"+temLen+",w*h:"+w*h*4)
            var boundary = 125;
            var mum = 0;
            for (var i = 0; i < h; i++) {
                for (var j = 0; j < w; j += 4) {
                    mum += 1;
                    if (temArr.data[i * w + j] < boundary) {
                        sumY += i;
                        sumX += j;
                        temLen += 1;
                    }
                }
            }

            return [sumX / temLen, sumY / temLen];
        }




        //        function judgeStro(temArr) {
        //            var sum = 0;
        //            var boundary = 125;
        //            var temdata=temArr.data;
        //            var temLen = temArr.data.length;
        //            for (var i = 0; i < temLen; i++) {
        //                if (temdata[i] < boundary) {
        //                    sum += 1;
        //                } else {
        //                    sum += 0;
        //                }
        //            }
        //            var judge = sum / temLen;
        //            if (judge > 0.22) {
        //                return 1;
        //            } else {
        //                return 0;
        //            }
        //        }

        function result_div(resultSting) {
            var temDiv = document.createElement('div');
            temDiv.innerHTML = resultSting;
            temDiv.setAttribute("class", "result_list_children");
            document.getElementById("result_list").appendChild(temDiv);
        }

    </script>
</div>
