/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package POSTA;

import java.security.Security;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 *
 * @author matteo grandi
 */
public class MailCasa {

    public MailCasa(String mittente, String destinatario, String testo) throws AddressException, MessagingException {
Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
// Get a Properties object
Properties props = System.getProperties();
props.setProperty("mail.smtp.host", "smtp.gmail.com");
props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
props.setProperty("mail.smtp.socketFactory.fallback", "false");
props.setProperty("mail.smtp.port", "465");
props.setProperty("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.auth", "true");
props.put( "mail.debug", "true" );
final String username = mittente;
final String password = "**********";
Session session = Session.getDefaultInstance(props, new Authenticator(){
protected PasswordAuthentication getPasswordAuthentication() {
return new PasswordAuthentication(username, password);
}});
// — Create a new message –
Message msg = new MimeMessage(session);
// — Set the FROM and TO fields –
msg.setFrom(new InternetAddress(username + ""));
msg.setRecipients(Message.RecipientType.TO,
InternetAddress.parse(destinatario,false));
msg.setSubject("Hello da gmail");
msg.setText(testo);
msg.setSentDate(new Date());
Transport.send(msg);


    }
}
