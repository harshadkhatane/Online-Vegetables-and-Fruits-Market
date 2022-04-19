package com.vegetable;

import java.util.Date;

public class UsersDtls {
	
	private int uid;
	private String firstname;
	private String lastname;
	private String password;
	private String email;
	private String contact;
	private String city;
	private String address;
	private String img;	
	
	public UsersDtls() {
		
	}
	
	public UsersDtls(String firstname, String lastname, String password, String email,
			String contact, String city, String address, String img) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.password = password;
		this.email = email;
		this.contact = contact;
		this.city = city;
		this.address = address;
		this.img = img;
		
	}
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	public String getCity() {
		return city;
	}	
	public void setCity(String city) {
		this.city = city;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	@Override
	public String toString() {
		return "UsersDtls [uid=" + uid + ", firstname=" + firstname + ", lastname=" + lastname + ", password=" + password + ", email=" + email + ", contact=" + contact + ", city=" + city
				+ ", address=" + address + ", img=" + img + "]";
	}
}