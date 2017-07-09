package com.lx.blog.util;

import java.io.File;

public class Email {
	private String encoding = "UTF-8";
	private String fromEmailAddress;
	private String fromPersonName;
	private String[] toEmailAddresses;
	private String subject;
	private String content;
	private File attachment;
	
	public String getEncoding() {
		return encoding;
	}

	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}

	public String getFromEmailAddress() {
		return fromEmailAddress;
	}

	public void setFromEmailAddress(String fromEmailAddress) {
		this.fromEmailAddress = fromEmailAddress;
	}

	public String getFromPersonName() {
		return fromPersonName;
	}

	public void setFromPersonName(String fromPersonName) {
		this.fromPersonName = fromPersonName;
	}

	public String[] getToEmailAddresses() {
		return toEmailAddresses;
	}

	public void setToEmailAddresses(String[] toEmailAddresses) {
		this.toEmailAddresses = toEmailAddresses;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public File getAttachment() {
		return attachment;
	}

	public void setAttachment(File attachment) {
		this.attachment = attachment;
	}
}
