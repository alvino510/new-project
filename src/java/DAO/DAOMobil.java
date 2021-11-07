/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.RentalMobilUtil;
import pojo.TblMobil;


/**
 *
 * @author LENOVO
 */
public class DAOMobil {
    public void addMobil(TblMobil mbl) {
        Transaction trans = null;
        Session session = RentalMobilUtil.getSessionFactory().openSession();
        try {
            trans = session.beginTransaction();
            session.save(mbl);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void deleteMobil(String idM) {
        Transaction trans = null;
        Session session = RentalMobilUtil.getSessionFactory().openSession();
        try {
            trans = session.beginTransaction();
            TblMobil mbl = 
            (TblMobil) session.load(TblMobil.class, new String(idM));
            session.delete(mbl);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<TblMobil> getbyID(String idM) {
        TblMobil mbl = new TblMobil();
        List<TblMobil> lmbl = new ArrayList();
        
        Transaction trans = null;
        Session session = RentalMobilUtil.getSessionFactory().openSession();
        try {
            trans = session.beginTransaction();
            Query query = 
            session.createQuery("from TblMobil where id_mobil= :id");
            query.setString("id", idM);
            mbl = (TblMobil) query.uniqueResult();
            lmbl = query.list();
            trans.commit();
        } catch (Exception e) {
        }
        return lmbl;
    }    

    public List<TblMobil> retrieveTblMobil() {
        
        List stud = new ArrayList();
        TblMobil stud1 = new TblMobil();
        Transaction trans = null;
        Session session = RentalMobilUtil.getSessionFactory().openSession();
        try {
            trans = session.beginTransaction();
            Query query = session.createQuery("from TblMobil");
            stud = query.list();
//            stud.add(stud1.getMerek());
//            stud.add(stud1.getTipe());
//            stud.add(stud1.getWarna());
//            stud.add(stud1.getBiaya());
            trans.commit();
        } catch (Exception e) {
        }
        return stud;
    }

    public void updateMobil(TblMobil mbl) {
        Transaction trans = null;
        Session session = RentalMobilUtil.getSessionFactory().openSession();
        try {
            trans = session.beginTransaction();
            session.update(mbl);
            trans.commit();
        } catch (Exception e) {
        }
    }    
}
