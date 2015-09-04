/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package POSTA;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
/**
 *
 * @author matteo grandi
 */
public class Mail {

    public Mail(String mittente, String destinatario, String testo){

        try{
            Properties props = System.getProperties();
            props.put("mail.smpt.host", "alpha.science.unitn.it");
            props.put("mail.debug", "true");
            Session session = Session.getDefaultInstance(props);
            Message message = new MimeMessage(session);
            InternetAddress from = new InternetAddress(mittente);
            InternetAddress to[] = InternetAddress.parse(destinatario);
            message.setFrom(from);
            message.setRecipients(Message.RecipientType.TO, to);
            message.setSubject("Registrazione conferma a Sito Master");
            message.setSentDate(new Date());
            message.setText(testo);
            Transport.send(message);
        }catch(MessagingException me){
            me.printStackTrace();
        }
    }
   
}
