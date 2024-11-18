package Model;

public class Game {

    private int id, category_id;
    private String title, description, release_date,developer_name,game_image;
    
    
    public String getGame_image() {
		return game_image;
	}
	public void setGame_image(String game_image) {
		this.game_image = game_image;
	}
	double cost_per_item;

    public String getRelease_date() {
		return release_date;
	}
	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}
	public String getDeveloper_name() {
		return developer_name;
	}
	public void setDeveloper_name(String developer_name) {
		this.developer_name = developer_name;
	}
	public double getCost_per_item() {
		return cost_per_item;
	}
	public void setCost_per_item(double cost_per_item) {
		this.cost_per_item = cost_per_item;
	}
	public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    public int getCategory_id() {
        return category_id;
    }
    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
    
	public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
   
    @Override
	public String toString() {
		return "Game [id=" + id + ", category_id=" + category_id + ", title=" + title + ", description=" + description
				+ ", release_date=" + release_date + ", developer_name=" + developer_name + ", game_image=" + game_image
				+ ", cost_per_item=" + cost_per_item + "]";
	}
    
   
	

}
