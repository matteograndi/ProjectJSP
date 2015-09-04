/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package CONTROLLOCAMPI;

import java.util.*;
/**
 *
 * @author matteo grandi
 */
public class ControlloLogin {
    private String user;
    private String password;
    private String nome;
    private String cognome;
    private String mail;
    private List<String> errorMessages;

    public ControlloLogin(){}

    public String getuser(){return (user);}
        public void setuser(String user){
        this.user=user.trim();
    }

    public String getpassword(){return (password);}
        public void setpassword(String password){
        this.password=password.trim();
    }

    public String getnome(){return (nome);}
        public void setnome(String nome){
        this.nome=nome.trim();
    }
    public String getcognome(){return (cognome);}
        public void setcognome(String cognome){
        this.cognome=cognome.trim();
    }

    public String getmail(){return (mail);}
        public void setmail(String mail){
        this.mail=mail.trim();
    }

        public String doErrori(String user, String password, String nome, String cognome, String mail){
            errorMessages = new ArrayList<String>();
            if(getuser().equals(""))
                errorMessages.add("Devi inserire un tuo accaunt d'identificazione");
            if(getpassword().equals(""))
                errorMessages.add("Devi inserire una password per l'identificazione");
            if(getnome().equals(""))
                errorMessages.add("Devi inserire il tuo nome");
            if(getcognome().equals(""))
                errorMessages.add("Devi inserire il tuo cognome");
            if(getmail().equals(""))
                errorMessages.add("Devi inserire la tua mail");
            if (errorMessages.size()>0)
                return null;
            else return("success");
        }

      public String getErrorMessagesLogin() {
          String messageList;
          if((errorMessages == null)||(errorMessages.size()==0)){
              messageList="";
          } else{
              messageList="<font COLOR=red><b><ul>\n";
              for(String mess: errorMessages) {
                  messageList = messageList + "<LI>" + mess + "\n";
              }
          messageList += "</ul></b></font>";
          }
          return messageList;
      }
}
