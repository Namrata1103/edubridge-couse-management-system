package database.connection.bean;

public class DBbean {
		private String userid;
		private String password,fname,lname,email;
		public String getuserid() {
			return userid;
		}
		public void setuserid(String userid) {
			this.userid = userid;
		}
		public String getpassword() {
			return password;
		}
		public void setpassword(String password) {
			this.password = password;
		}
		public String getfname() {
			return fname;
		}
		public void setfname(String fname) {
			this.fname = fname;
		}	
		public String getlname() {
			return lname;
		}
		public void setlname(String lname) {
			this.lname = lname;
		}
		
		public String getemail() {
			return email;
		}
		public void setemail(String email) {
			this.email = email;
		}
	}