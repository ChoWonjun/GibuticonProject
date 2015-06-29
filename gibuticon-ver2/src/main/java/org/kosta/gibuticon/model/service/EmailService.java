package org.kosta.gibuticon.model.service;

import org.kosta.gibuticon.model.email.EmailVO;

public interface EmailService {

	public abstract boolean sendMail(EmailVO email) throws Exception;

}