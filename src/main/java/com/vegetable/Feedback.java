package com.vegetable;

public class Feedback {
	@Override
	public String toString() {
		return "Feedback [fid=" + fid + ", username=" + username + ", contact=" + contact + ", email=" + email
				+ ", address=" + address + ", description=" + description + ", feedbackDate=" + feedbackDate + "]";
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFeedbackDate() {
		return feedbackDate;
	}
	public void setFeedbackDate(String feedbackDate) {
		this.feedbackDate = feedbackDate;
	}
	private int fid;
	private String username;
	private String contact;
	private String email;
	private String address;
	private String description;
	private String feedbackDate;
	public Feedback() {
		
	}
	public Feedback(String username, String contact, String email, String address, String description,
			String feedbackDate) {
		super();
		this.username = username;
		this.contact = contact;
		this.email = email;
		this.address = address;
		this.description = description;
		this.feedbackDate = feedbackDate;
	}
	
	
}
