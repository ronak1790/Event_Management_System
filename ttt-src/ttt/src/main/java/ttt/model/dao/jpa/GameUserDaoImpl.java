package ttt.model.dao.jpa;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ttt.model.Game;
import ttt.model.GameUser;
import ttt.model.User;
import ttt.model.dao.GameUserDao;

@Repository
public class GameUserDaoImpl implements GameUserDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public GameUser getGameUser(String username) {
		return (GameUser) entityManager.createQuery(
				"from GameUser where username='" + username + "'",
				GameUser.class).getSingleResult();
	}

	@Override
	public Game getGame(int i)
	{
		
		return entityManager.find(Game.class, i);
	}
	
	
	
	@Override
	public boolean login(String username, String password) {
		// TODO Auto-generated method stub

		GameUser gu = entityManager
				.createQuery(
						"from GameUser where username = :u and password = :p",
						GameUser.class).setParameter("u", username)
				.setParameter("p", password).getSingleResult();

		if (gu.getUsername() != null) {
			return true;
		} else {
			return false;
		}
		
	}
	/*
	 * @Override public List<GameUser> getGameUsers() { return
	 * entityManager.createQuery( "from User order by id", User.class )
	 * .getResultList(); }
	 */

	@Transactional
	@Override
	public boolean reg(GameUser gu) {
		// TODO Auto-generated method stub
		entityManager.merge(gu);
		return true;
	}
	@Transactional
	@Override
	public void insertGame(Game g) {
		// TODO Auto-generated method stub
		entityManager.merge(g);
		
	}
	
	@Override
	public Game getGame(Date d)
	{
		
		return entityManager.createQuery("from Game where start_time=:id", Game.class).setParameter("id", d).getSingleResult();
	}

	
	@Override
	public List<Game> getMonthGames(GameUser gu) {

		int id = gu.getId();
		return entityManager.createQuery(
				"from Game where completed is true and p1 =" + id + " or p2 ="
						+ id, Game.class).getResultList();

	}

	
}
