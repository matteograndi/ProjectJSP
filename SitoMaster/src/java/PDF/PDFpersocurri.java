/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package PDF;

import java.io.*;
import com.lowagie.text.*;
import com.lowagie.text.pdf.PdfWriter;

/**
 *
 * @author matteo grandi
 */
public class PDFpersocurri {

    Document document=new Document();

    public PDFpersocurri(){}

    public void Pdf_pers(String username,String pwd,String nome,String cogn,String datanasc,String luonasc,String naz,
            String indirizzo,String cittˆ,String cap,String provincia,String doc,String n_doc,String tel,String email,
            String qualif, String esp, String ins, String motivi) {

        try{
        PdfWriter.getInstance(document, new FileOutputStream("C:/Documents and Settings/matteo grandi/Desktop/PDFpersocurri.pdf"));

            document.open();

            Paragraph p1 = new Paragraph(new Phrase("INFORMAZIONI PERSONALI", FontFactory.getFont(
                    FontFactory.HELVETICA, 16)));
            p1.add("\n");
            Paragraph p2 = new Paragraph("",FontFactory.getFont(FontFactory.HELVETICA, 10));
            p2.add("USERNAME: " + username + "\n");
            p2.add("PASSWORD: " + pwd + "\n");
            p2.add("NOME: " + nome + "\n");
            p2.add("COGNOME: " + cogn + "\n");
            p2.add("DATA DI NASCITA: " + datanasc + "\n");
            p2.add("LUOGO DI NASCITA: " + datanasc + "\n");
            p2.add("NAZIONE: " + naz + "\n");
            p2.add("INDIRIZZO: " + indirizzo + "\n");
            p2.add("CITTA': " + cittˆ + "\n");
            p2.add("CAP: " + cap + "\n");
            p2.add("PROVINCIA: " + provincia + "\n");
            p2.add("DOCUMENTO IDENTITA': " + doc + "\n");
            p2.add("N¡ DOCUMENTO: " + n_doc + "\n");
            p2.add("TELEFONO: " + tel + "\n");
            p2.add("EMAIL: " + email + "\n");
            p2.add("\n\n");
            document.add(p1);
            document.add(p2);

            Paragraph p3 = new Paragraph(new Phrase("CURRICULUM VITAE", FontFactory.getFont(
                    FontFactory.HELVETICA, 16)));
            p3.add("\n");
            Paragraph p4 = new Paragraph("",FontFactory.getFont(FontFactory.HELVETICA, 10));
            p4.add("QUALIFICHE: " + qualif + "\n");
            p4.add("ESPERIENZE: " + esp + "\n");
            p4.add("INSEGNAMENTI: " + ins + "\n");
            p4.add("MOTIVAZIONI: " + motivi + "\n");
            p4.add("\n\n");
            document.add(p3);
            document.add(p4);

        } catch (DocumentException de) {
            System.err.println(de.getMessage());
        } catch (IOException ioe) {
            System.err.println(ioe.getMessage());
        }
        document.close();
    }

}
