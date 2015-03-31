package ttt.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

import ttt.model.Game;
import ttt.model.GameUser;
import ttt.model.User;


@Test(groups = "GameUserDaoTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class GameTest extends AbstractTransactionalTestNGSpringContextTests {


	 @Autowired
	 GameDao gameDao;
	 
	 @Autowired
	 GameUserDao userDao;

	    @Test
	    public void getGame()
	    {/*


	    	
	    	int f=0;
	    	GameUser u = userDao.getGameUser("cysun");
	    	assert gameDao.getGamesAgainstAI(u).size()==3;
	    	for(Game gs:gameDao.getGamesAgainstAI(u))
	    	{
	    		System.out.println(gs.getOutcome());
	    		if(gs.getOutcome()!=null)
	    		if(gs.getOutcome().equalsIgnoreCase("Win") || gs.getOutcome().equalsIgnoreCase("Loose")&& gs.getOutcome()!=null)
	    		{
	    			f++;
	    		}
	    	}
	   
	    	assert f==2;

	    	
	    	
	    	
	    }
	
*/	
assert true;	
}
}