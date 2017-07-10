package com.lx.blog.util;
import static org.junit.Assert.assertEquals;
import org.junit.Test;

/**
 * 返回的是阿拉伯数字,大写字母,小写字母的混合字符串
 * @author lakeslove
 *
 */
public class RandomCodeUtilTests {
	@Test
	public void createNumberAndLetterCodeTest(){
		String code = RandomCodeUtil.createNumberAndLetterCode(4);
		System.out.println(code);
		assertEquals(4,code.length());
	}
}
