package database.connection.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import database.connection.bean.DBbean;


public class DBConnection {
	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/edubridge","root","root");
		}catch(Exception e){System.out.println(e);}
		return con;
	}
	public static int save(DBbean u){
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("insert into users(userid,password,fname,lname,email) values(?,?,?,?,?)");
			ps.setString(1,u.getuserid());
			ps.setString(2,u.getpassword());
			ps.setString(3,u.getfname());
			ps.setString(4,u.getlname());
			ps.setString(5,u.getemail());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
	}
	public static int update(DBbean u){
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("update users set password=?,fname=?,lname=?,email=? where userid=?");
			
			ps.setString(1,u.getpassword());
			ps.setString(2,u.getfname());
			ps.setString(3,u.getlname());
			ps.setString(4,u.getemail());
		    ps.setString(5,u.getuserid());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
	}
	public static int delete(DBbean u){
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("delete from users where userid=?");
			ps.setString(1,u.getuserid());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}

		return status;
	}
	public static List<DBbean> getAllRecords(){
		List<DBbean> list=new ArrayList<DBbean>();
		
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from users");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				DBbean u=new DBbean();
				u.setuserid(rs.getString("userid"));
				u.setpassword(rs.getString("password"));
				u.setfname(rs.getString("fname"));
				u.setlname(rs.getString("lname"));
				u.setemail(rs.getString("email"));
				
				list.add(u);
			}
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	public static DBbean getRecordById(String userid){
		DBbean u=null;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from users where userid=?");
			ps.setString(1,userid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				u=new DBbean();
				u.setuserid(rs.getString("userid"));
				u.setpassword(rs.getString("password"));
				u.setfname(rs.getString("fname"));
				u.setlname(rs.getString("lname"));
				u.setemail(rs.getString("email"));
				
			}
		}catch(Exception e){System.out.println(e);}
		return u;
	}
	}

		
		