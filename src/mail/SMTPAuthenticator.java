package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator{
	protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("jihun85112","didwlgns");
        //네이버 아이디와 비밀번호
	}
}
