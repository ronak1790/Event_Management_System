package ttt.service;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.async.DeferredResult;

import ttt.model.Gameplayer2;

import com.fasterxml.jackson.databind.ObjectMapper;


@Service
public class Games {

	
	
	private static final ObjectMapper objectMapper = new ObjectMapper();
	
	 Queue<DeferredResult<List<Gameplayer2>>> results;
	 List<Gameplayer2> games;
	  public Games()
	    {
	        games = new ArrayList<Gameplayer2>();
	        results = new LinkedList<DeferredResult<List<Gameplayer2>>>();
	    }
	public List<Gameplayer2> getGames() {
		return games;
	}
	  
	  
	  public void removegame(Gameplayer2 g)
	  {
		  
		  games.remove(g);
		  processDeferredResults();
	  }
	  
	  public void add( Gameplayer2 g )
	    {
	        games.add( g );
	        processDeferredResults();
	    }
	  
	  public void addResult( DeferredResult<List<Gameplayer2>> result )
	    {
	        results.add( result );
	    }
	  private void processDeferredResults() {
			
			List<Gameplayer2> json = new ArrayList<Gameplayer2>();
			json=games;
			
			for(DeferredResult<List<Gameplayer2>> result : results){
				result.setResult(json);
			}
		results.clear();
		}
	
}
