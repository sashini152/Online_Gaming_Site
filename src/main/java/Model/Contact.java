package Model;

import java.util.Date;

public class Contact {
    private int id;
    private String name;
    private String email;
    private String message;
    private Date date; 

    public Contact() {}

    public Contact(int id, String name, String email, String message, Date date) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.message = message;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
