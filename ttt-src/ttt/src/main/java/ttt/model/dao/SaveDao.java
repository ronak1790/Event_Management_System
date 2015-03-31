package ttt.model.dao;

import java.util.Date;
import java.util.List;

import ttt.model.Game;
import ttt.model.GameUser;
import ttt.model.Save;
import ttt.model.User;

public interface SaveDao {

	
	List<Game> getGamesAgainstAI( GameUser user );
	GameUser getGameUser( String username );
	
	List<Save> getSavedGames(GameUser u);

	 public int getpos(int id);
	
	List<Save> getGameposition(Game gameid);
	
	boolean saveposition(Save s);
	public List<Game> getsavedGame(GameUser u);
	public Save getSave(Game g);
	public void remove(Save g);
}
