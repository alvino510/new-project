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
import pojo.TblAdmin;

/**
 *
 * @author LENOVO
 */
public class DAOLogin {
    public List<TblAdmin> getBy(String uName, String uPass) {
        TblAdmin a = new TblAdmin();
        List<TblAdmin> admin = new ArrayList();
        
        Transaction trans = null;
        Session session = RentalMobilUtil.getSessionFactory().openSession();
        try {
            trans = session.beginTransaction();
            Query query = session.createQuery("from TblAdmin where username="
            + " :uName AND password= :uPass");
            query.setString("uName", uName);
            query.setString("uPass", uPass);
            a = (TblAdmin) query.uniqueResult();
            admin = query.list();
            
            trans.commit();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return admin;
    }
}
