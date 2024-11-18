package Model;

public class Comment {
    private int id;
    private String text;
    private String date;
    private int user_id;
    private int game_id;

    public Comment() {}

    public Comment(int id, String text, String date, int user_id, int game_id) {
        this.id = id;
        this.text = text;
        this.date = date;
        this.user_id = user_id;
        this.game_id = game_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getGame_id() {
        return game_id;
    }

    public void setGame_id(int game_id) {
        this.game_id = game_id;
    }
}
