package model;

import java.sql.Date;

public class Member {
	
	private int id;
	private String username;
	private String password;
	private String fullname;
	private Date dateofbirth;
	private String email;
	private String phone;
	private String securityId;
	private String address;
	private String gender;
	private String role;
	
	public Member(int id, String username, String password, String fullname, Date dateofbirth, String email,
			String phone, String securityId, String address, String gender, String role) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.dateofbirth = dateofbirth;
		this.email = email;
		this.phone = phone;
		this.securityId = securityId;
		this.address = address;
		this.gender = gender;
		this.role = role;
	}
	
	public Member(String username, String password, String fullname, Date dateofbirth, String email,
			String phone, String securityId, String address, String gender, String role) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.dateofbirth = dateofbirth;
		this.email = email;
		this.phone = phone;
		this.securityId = securityId;
		this.address = address;
		this.gender = gender;
		this.role = role;
	}
	
	public Member(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public Date getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(Date dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSecurityId() {
		return securityId;
	}
	public void setSecurityId(String securityId) {
		this.securityId = securityId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", username=" + username + ", password=" + password + ", fullname=" + fullname
				+ ", dateofbirth=" + dateofbirth + ", email=" + email + ", phone=" + phone + ", securityId="
				+ securityId + ", address=" + address + ", gender=" + gender + ", role=" + role + "]";
	}
	
}
