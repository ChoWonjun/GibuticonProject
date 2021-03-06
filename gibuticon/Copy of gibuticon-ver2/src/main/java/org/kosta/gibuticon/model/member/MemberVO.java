package org.kosta.gibuticon.model.member;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;


public class MemberVO {
	@Size(min=4,max=10) // 4자 이상 ~ 10자 이하
	private String id;
	@Size(min=4,max=10)
	private String password;
	@NotEmpty
	private String name;
	@NotEmpty
	private String address;
	@NotEmpty
	private String tel;
	private String birth;
	private String admin;
	@Email
	@NotEmpty
	private String email;
	private int point;

	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String id, String password, String name, String address,
			String tel, String birth, String email) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.birth = birth;
		this.email = email;
	}

	public MemberVO(String id, String password) {
		super();
		this.id = id;
		this.password = password;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
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
				+ birth + ", admin=" + admin + ", email=" + email + ", point="
				+ point + "]";
	}

}
