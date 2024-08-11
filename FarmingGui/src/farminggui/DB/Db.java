/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farminggui.DB;

import java.sql.*;

/**
 *
 * @author MALIK IMRAN
 */
public class Db
{

    private String URL;
    private String user = "";
    private String password = "";
    public static Connection con;

    public Db(String URL, String database)
    {
        this.URL = "jdbc:mysql://" + URL + "/" + database;

    }
    public static int getNumberOfRows(ResultSet rs) throws SQLException{
         int size = 0;
        while (rs.next()) {
            size++;
        }
        return size;
    
    }

    public void createConnection()
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
//Connection con=DriverManager.getConnection(this.URL,this.user,this.password);
            con = DriverManager.getConnection(this.URL, this.user, this.password);
            System.out.println("connected");

        } catch (ClassNotFoundException | SQLException e)
        {
            System.out.println(e);

        }

    }

    public ResultSet getAllRows(String table)
    {
        ResultSet rs = null;
        try
        {
            Statement stmt = this.con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            String sql = "select * from " + table + ";";
            rs = stmt.executeQuery(sql);
            System.out.print("Sucess");
        } catch (SQLException e)
        {
            System.out.print("And erro occur");
        }
        return rs;

    }

    public void setUser(String user)
    {
        this.user = user;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public ResultSet selectQuery(String query)
    {
        ResultSet rs = null;
        try
        {
             Statement stmt = this.con.createStatement();
            String sql = query;
            rs = stmt.executeQuery(sql);
            System.out.print("Sucess");
            return rs;
        } catch (SQLException e)
        {
            System.out.print("And erro occur" + e.toString());
        }
        return rs;
    }
    
      public boolean insertOrUpdateOrDeleteQuery(String query)
    {
        boolean rs = false;
        try
        {
            Statement stmt = this.con.createStatement();
            String sql = query;
            int rowEffected = stmt.executeUpdate(sql);
            System.out.print("Rows effected : "+rowEffected);
            rs=true;
           return rs;
        } catch (SQLException e)
        {
            System.out.print("And erro occur" + e.toString());
            
        }
        return rs;
    }
    

    public void closeConnection()
    {
        try
        {
             con.close();
        } catch (Exception e)
        {
            System.out.println("Unable");
        }

       
    }
}
