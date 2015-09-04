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
public class PDFacca {

    Document document_accad;
    Paragraph p5;

    public PDFacca() {
        try {
            document_accad = new Document();

            PdfWriter.getInstance(document_accad, new FileOutputStream("C:/Documents and Settings/matteo grandi/Desktop/PDFAcca.pdf"));
            // PdfWriter.getInstance(document_accad, new FileOutputStream("C:/Documents and Settings/dario.fontana/Desktop/PDFacca.pdf"));
            document_accad.open();

            p5 = new Paragraph("INFORMAZIONI ACCADEMICHE", FontFactory.getFont(
                    FontFactory.HELVETICA, 16));

            p5.add("\n\n");
            document_accad.add(p5);

        } catch (DocumentException e) {
            System.out.println(e.getMessage());
        } catch (IOException e) {
            System.err.println(e.getMessage());
        }
    }

    public void PdfAccad(int z, String tipo_dip, String data_dip,
            String voto_dip, String data_imma) {

        try {
            Paragraph p6 = new Paragraph("", FontFactory.getFont(FontFactory.TIMES_ROMAN, 15));

            Paragraph p7 = new Paragraph("", FontFactory.getFont(FontFactory.HELVETICA, 10));

            p6.add("       " + tipo_dip + "\n");
            p7.add("              DATA DIPLOMA: " + data_dip + "\n");
            p7.add("              VOTO DIPLOMA: " + voto_dip + "\n");
            p7.add("              DATA IMMATRICOLAZIONE: " + data_imma + "\n");
            p7.add("\n");

            document_accad.add(p6);
            document_accad.add(p7);
        } catch (DocumentException e) {
            System.err.println(e.getMessage());
        }
    }

     public void chiudiPdf(){
            document_accad.close();
            }

}
