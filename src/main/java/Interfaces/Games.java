package Interfaces;

import java.util.ArrayList;

import Model.Game;

public interface Games {

	public int addGame(Game c);

	public int editGame(Game c);

	public Game getGame(int c);

	public int deleteGame(int c);

	public ArrayList<Game> getGame();
}





