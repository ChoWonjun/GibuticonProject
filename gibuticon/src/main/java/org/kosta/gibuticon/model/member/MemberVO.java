package org.kosta.gibuticon.model.member;

import java.sql.Date;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String address;
	private String tel;
	private Date birth;
	private String type;
	private String email;
	private int point;

	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name="
				+ name + ", address=" + address + ", tel=" + tel + ", birth="
				+ birth + ", type=" + type + ", email=" + email + ", point="
				+ point + "]";
	}

}
