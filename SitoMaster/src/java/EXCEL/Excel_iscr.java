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
public class Excel_iscr {

    WritableWorkbook workbook;
    WritableSheet sheet;

    public Excel_iscr() {

        try {
// Apertura file
            workbook = Workbook.createWorkbook(new File("C:/Documents and Settings/matteo grandi/Desktop/CIAL/Iscritti.xls"));
// Creazione Folder
            sheet = workbook.createSheet("Iscritti", 0);

            int j = 0;
            int k = 0;
// Riga di identificazione campi
            sheet.addCell(new Label(k++,j,new String("ID UTENTE")));
            sheet.addCell(new Label(k++,j,new String("NOME")));
            sheet.addCell(new Label(k++,j,new String("COGNOME")));
            sheet.addCell(new Label(k++,j,new String("ISCRIZIONE COMPLETATA")));
            j++;

        } catch (Exception e1){}

    }

    public void scrivi_utenti(int k,int j,String id,String nome,String cognome,String iscrizione){

        try {

            sheet.addCell(new Label(k++,j,new String(id)));
            sheet.addCell(new Label(k++,j,new String(nome)));
            sheet.addCell(new Label(k++,j,new String(cognome)));
            sheet.addCell(new Label(k++,j,new String(iscrizione)));

        } catch (Exception e1){}

    }

    public void chiudi(){

        try {

            workbook.write();
            workbook.close();

        } catch (Exception e1){}

    }
}
