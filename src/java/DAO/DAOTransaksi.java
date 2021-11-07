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
import pojo.TblTrx;

/**
 *
 * @author LENOVO
 */
public class DAOTransaksi {
    public void addTrx(TblTrx trx) {
        Transaction trans = null;
        Session session = RentalMobilUtil.getSessionFactory().openSession();
        try {
            trans = session.beginTransaction();
            session.save(trx);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    public void deleteTransaksi(String idT) {
        Transaction trans = null;
        Session session = RentalMobilUtil.getSessionFactory().openSession();
        try {
            trans = session.beginTransaction();
            TblTrx trx = 
            (TblTrx) session.load(TblTrx.class, new String(idT));
            
            session.delete(trx);
            
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<TblTrx> getbyID(String idT) {
        TblTrx trx = new TblTrx();
        List<TblTrx> ltrx = new ArrayList();
        
        Transaction trans = null;
        Session session = RentalMobilUtil.getSessionFactory().openSession();
        try {
            trans = session.beginTransaction();
            Query query = 
            session.createQuery("from TblTrx where id_trx= :id");
            query.setString("id", idT);
            trx = (TblTrx) query.uniqueResult();
            ltrx = query.list();
            trans.commit();
        } catch (Exception e) {
        }
        return ltrx;
        
    }    

    public List<TblTrx> retrieveTblTrx() {
        
        List stud = new ArrayList();
        TblTrx stud1 = new TblTrx();
        Transaction trans = null;
        Session session = RentalMobilUtil.getSessionFactory().openSession();
        try {
            trans = session.beginTransaction();
            Query query = session.createQuery("from TblTrx");
            stud = query.list();
            //stud.add(stud1.getTanggal());
            //stud.add(stud1.getPelangganId());
            trans.commit();
        } catch (Exception e) {
        }
        return stud;
    }
    

    public void updateTrx(TblTrx trx) {
        Transaction trans = null;
        Session session = RentalMobilUtil.getSessionFactory().openSession();
        try {
            trans = session.beginTransaction();
            session.update(trx);
            trans.commit();
        } catch (Exception e) {
        }
    }    
      
    
}
