package login;
import com.sun.xml.rpc.processor.modeler.j2ee.xml.string;
import config.Dbconnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class LoginBean 
{  
  private String name,password, clg; 
  String d_userid;
  String d_password;
  String d_clg;
  public String getName() 
  {  
    return name;  
  }  
  public void setName(String name) 
  {  
    this.name = name;  
  }  
  public String getPassword() 
  {  
    return password;  
  }  
  public void setPassword(String password) 
  {  
    this.password = password;  
  }  
  public void setClg(String clg)
  {
    this.clg = clg;
  }
  public String getClg()
  {
    return clg;
  }
  public boolean validate() throws ClassNotFoundException, SQLException
  {         
    Class.forName("com.mysql.cj.jdbc.Driver");  
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/store","admin","admin");
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select * from login where userid='"+name+"' and  password ='"+password+"' and clg = '"+clg+"'");
    while(rs.next())
    {
      d_userid = rs.getString("userid");
      d_password = rs.getString("password");
      d_clg = rs.getString("clg");
    }
    if(password.equals(d_password))
    {
      if(name.equals(d_userid))
      {
        if(clg.equals(d_clg))
          return true;
      }
    }  
    else
    {  
      return false;  
    }
  return false;
  }
}