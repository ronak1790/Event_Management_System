package ttt.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name = "games")
public class Game {
	
	@Id
	@GeneratedValue
	private Integer game_id;
	
	@ManyToOne
	private GameUser p1;
	
	
	@ManyToOne
	private GameUser p2;
	
	
	private boolean aiPlayer;
	
	
	
	private Date start_time;

    private Date end_time;
    
    private Date save_time;
    
   
    public Date getSave_time() {
		return save_time;
	}

	public void setSave_time(Date save_time) {
		this.save_time = save_time;
	}

	private String outcome;
    
    private boolean completed;

	

	public Integer getGame_id() {
		return game_id;
	}

	public void setGame_id(Integer game_id) {
		this.game_id = game_id;
	}

	public GameUser getP1() {
		return p1;
	}

	public void setP1(GameUser p1) {
		this.p1 = p1;
	}

	public GameUser getP2() {
		return p2;
	}

	public void setP2(GameUser p2) {
		this.p2 = p2;
	}

	public boolean isAiPlayer() {
		return aiPlayer;
	}

	public void setAiPlayer(boolean aiPlayer) {
		this.aiPlayer = aiPlayer;
	}

	

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public Date getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}

	public String getOutcome() {
		return outcome;
	}

	public void setOutcome(String outcome) {
		this.outcome = outcome;
	}

	public boolean isCompleted() {
		return completed;
	}

	public void setCompleted(boolean completed) {
		this.completed = completed;
	}
    
   
    
}
