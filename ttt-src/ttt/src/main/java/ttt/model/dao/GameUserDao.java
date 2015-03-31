package ttt.model.dao;

import java.util.Date;
import java.util.List;

import ttt.model.Game;
import ttt.model.GameUser;

public interface GameUserDao {

	GameUser getGameUser( String username );
	
	boolean login(String username, String password);

	boolean reg(GameUser gu);
	public void insertGame(Game g);
	public Game getGame(Date d);
	 List<Game> getMonthGames(GameUser gu);
	 public Game getGame(int i);
}
