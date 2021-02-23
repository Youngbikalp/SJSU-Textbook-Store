package test;


public class Member {

    private float sjsuID;
    private String firstname;
    private String lastname;
    private String username;
    private String password;
    private String salt;
    
    Member(float sjsu_ID,String firstname, String lastname,String username, String pass, String salt){
    	this.sjsuID= sjsu_ID;
    	this.firstname= firstname;
    	this.lastname= lastname;
    	this.username= username;
    	this.password=pass;
    	this.salt=salt;
    }
    
    public String getUsername() {
        return username;
    }
    
    public String getPassword() {
        return password;
    }

    public double getSjsuID() {
        return sjsuID;
    }
    public String getFirstName() {
        return firstname;
    }
    public String getLastName() {
        return lastname;
    }
    public String getSalt() {
        return salt;
    }
    

   
}