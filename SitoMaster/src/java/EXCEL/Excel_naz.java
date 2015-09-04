/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package EXCEL;

import jxl.*;
import jxl.write.*;
import jxl.write.WritableWorkbook;
import java.io.*;

/**
 *
 * @author matteo grandi
 */

public class Excel_naz {

    WritableWorkbook workbook_naz;
    WritableSheet sheet_naz;

    public Excel_naz() {

        try {
            // Apertura file
            workbook_naz = Workbook.createWorkbook(new File("C:/Documents and Settings/matteo grandi/Desktop/CIAL/Iscritti_nazione.xls"));
            // Creazione Folder
            sheet_naz = workbook_naz.createSheet("Nazionalita'", 0);

            int j = 0;
            int k = 0;
            // Riga di identificazione campi
            sheet_naz.addCell(new Label(k++,j,new String("NOME")));
            sheet_naz.addCell(new Label(k++,j,new String("COGNOME")));
            sheet_naz.addCell(new Label(k++,j,new String("NAZIONE")));
            sheet_naz.addCell(new Label(k++,j,new String("ISCRIZIONE COMPLETATA")));
            j++;

        } catch (Exception e1){}

    }

    public void scrivi_nazione(int k,int j,String nome,String cognome,String naz,String iscrizione){

        try {

            sheet_naz.addCell(new Label(k++,j,new String(nome)));
            sheet_naz.addCell(new Label(k++,j,new String(cognome)));
            sheet_naz.addCell(new Label(k++,j,new String(naz)));
            sheet_naz.addCell(new Label(k++,j,new String(iscrizione)));

        } catch (Exception e1){}

    }

    public void chiudi_naz(){

        try {

            workbook_naz.write();
            workbook_naz.close();

        } catch (Exception e1){}

    }

}