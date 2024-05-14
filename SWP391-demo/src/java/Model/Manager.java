/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author lucdz
 */
public class Manager {
    String username,password,name,email, managedByAdmin;
    
    public Manager() {
    }
    
    public Manager(String username, String password, String name, String email, String managedByAdmin) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.managedByAdmin = managedByAdmin;
    }
    
     public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getManagedByAdmin() {
        return managedByAdmin;
    }

    public void setManagedByAdmin(String managedByAdmin) {
        this.managedByAdmin = managedByAdmin;
    }
}
