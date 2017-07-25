package com.lx.blog.util;

import java.util.concurrent.LinkedBlockingQueue;

import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public final class SpringEmailUtil {
	public static LinkedBlockingQueue<JavaMailSender> mailSenderQueue;
	
	/**
	 * 当需要多线程发送邮件时，请先初始多个MailSender
	 * @param numberOfMailSender
	 */
	public static void initMailSenderQueue(int numberOfMailSender){
		mailSenderQueue = new LinkedBlockingQueue<JavaMailSender>(numberOfMailSender);
		for (int i = 0; i < numberOfMailSender; i++) {
			JavaMailSender mailSender = getJavaMailSender();
			mailSenderQueue.add(mailSender);
		}
	}
	
	/**
	 * 获取JavaMailSender
	 * 当想自定义邮件时，可用这个方法
	 * @return
	 */
	public static JavaMailSender getJavaMailSender() {
		JavaMailSender mailSender = SpringBeanUtil.getBean(JavaMailSender.class, "mailSender");
		return mailSender;
	}

	/**
	 * 当单独发送一封邮件时，可用这个方法
	 * @param email
	 * @throws Exception
	 */
	public static void sendEmail(Email email) throws Exception {
		if(mailSenderQueue==null||mailSenderQueue.size()==0){
			initMailSenderQueue(1);
		}
		JavaMailSender mailSender = mailSenderQueue.take();
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, email.getEncoding());
			helper.setFrom(email.getFromEmailAddress(), email.getFromPersonName());
			helper.setTo(email.getToEmailAddresses());
			helper.setSubject(email.getSubject());
			helper.setText(email.getContent());
			if (email.getAttachment() != null) {
				if (email.getAttachment().exists()) {
					helper.addAttachment(MimeUtility.encodeWord(email.getAttachment().getName(), "UTF-8", null),
							email.getAttachment());
				}
			}
			mailSender.send(message);
		} finally {
			mailSenderQueue.put(mailSender);
		}
	}
}
