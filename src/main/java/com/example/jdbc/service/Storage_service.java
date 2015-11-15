package com.example.jdbc.service;

import java.util.ArrayList;
import java.util.List;

import com.example.jdbc.domain.Klub;
import com.example.jdbc.domain.Koncert;
import com.example.jdbc.domain.Zespol;
import com.example.jdbc.domain.Zespol_has_koncert;

import javax.persistence.criteria.Order;

public class Storage_service {

    public List<Klub> klubs = new ArrayList<Klub>();
    public List<Zespol> zespols = new ArrayList<Zespol>();
    public List<Koncert> koncerts = new ArrayList<Koncert>();
    public List<Zespol_has_koncert> zespol_has_koncerts = new ArrayList<Zespol_has_koncert>();

    public void add(Klub klub){
        Klub newKlub = new Klub(klub.getMiasto(), klub.getNazwa(), klub.getIlosc_miejsc());
        klubs.add(newKlub);
    }

    public void add(Zespol zespol){
        Zespol newZespol = new Zespol(zespol.getNazwa(), zespol.getKraj());
        zespols.add(newZespol);
    }

    public void add(Koncert koncert){
        Koncert newKoncert = new Koncert(koncert.getKlub_id(), koncert.getNazwa_koncertu(), koncert.getCeny_biletow());
        koncerts.add(newKoncert);
    }

    public void add(Zespol_has_koncert zespol_has_koncert){
        Zespol_has_koncert newZHS = new Zespol_has_koncert(zespol_has_koncert.getZespol_id(), zespol_has_koncert.getKoncert_id());
        zespol_has_koncerts.add(newZHS);
    }

    public List<Klub> getAllKlubs(){
        return klubs;
    }
    public List<Zespol> getAllZespols(){
        return zespols;
    }
    public List<Koncert> getAllKoncerts(){
        return koncerts;
    }
    public List<Zespol_has_koncert> getAllZHSs(){
        return zespol_has_koncerts;
    }

}
