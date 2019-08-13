/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

/**
 *
 * @author linux
 */
import java.sql.*;
public class Dbconnection {
   static final String DRIVER = "com.mysql.cj.jdbc.Driver";
  static final String DB_URL = "jdbc:mysql://localhost:3306/store";
  static final String DB_USER = "admin";
  static final String DB_PASSWORD = "admin";
  Connection connection;

  public Dbconnection(){
    connect();
  }

  public void connect(){
    try{
      Class.forName(DRIVER);
      connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }catch(SQLException|ClassNotFoundException e){
      System.out.println("ERROR connecting to database!");
      System.out.println(e.toString());
    }
  }

  public ResultSet select(String query){
    try{
      Statement statement = connection.createStatement();
      ResultSet result = statement.executeQuery(query);
      return result;
    }catch(SQLException e){
      System.out.println("ERROR while executing select query!");
      System.out.println(e.toString());
      return null;
    }
  }

  public int update(String query){
    try{
      Statement statement = connection.createStatement();
      return statement.executeUpdate(query);
    }catch(SQLException e){
      System.out.println("ERROR while executing update query");
      System.out.println(e.toString());
      return -1;
    }
  }

  public int delete(String query){
    try{
      Statement statement = connection.createStatement();
      return statement.executeUpdate(query);
    }catch(SQLException e){
      System.out.println("ERROR while deleting line!");
      System.out.println(e.toString());
      return -1;
    }
  }
  public boolean insert(String query){
    try{
      Statement statement = connection.createStatement();
      return statement.execute(query);
    }catch(SQLException e){
      System.out.println("ERROR while deleting line!");
      System.out.println(e.toString());
      return false;
    }
  }
  

  public void close(){
    try{
      connection.close();
    }catch(SQLException e){
      System.out.println("ERROR while closing connections!");
      System.out.println(e.toString());
    }
  }

}