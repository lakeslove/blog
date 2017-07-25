package com.lx.blog.util;

import java.util.Random;

/**
 * 返回的是阿拉伯数字,大写字母,小写字母的混合字符串
 * @author lakeslove
 *
 */
public class RandomCodeUtil {
	public static String createNumberAndLetterCode(int length){
		if(length<=0){
			return null;
		}
		StringBuilder code = new StringBuilder(length);
		int choose = 0;
		for(int i = 0;i<length;i++){
			choose = getRandomNumber(3);
			switch(choose){
			case 0 :
				code.append(getRandomCapital());
				break;
			case 1 :
				code.append(getRandomNumber(10));
				break;
			case 2 :
				code.append(getRandomLowercase());
				break;
			default :
				code.append(getRandomNumber(10));
				break;
			}
		}
		return code.toString();
	}
	
	/**
	 * 随机数的范围是[0,range),前闭后开
	 * @param range
	 * @return
	 */
	public static int getRandomNumber(int range){
		int number = new Random().nextInt(range);
		return number;
	}
	
	public static char getRandomCapital(){
		char capital = (char) ('A'+getRandomNumber(26));
		return capital;
	}
	
	public static char getRandomLowercase(){
		char lowercase = (char) ('a'+getRandomNumber(26));
		return lowercase;
	}
}
