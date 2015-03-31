package ttt.model.dao.jpa;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ttt.model.Game;
import ttt.model.GameUser;
import ttt.model.Save;
import ttt.model.dao.GameDao;
import ttt.model.dao.SaveDao;



@Repository
public class SaveDaoImpl implements SaveDao {
	  @PersistenceContext
	    private EntityManager entityManager;
	  
	  @Autowired
	  GameDao gdao;
	  
	  GameUser g = new GameUser();
	  
	  @Override
	  @PreAuthorize ("principal.username == #u.username")
		public List<Save> getSavedGames(GameUser u) {
		
			List<Game> obj = u.getGames();
			List<Game> obj2 = new ArrayList<Game>();
			
			for(int g=0; g<obj.size();g++ ){
				if(obj.get(g).getEnd_time()==null){
					obj2.add(obj.get(g));
				}
			}
			List<Save> s = new ArrayList<Save>();
			for (int i = 0; i < obj2.size(); i++) {
				
				//s.add//All(obj2.get(i).getGame_id().)
				
			}
			return s;
			 
			  
			
			//return obj2;
		}

	@Override
	public GameUser getGameUser(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getpos(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Game> getGamesAgainstAI(GameUser user) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Game> getsavedGame(GameUser u)
	{
		
		return entityManager.createQuery("from Game where save_time is not null and p1=:i ", Game.class).setParameter("i", u).getResultList();
	}
	
	
	@Override
	public List<Save> getGameposition(Game gameid) {

	   return entityManager.createQuery("from Save where game=:i", Save.class).setParameter("i", gameid).getResultList();
	 
	}

	@Override
	@Transactional
	public boolean saveposition(Save s) {
		entityManager.merge(s);
		return true;
	}
	@Override
	public Save getSave(Game g)
	{
		return entityManager.createQuery("from Save where game=:i",Save.class ).setParameter("i",g ).getSingleResult();
	}
	@Override
	public void remove(Save s)
	{
		entityManager.remove(s);
		//return entityManager.createQuery("from Save where game=:i",Save.class ).setParameter("i",g ).getSingleResult();
	}

}
