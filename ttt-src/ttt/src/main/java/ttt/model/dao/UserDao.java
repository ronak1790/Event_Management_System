package ttt.model.dao;

import java.util.List;

import ttt.model.Game;
import ttt.model.GameUser;
import ttt.model.User;

public interface UserDao {
	 User getUser( Integer id );

	    List<User> getUsers();

		List<Game> getMonthGames(GameUser gu);
}
