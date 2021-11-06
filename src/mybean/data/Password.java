package mybean.data;

public class Password {
    private String oldPassword="";
    private String newPassword="";
    private String backNews="";

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String pw) {
        oldPassword = pw;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String pw) {
        newPassword = pw;
    }

    public String getBackNews() {
        return backNews;
    }

    public void setBackNews(String s) {
        backNews = s;
    }
}
