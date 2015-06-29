package org.kosta.gibuticon.model.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.kosta.gibuticon.model.email.EmailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	protected JavaMailSender mailSender;

	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.service.EmailService#sendMail(org.kosta.gibuticon.model.email.EmailVO)
	 */
	@Override
	public boolean sendMail(EmailVO email) throws Exception {
		try {
			MimeMessage msg = mailSender.createMimeMessage();
			msg.setFrom("amorce27@gmail.com"); // 송신자를 설정해도 소용없지만 없으면 오류가 발생한다
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setRecipient(RecipientType.TO,
					new InternetAddress(email.getReceiver()));
			mailSender.send(msg);
			return true;
		} catch (MessagingException e) {
			System.out.println("MessagingException");
			e.printStackTrace();
		} catch (MailException e) {
			System.out.println("MailException발생");
			e.printStackTrace();
		}
		return false;
	}
}
