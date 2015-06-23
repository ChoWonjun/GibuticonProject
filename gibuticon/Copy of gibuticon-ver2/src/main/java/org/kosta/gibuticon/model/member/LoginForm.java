package org.kosta.gibuticon.model.member;

import org.hibernate.validator.constraints.NotEmpty;

public class LoginForm {
	@NotEmpty
	private String id;
	@NotEmpty
	private String password;

	public LoginForm() {
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

	@Override
	public String toString() {
		return "LoginForm [id=" + id + ", password=" + password + "]";
	}

}
