package ttt.model.dao.jpa;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ttt.model.Game;
import ttt.model.GameUser;
import ttt.model.User;
import ttt.model.dao.GameDao;
import ttt.model.dao.GameUserDao;

@Repository
public class GameDaoImpl implements GameDao {
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Game> getGamesAgainstAI(GameUser user) {
		List<Game> game = user.getGames();

		List<Game> AI = new ArrayList<Game>();

		for (int i = 0; i < game.size(); i++) {
			if (game.get(i).getEnd_time() != null) {
				AI.add(game.get(i));
			}

		}
		System.out.println(AI.get(0).getOutcome());

		return AI;
	}

	@Override
	public int getGameId(GameUser user) {

		Game g = entityManager.createQuery(
				"from Game where p1=" + user.getId() + "and outcome = null",
				Game.class).getSingleResult();
		int id = g.getGame_id();
		return id;
	}

	@Override
	public List<Game> getCompletedGames(GameUser gu) {

		List<Game> g = entityManager.createQuery(
				"from Game where completed is true and p1=" + gu.getId() + "",
				Game.class).getResultList();

		return g;
	}

	@Override
	public List<Game> getplayer1completed(GameUser gu) {

		List<Game> g = entityManager.createQuery(
				"from Game where aiplayer is true and completed is true and p1="
						+ gu.getId() + "", Game.class).getResultList();

		return g;
	}

	@Override
	public List<Game> getplayer2completed(GameUser gu) {

		List<Game> g = entityManager.createQuery(
				"from Game where aiplayer is false and completed is true and p1="
						+ gu.getId() + "", Game.class).getResultList();

		return g;
	}

	@Override
	public List<Game> getplayerWinRateAgainstAi(GameUser gu) {

		return entityManager
				.createQuery(
						"from Game where aiplayer is true and completed is true and outcome is 'Win' and p1="
								+ gu.getId() + "", Game.class).getResultList();

	}

	@Override
	public List<Game> getplayerWinRateAgainstHuman(GameUser gu) {

		return entityManager
				.createQuery(
						"from Game where aiplayer is false and completed is true and outcome is 'Win' and p1="
								+ gu.getId() + "", Game.class).getResultList();

	}

	@Override
	public Game getGameByStartTime(GameUser gu, Date st) {
		Game g = entityManager.createQuery("from Game where p1 ="+ gu.getId() +" and start_time =:st", Game.class).setParameter("st", st).getSingleResult();
		return g;
	}

	@Override
	@Transactional
	public Boolean saveupdatedgame(Game g) {
		entityManager.merge(g);
		return true;
	}

	@Override
	public Game getgamebyid(Integer gid) {
		Game gu = entityManager.find(Game.class, gid);	
		
		return gu;
	}

	@Override
	public Game getGameBySaveTime(GameUser u, Date d) {
		Game g = entityManager.createQuery("from Game where p1 = "+u.getId()+" and save_time =:st", Game.class).setParameter("st", d).getSingleResult();
		return g;
	}


}
