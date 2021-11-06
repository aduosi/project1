package mybean.data;
public class ModifyMessage{
   private String logname;
   private int newAge;
   private String newSex;
   private String newPhone;
   private String newEmail;
   private String newMessage;
   private String backNews; 
   public int getNewAge() {
	return newAge;
}
public void setNewAge(int newAge) {
	this.newAge = newAge;
}
public String getNewSex() {
	return newSex;
}
public void setNewSex(String newSex) {
	this.newSex = newSex;
}
   public void setLogname(String name){
      logname=name;
   }
   public String getLogname(){
      return logname;
   }
   public void setNewEmail(String em){
      newEmail=em;
   }
   public String getNewEmail(){
      return newEmail;
   }
   public void setNewPhone(String ph){
      newPhone=ph;
   }
   public String getNewPhone(){
      return newPhone;
   }
   public String getNewMessage(){
      return newMessage;
   } 
   public void setNewMessage(String m){
      newMessage=m;
   } 
   public String getBackNews(){
      return backNews;
   }
   public void setBackNews(String s){
      backNews=s;
   } 
}
