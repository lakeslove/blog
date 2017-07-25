package com.lx.blog.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;

public class ValidateUtils {

	public final static boolean isEmail(String text) {
		if (text.matches("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")) {
			return true;
		}
		return false;
	}

	public final static boolean isTelephone(String text) {
		if (text.matches("^0\\d{1,4}-\\d{1,4}-\\d{4}$")) {
			return true;
		}
		return false;
	}

	public final static boolean isMobilephone(String text) {
		if (text.matches("^0[89]0-\\d{1,4}-\\d{4}$")) {
			return true;
		}
		return false;
	}

	public final static boolean isDate(String year, String month, String day) {
		String birth = year + month + day;
		if (birth.matches("^((\\d{2}(([02468][048])|([13579][26]))[\\-\\/\\s]?((((0?[13578])|"
				+ "(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))"
				+ "[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|"
				+ "([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))"
				+ "[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|"
				+ "(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?"
				+ "((0?[1-9])|(1[0-9])|(2[0-8]))))))")) {
			return true;
		}
		return false;
	}

	/**
	 * 忽略生日，只按年来计算岁数
	 * @param birthdayYear
	 * @return
	 */
	public final static int birthdayYearToAge(int birthdayYear) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String systemTime = df.format(new Date());
		int year = Integer.parseInt(systemTime.substring(0, 4));
		int age = year - birthdayYear;
		return age;
	}

	/**
	 * 按出生年月来计算岁数
	 * @param birthday
	 * @return
	 */
	public static int birthdayToAge(Date birthday) {
		Calendar cal = Calendar.getInstance();

		if (cal.before(birthday)) {
			throw new IllegalArgumentException("The birthDay is before Now.It's unbelievable!");
		}

		int yearNow = cal.get(Calendar.YEAR);
		int monthNow = cal.get(Calendar.MONTH) + 1;
		int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH);

		cal.setTime(birthday);
		int yearBirth = cal.get(Calendar.YEAR);
		int monthBirth = cal.get(Calendar.MONTH) + 1;
		int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH);

		int age = yearNow - yearBirth;

		if (monthNow <= monthBirth) {
			if (monthNow == monthBirth) {
				// monthNow==monthBirth
				if (dayOfMonthNow < dayOfMonthBirth) {
					age--;
				}
			} else {
				// monthNow>monthBirth
				age--;
			}
		}
		return age;
	}
}