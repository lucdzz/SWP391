/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author lucdz
 */
public class Teacher {
     private String username;
    private String password;
    private String name;
    private String email;
    private String department;
    private String managedByManager;

    public Teacher() {
    }

    public Teacher(String username, String password, String name, String email, String department, String managedByManager) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.department = department;
        this.managedByManager = managedByManager;
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

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getManagedByManager() {
        return managedByManager;
    }

    public void setManagedByManager(String managedByManager) {
        this.managedByManager = managedByManager;
    }
    
    
}
