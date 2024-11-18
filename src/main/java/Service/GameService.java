package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Database.DBConnect;
import Interfaces.Games; // Ensure the interface name is updated to 'Games'
import Model.Game; // Ensure the model class name is updated to 'Game'

public class GameService implements Games { 

    @Override
    public int addGame(Game game) {
        Connection connection;
        PreparedStatement preparedStatement;

        try {
            connection = DBConnect.getDBConnection();

            // insert value
            preparedStatement = connection.prepareStatement("INSERT INTO game (title, release_date, description, category_id, developer_name, cost_per_item,game_image) VALUES (?, ?, ?, ?, ?, ?, ?)");
            preparedStatement.setString(1, game.getTitle());
            preparedStatement.setString(2, game.getRelease_date());
            preparedStatement.setString(3, game.getDescription());
            preparedStatement.setInt(4, game.getCategory_id());
            preparedStatement.setString(5, game.getDeveloper_name());
            preparedStatement.setDouble(6, game.getCost_per_item());
            preparedStatement.setString(7, game.getGame_image());
            
            
            preparedStatement.execute();
            preparedStatement.close();
            connection.close();

            return 1;

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    @Override
    public ArrayList<Game> getGame() {
        ArrayList<Game> gameList = new ArrayList<>();
        Connection connection;
        PreparedStatement preparedStatement;

        try {
            connection = DBConnect.getDBConnection();
            preparedStatement = connection.prepareStatement("SELECT * FROM game"); // query to get all games

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Game game = new Game(); // Update instantiation to Game

                game.setId(resultSet.getInt("id"));
                game.setTitle(resultSet.getString("title"));
                game.setRelease_date(resultSet.getString("release_date"));
                game.setDescription(resultSet.getString("description"));
                game.setCategory_id(resultSet.getInt("category_id"));
                game.setDeveloper_name(resultSet.getString("developer_name"));
                game.setCost_per_item(resultSet.getDouble("cost_per_item"));
                game.setGame_image(resultSet.getString("game_image"));
                
               
                

                gameList.add(game);
            }

           resultSet.close();
           preparedStatement.close();
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }

        return gameList;
    }

    @Override
    public int editGame(Game game) { 
        Connection connection;
        PreparedStatement preparedStatement;

        try {
            connection = DBConnect.getDBConnection();

            
            preparedStatement = connection.prepareStatement("UPDATE game SET title=?, release_date=?, description=?, category_id=?,developer_name=?,cost_per_item=? WHERE id=?");// query to edit game
           
           
            preparedStatement.setString(1, game.getTitle());
            preparedStatement.setString(2, game.getRelease_date());
            preparedStatement.setString(3, game.getDescription());
            preparedStatement.setInt(4, game.getCategory_id());
            preparedStatement.setString(5, game.getDeveloper_name());
            preparedStatement.setDouble(6, game.getCost_per_item());
            
            preparedStatement.setInt(7, game.getId());
            
            
           
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
            return 1;

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    @Override
    public int deleteGame(int gameId) { 
        Connection connection;
        PreparedStatement preparedStatement;

        try {
            connection = DBConnect.getDBConnection();

           
            preparedStatement = connection.prepareStatement("DELETE FROM game WHERE id=?"); // query to delete game
            preparedStatement.setInt(1, gameId);
            preparedStatement.execute();

            return 1;

        } catch (ClassNotFoundException | SQLException e) {
            return 0;
        }
    }
    

    @Override
    public Game getGame(int id) { 
        Connection connection;
        PreparedStatement preparedStatement;
        Game game = new Game();

        try {
            connection = DBConnect.getDBConnection();

            preparedStatement = connection.prepareStatement("SELECT * FROM game WHERE id=?"); // query to get games by id
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                game.setId(resultSet.getInt("id"));
                game.setTitle(resultSet.getString("title"));
                game.setRelease_date(resultSet.getString("release_date"));
               game.setDescription(resultSet.getString("description"));
                game.setCategory_id(resultSet.getInt("category_id"));
                game.setDeveloper_name(resultSet.getString("developer_name"));
                game.setCost_per_item(resultSet.getDouble("cost_per_item"));
                game.setGame_image(resultSet.getString("game_image"));
               
                
                
            }
            
            
            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return game;
    }

}
