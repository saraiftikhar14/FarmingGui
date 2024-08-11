/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author MALIK IMRAN
 */
public class User
{
    public String name;
    public String email;
public String password=null;

User(String name, String email){
    this.email=email;
    this.name=name;
}

    public void setPassword(String password)
    {
        this.password = password;
    }

}
