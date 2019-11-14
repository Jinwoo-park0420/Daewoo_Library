package com.spring.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

import com.spring.domain.EmailVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class EmailSender {
	
	@Autowired
	protected JavaMailSender mailSender;
	
	public void SendEmail(EmailVO email) throws Exception{
		MimeMessage msg = mailSender.createMimeMessage();
		try {
		msg.setSubject(email.getSubject());
		msg.setText(email.getContent());
		msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
		
		} catch (MessagingException e) {
			log.info("MessagingException 에러");
			e.printStackTrace();
		}
		
		try {
			mailSender.send(msg);
		} catch (MailException e) {
			log.info("MailException 에러 발생");
			e.printStackTrace();
		}
		
	}
}
