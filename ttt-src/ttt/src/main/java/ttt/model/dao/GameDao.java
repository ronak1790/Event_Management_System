package ttt.model.dao;


import java.util.Date;
import java.util.List;

import ttt.model.Game;
import ttt.model.GameUser;
import ttt.model.Save;

public interface GameDao {

    //GameUser getGameUser ( String username );


	List<Game> getGamesAgainstAI( GameUser user );
	
	int getGameId(GameUser g);
	
	
	List<Game> getCompletedGames(GameUser gu);
	
	List<Game> getplayer1completed(GameUser gu);
	
    List<Game> getplayer2completed(GameUser gu);
    
    List<Game> getplayerWinRateAgainstAi(GameUser gu);
    
    List<Game> getplayerWinRateAgainstHuman(GameUser gu);
    
	Game getGameByStartTime(GameUser gu , Date st);
	
	Boolean saveupdatedgame(Game g);
	Game getgamebyid(Integer gid);
	
	Game getGameBySaveTime(GameUser u , Date d);
}
