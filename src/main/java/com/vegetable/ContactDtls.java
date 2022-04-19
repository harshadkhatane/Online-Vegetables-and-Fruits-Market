package com.vegetable;

public class ContactDtls {

	private int cid;
	private String name;
	private String contact;
	private String emailid;
	private String subject;
	private String message;
	private String msgDate;
	private String isRead;
	private String password;
	public ContactDtls() {
	
	}

	public ContactDtls(String name, String contact, String emailid, String subject, String message, String msgDate,
			String isRead,String password) {
		super();
		this.name = name;
		this.contact = contact;
		this.emailid = emailid;
		this.subject = subject;
		this.message = message;
		this.msgDate = msgDate;
		this.isRead = isRead;
		this.password = password;
	}
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public String getMsgDate() {
		return msgDate;
	}
	public void setMsgDate(String msgDate) {
		this.msgDate = msgDate;
	}

	public String getIsRead() {
		return isRead;
	}
	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "ContactDtls [cid=" + cid + ", name=" + name + ", contact=" + contact + ", emailid=" + emailid
				+ ", subject=" + subject + ", message=" + message + ", msgDate=" + msgDate + ", isRead=" + isRead + ", password=" + password + "]";
	}
}
