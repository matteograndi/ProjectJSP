/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package USODATA;

import java.util.*;

import java.io.Serializable;
import java.util.Date;
//import java.util.Calendar;

import java.text.SimpleDateFormat;

/**
 *
 * @author matteo grandi
 */
public class Usodata {

    public Usodata() {
    }

    public String ErrorNascita(String anno, String mese, String giorno) {
        if ((anno.equals("")) || (mese.equals("")) || (giorno.equals(""))) {
            return "<li> Compila tutti i campi della tua data di nascita.\n";
        } else {

            Date d = new Date();
            String dat = anno + "/" + mese + "/" + giorno;

            SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");

            try {
                d = df.parse(dat);
            } catch (Exception e) {
                return "<li> I valori della tua data di nascita sono errati.\n";
            }
            return "";
        }
    }

    public String ErrorConseguimento(String anno, String mese, String giorno) {
        if ((anno.equals("")) || (mese.equals("")) || (giorno.equals(""))) {
            return "<li> Compila tutti i campi della tua data di conseguimento.\n";
        } else {

            Date d = new Date();
            String dat = anno + "/" + mese + "/" + giorno;

            SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");

            try {
                d = df.parse(dat);
            } catch (Exception e) {
                return "<li> I valori della tua data di conseguimento sono errati.\n";
            }
            return "";
        }
    }

    public String ErrorImmatricolazione(String anno, String mese, String giorno) {
        if ((anno.equals("")) || (mese.equals("")) || (giorno.equals(""))) {
            return "<li> Compila tutti i campi della tua data di immatricolazione.\n";
        } else {

            Date d = new Date();
            String dat = anno + "/" + mese + "/" + giorno;

            SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");

            try {
                d = df.parse(dat);
            } catch (Exception e) {
                return "<li> I valori della tua data di immatricolazione sono errati.\n";
            }
            return "";
        }
    }

    public String ErrorVotazione(String voto, String tot) {
        if ((voto.equals("")) || (tot.equals(""))) {
            return "<li> Compila i campi del tuo voto.\n";
        } else {
            int t;
            try {
                t = Integer.parseInt(tot);
            } catch (Exception e) {
                return "<li> I valori della tua votazione sono errati.\n";
            }
            int v;
            try {
                v = Integer.parseInt(voto);
            } catch (Exception e) {
                return "<li> I valori della tua votazione sono errati.\n";
            }
            if(v>t)
                 return "<li> I valori della tua votazione sono errati.\n" +
                         "Il voto deve essere minore del totale\n";
            return "";
        }
    }




}

