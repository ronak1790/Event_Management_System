package ttt.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;





@Entity
@Table(name = "game_users")
public class GameUser{

	
	
	
	@Id
	@GeneratedValue
	private Integer id;
	
	@Column ( nullable=false)
	private String username;
	
	@Column ( nullable=false)
	private String password;
	
	@Column (nullable=false)
	private String email;
	
	@OneToMany
	private List<Game> games;

	
	
	
	
	
	
	

	/////// Getter and setter
	
	public List<Game> getGames() {
		return games;
	}

	public void setGames(List<Game> games) {
		this.games = games;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	  
	  
	  
}
