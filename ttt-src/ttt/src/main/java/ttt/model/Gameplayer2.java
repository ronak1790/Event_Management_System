package ttt.model;

import java.util.ArrayList;
import java.util.List;

public class Gameplayer2 {

	
	
	String gamename;
	
	List<String> player1;
	
	List<String> player2;
	
	 String result;
	 public Gameplayer2()
	 {
		 player1=new ArrayList<>();
		 player2=new ArrayList<>();
	 }

	public String getGamename() {
		return gamename;
	}

	public void setGamename(String gamename) {
		this.gamename = gamename;
	}

	public List<String> getPlayer1() {
		return player1;
	}

	public void setPlayer1(List<String> player1) {
		this.player1 = player1;
	}

	public List<String> getPlayer2() {
		return player2;
	}

	public void setPlayer2(List<String> player2) {
		this.player2 = player2;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
 	
	
}
