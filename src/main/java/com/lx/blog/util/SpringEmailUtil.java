package com.lx.blog.util;

import java.util.concurrent.LinkedBlockingQueue;

import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public final class SpringEmailUtil {
	public static LinkedBlockingQueue<JavaMailSender> mailSenderQueue;
	
	private static void initMailSenderQueue(int numberOfMailSender){
		mailSenderQueue = new LinkedBlockingQueue<JavaMailSender>(numberOfMailSender);
		for (int i = 0; i < numberOfMailSender; i++) {
			JavaMailSender mailSender = getJavaMailSender();
			mailSenderQueue.add(mailSender);
		}
	}
	
	public static JavaMailSender getJavaMailSender() {
		JavaMailSender mailSender = SpringBeanUtil.getBean(JavaMailSender.class, "mailSender");
		return mailSender;
	}

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
