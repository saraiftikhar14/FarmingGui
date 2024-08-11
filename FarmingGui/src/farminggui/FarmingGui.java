/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farminggui;

import farminggui.DB.Db;
import farminggui.Database.Register;
import farminggui.Database.SelectionTools;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author MALIK IMRAN
 */
public class FarmingGui
{

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException
    {
        
         

     
     

//        Db  database;
        // TODO code application logic here
//        Register rs = new Register();
//        rs.show();
//        Db database = new Db("localhost:3306","farmmanagerandanalyzer");
//        database = new Db("localhost:3306","mydb");
//
//        database.setUser("root");
//        database.createConnection();
//        ResultSet rs=database.selectQuery("Select * from animal;");
//        System.out.println(Db.getNumberOfRows(rs));
//        rs.absolute(1);
        // function rows 
//        System.out.println(rs.getString(0));  
        
//        boolean insert=database.insertOrUpdateQuery("INSERT INTO users (name, password) VALUES ('baar','123'), ('oban','123');");
//        database.insertOrUpdateOrDeleteQuery("DELETE from users where users.Name='badar';");
////        System.out.println(insert);,
        java.awt.EventQueue.invokeLater(new Runnable()
        {
            public void run()
            {
                new Register().setVisible(true);
            }
        });

    }

}
