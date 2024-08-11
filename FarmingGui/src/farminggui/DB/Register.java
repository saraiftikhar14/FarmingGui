/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farminggui.DB;

import farminggui.services.UserService;
import java.sql.ResultSet;
import java.sql.SQLException;
import models.User;

/**
 *
 * @author MALIK IMRAN
 */
public class Register
{

public String email;
public String password;
public String id;
private Db database;
Register(String email, String password){
     //        Register rs = new Register();
//        rs.show();
          this.database = new Db("localhost:3306","farmmanagerandanalyzer");
        this.database.setUser("root");
//        database.createConnection();
//        ResultSet rs=database.selectQuery("Select * from animal;");
//        System.out.println(Db.getNumberOfRows(rs));
        // function rows 
//        System.out.println(rs.getString(2));  
//        boolean insert=database.insertOrUpdateQuery("INSERT INTO users (name, password) VALUES ('baar','123'), ('oban','123');");
//        database.insertOrUpdateOrDeleteQuery("DELETE from users where users.Name='badar';");
//        System.out.println(insert);,
    this.email = email;
    this.password=password;
 }

public boolean isUserExists(){
    try{
      this.database.createConnection();
      String sql="SELECT * From organization where Email='"+this.email+"';";
     ResultSet rs = this.database.selectQuery(sql);
    
       boolean has= rs.next();
         this.database.closeConnection();
         return has;
    }catch(SQLException e){
       return true; 
    }

 }
public boolean registerUser(){
       
    try{this.database.createConnection();
     String sql = "INSERT INTO Organization (Email,Password) VALUES ('"+this.email+"','"+this.password+"');";
       this.database.insertOrUpdateOrDeleteQuery(sql); 
       
       UserService.email=this.email;
     String sql2="SELECT OrganizationID From organization where Email='"+this.email+"';";
     ResultSet rs = this.database.selectQuery(sql2);
       UserService.userId=rs.getString(0);
       rs.absolute(0);
       this.id=rs.getString(1);
       this.database.closeConnection();
        System.out.println("id"+this.id);
       return true;
    }catch(SQLException e){
        System.out.println("Already exists");
        return false;
    }
   
}
public boolean signIn(){
  try{this.database.createConnection();

       
       UserService.email=this.email;
      ResultSet rs = this.database.selectQuery("SELECT OrganizationID From organization where Email='"+this.email+"' And Password='"+this.password+"';");
       this.id=UserService.userId=rs.getString(0);
       
 
       if(!rs.next())return false;
       this.database.closeConnection();      
       return true;
    }catch(SQLException e){
        return false;
    }
      
}
 
public static void main(String[] args)
    {
        
        Register reg;
        reg = new Register("Cargxi@ll","1234");
        System.out.println("Sign "+ reg.signIn());
        System.out.println("Id "+ reg.id);
        
     
    


}

}



 