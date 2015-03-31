package ttt.web.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.async.DeferredResult;

import ttt.model.Game;
import ttt.model.GameUser;
import ttt.model.Gameplayer2;
import ttt.model.MonthModel;
import ttt.model.Save;
import ttt.model.dao.*;
import ttt.service.Games;
import ttt.service.host;
import ttt.service.join;

@Controller
public class UserController {

	Date st = null;

	@Autowired
	private UserDao userDao;

	@Autowired
	private GameDao gameDao;

	@Autowired
	private GameUserDao GameUserDao;

	@Autowired
	private SaveDao saveDao;
	
	@Autowired
	private Games gs;
	

@Autowired
host hostwire;

@Autowired
join joinwire;
	
	@RequestMapping("/users.html")
	public String users(ModelMap models) {
		models.put("users", userDao.getUsers());
		return "users";
	}

/*	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public String login(ModelMap models) {
		models.put("gameuser", new GameUser());
		return "login";
	}

	@RequestMapping(value = "/login.html", method = RequestMethod.POST)
	public String login1q(@ModelAttribute("GameUser") GameUser gu,
			HttpSession session, ModelMap model) {
		boolean logincheck = GameUserDao.login(gu.getUsername(),
				gu.getPassword());
		if (logincheck == true) {
			session.setAttribute("username", gu.getUsername());
			model.put("username", gu.getUsername());

			return "redirect:/GameHome.html";
		} else {
			return "redirect:/login.html";
		}
	}
*/
	@RequestMapping(value = "/GameHome.html", method = RequestMethod.GET)
	public String Gotohome(ModelMap models, HttpSession s) {

		String uname=(String)s.getAttribute("username");
		for(Gameplayer2 g: gs.getGames())
		{
			String[] temp=g.getGamename().split("-");
			
			if(uname.equals(temp[0]) || uname.equals(temp[1]))
			{
				gs.removegame(g);
				break;
				
			}
		}
	
		return "GameHome";

	}

	/*@RequestMapping(value = "/logout.html", method = RequestMethod.GET)
	public String logout(ModelMap models, HttpSession s) {

		GameUser gu = GameUserDao.getGameUser((String) s
				.getAttribute("username"));
		if (s.getAttribute("g") != null) {
			Game g = (Game) s.getAttribute("g");
			if (g.getStart_time() != null) {
				g.setAiPlayer(true);
				g.setCompleted(true);
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
				Date dt = new Date();
				try {
					g.setEnd_time(df.parse(df.format(dt)));

				} catch (ParseException e) {

					e.printStackTrace();
				}
				if (g.getSave_time() != null) {
					g = gameDao.getGameByStartTime(gu, g.getStart_time());

					g.setSave_time(null);
					saveDao.remove(saveDao.getSave(g));
				}
				g.setOutcome("Loose");
				g.setP2(null);
				GameUserDao.insertGame(g);

				gu.getGames().add(GameUserDao.getGame(g.getStart_time()));
				GameUserDao.reg(gu);

			}
		}
		s.invalidate();
		return "redirect:/login.html";
	}
*/
	
	
	
	@RequestMapping(value="/welcome", method = RequestMethod.GET)
	public String printWelcome(ModelMap model,HttpSession session,Principal principal) {
 
		String name = principal.getName();
	
		session.setAttribute("username", name);
		return "redirect:/GameHome.html";
 
	}
 
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
 
		return "login";
 
	}
	
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
 
		model.addAttribute("error", "true");
		return "login";
 
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
 
		return "login";
 
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/reg.html", method = RequestMethod.GET)
	public String reg(ModelMap models) {
		models.put("gameuser", new GameUser());
		return "reg";
	}

	@RequestMapping(value = "/reg.html", method = RequestMethod.POST)
	public String reg(@ModelAttribute("GameUser") GameUser gu,
			HttpSession session) {
		boolean flag = GameUserDao.reg(gu);
		return "redirect:/login.html";
	}

	@RequestMapping(value = "/ttt.html", method = RequestMethod.GET)
	public String ttt(ModelMap models, HttpSession request) {

		GameUser gu = GameUserDao.getGameUser((String) request
				.getAttribute("username"));
		request.removeAttribute("gid");
		if (request.getAttribute("g") != null) {
			Game g = (Game) request.getAttribute("g");
			if (g.getStart_time() != null) {
				g.setAiPlayer(true);
				g.setCompleted(true);
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
				Date dt = new Date();
				try {
					g.setEnd_time(df.parse(df.format(dt)));

				} catch (ParseException e) {

					e.printStackTrace();
				}
				if (g.getSave_time() != null) {
					g = gameDao.getGameByStartTime(gu, g.getStart_time());

					g.setSave_time(null);
					saveDao.remove(saveDao.getSave(g));
				}
				g.setOutcome("Loose");
				g.setP2(null);
				GameUserDao.insertGame(g);

				gu.getGames().add(GameUserDao.getGame(g.getStart_time()));
				GameUserDao.reg(gu);
				request.removeAttribute("g");
			}
		}

		String username = (String) request.getAttribute("username");
		models.put("username", username);
		models.put("users", new GameUser());
		// ///////////////////////////////

		ArrayList<String> player = new ArrayList<String>();
		ArrayList<String> computer = new ArrayList<String>();

		String print = "Please make your move";
		Game g = new Game();
		request.setAttribute("g", g);
		models.put("print", print);

		models.put("computer", computer);
		request.setAttribute("computer", computer);

		models.put("player", player);
		request.setAttribute("player", player);
		st = null;
		// ////////////////////////////////
		return "TicTacToe";

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/AI.html", method = RequestMethod.GET)
	public String ttt1(ModelMap models, HttpSession r, @RequestParam String id) {

		{
			List<String> player = (List<String>) r.getAttribute("player");
			List<String> computer = (List<String>) r.getAttribute("computer");
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
			String message = "Please make your move:";
			Game g = (Game) r.getAttribute("g");
			if (g.getStart_time() == null) {

				g.setP1(GameUserDao.getGameUser((String) r
						.getAttribute("username")));

				Date dt = new Date();
				try {
					st = df.parse(df.format(dt));
					g.setStart_time(df.parse(df.format(dt)));

				} catch (ParseException e) {

					e.printStackTrace();
				}
			}

			player.add(id);

			if ((computer.contains("2") && computer.contains("3") && !player
					.contains("1"))
					|| (computer.contains("4") && computer.contains("7") && !player
							.contains("1"))
					|| (computer.contains("5") && computer.contains("9") && !player
							.contains("1"))) {
				computer.add("1");
			}

			else if ((computer.contains("1") && computer.contains("3") && !player
					.contains("2"))
					|| (computer.contains("5") && computer.contains("8") && !player
							.contains("2"))
					|| (computer.contains("5") && computer.contains("8") && !player
							.contains("2"))) {
				computer.add("2");
			}

			else if ((computer.contains("1") && computer.contains("2") && !player
					.contains("3"))
					|| (computer.contains("6") && computer.contains("9") && !player
							.contains("3"))
					|| (computer.contains("5") && computer.contains("7") && !player
							.contains("3"))) {
				computer.add("3");
			} else if ((computer.contains("5") && computer.contains("6") && !player
					.contains("4"))
					|| (computer.contains("1") && computer.contains("7") && !player
							.contains("4"))) {
				computer.add("4");
			}

			else if ((computer.contains("4") && computer.contains("6") && !player
					.contains("5"))
					|| (computer.contains("2") && computer.contains("8") && !player
							.contains("5"))
					|| (computer.contains("1") && computer.contains("9") && !player
							.contains("5"))
					|| (computer.contains("3") && computer.contains("7") && !player
							.contains("5")))

			{
				computer.add("5");
			}

			else if ((computer.contains("4") && computer.contains("5") && !player
					.contains("6"))
					|| (computer.contains("3") && computer.contains("9") && !player
							.contains("6"))
					|| (player.contains("4") && player.contains("5") && !computer
							.contains("6"))
					|| (player.contains("3") && player.contains("9") && !computer
							.contains("6"))) {
				computer.add("6");
			}

			else if ((computer.contains("8") && computer.contains("9") && !player
					.contains("7"))
					|| (computer.contains("1") && computer.contains("4") && !player
							.contains("7"))
					|| (computer.contains("3") && computer.contains("5") && !player
							.contains("7"))) {
				computer.add("7");
			}

			else if ((computer.contains("7") && computer.contains("9") && !player
					.contains("8"))
					|| (computer.contains("2") && computer.contains("5") && !player
							.contains("8"))
					|| (player.contains("7") && player.contains("9") && !computer
							.contains("8"))) {
				computer.add("8");
			}

			else if ((computer.contains("7") && computer.contains("8") && !player
					.contains("9"))
					|| (computer.contains("3") && computer.contains("6") && !player
							.contains("9"))
					|| (computer.contains("1") && computer.contains("5") && !player
							.contains("9"))) {
				computer.add("9");
			}

			// //////////////////////////////
			else {
				if ((player.contains("2") && player.contains("3") && !computer
						.contains("1"))
						|| (player.contains("4") && player.contains("7") && !computer
								.contains("1"))
						|| (player.contains("5") && player.contains("9") && !computer
								.contains("1"))) {
					computer.add("1");
				} else if ((player.contains("1") && player.contains("3") && !computer
						.contains("2"))
						|| (player.contains("5") && player.contains("8") && !computer
								.contains("2"))) {
					computer.add("2");
				} else if ((player.contains("6") && player.contains("9") && !computer
						.contains("3"))
						|| (player.contains("5") && player.contains("7") && !computer
								.contains("3"))
						|| (player.contains("6") && player.contains("9") && !computer
								.contains("3"))
						|| (player.contains("1") && player.contains("2") && !computer
								.contains("3"))) {
					computer.add("3");
				} else if ((player.contains("5") && player.contains("6") && !computer
						.contains("4"))
						|| (player.contains("1") && player.contains("7") && !computer
								.contains("4"))) {
					computer.add("4");
				} else if ((player.contains("4") && player.contains("6") && !computer
						.contains("5"))
						|| (player.contains("2") && player.contains("8") && !computer
								.contains("5"))
						|| (player.contains("3") && player.contains("7") && !computer
								.contains("5"))
						|| (player.contains("1") && player.contains("9") && !computer
								.contains("5")))

				{
					computer.add("5");
				}

				else if ((player.contains("4") && player.contains("5") && !computer
						.contains("6"))
						|| (player.contains("3") && player.contains("9") && !computer
								.contains("6"))) {
					computer.add("6");
				}

				else if ((player.contains("8") && player.contains("9") && !computer
						.contains("7"))
						|| (player.contains("8") && player.contains("9") && !computer
								.contains("7"))
						|| (player.contains("3") && player.contains("5") && !computer
								.contains("7"))
						|| (player.contains("1") && player.contains("4") && !computer
								.contains("7"))) {
					computer.add("7");
				}

				else if ((player.contains("2") && player.contains("5") && !computer
						.contains("8"))
						|| (player.contains("2") && player.contains("5") && !computer
								.contains("8"))) {
					computer.add("8");
				} else if ((player.contains("7") && player.contains("8") && !computer
						.contains("9"))
						|| (player.contains("3") && player.contains("6") && !computer
								.contains("9"))
						|| (player.contains("1") && player.contains("5") && !computer
								.contains("9"))) {
					computer.add("9");
				}

				else {

					String x = " ";
					do {
						int randomNum = 1 + (int) (Math.random() * 9);
						x = Integer.toString(randomNum);

						if (!player.contains(x) && !computer.contains(x)) {
							computer.add(x);

						}
					} while (!computer.contains(x));
				}
			}
			if ((player.contains("1") && player.contains("2") && player
					.contains("3"))
					|| (player.contains("4") && player.contains("5") && player
							.contains("6"))
					|| (player.contains("1") && player.contains("4") && player
							.contains("7"))
					|| (player.contains("2") && player.contains("5") && player
							.contains("8"))
					|| (player.contains("7") && player.contains("8") && player
							.contains("9"))
					|| (player.contains("3") && player.contains("6") && player
							.contains("9"))
					|| (player.contains("3") && player.contains("5") && player
							.contains("7"))
					|| (player.contains("1") && player.contains("5") && player
							.contains("9"))) {
				message = "You Won";

				g.setAiPlayer(true);
				g.setCompleted(true);

				Date dt = new Date();
				try {
					g.setEnd_time(df.parse(df.format(dt)));

				} catch (ParseException e) {

					e.printStackTrace();
				}
				GameUser gug = GameUserDao.getGameUser((String) r
						.getAttribute("username"));
				if (g.getSave_time() != null) {
					g = gameDao.getGameByStartTime(gug, g.getStart_time());

					g.setSave_time(null);
					saveDao.remove(saveDao.getSave(g));
				}/*
				 * else { g = new Game(); }
				 */
				g.setOutcome("Win");
				g.setP2(null);
				GameUserDao.insertGame(g);
				GameUser gu = GameUserDao.getGameUser((String) r
						.getAttribute("username"));
				gu.getGames().add(GameUserDao.getGame(g.getStart_time()));
				GameUserDao.reg(gu);
				r.removeAttribute("g");

			} else if ((computer.contains("1") && computer.contains("2") && computer
					.contains("3"))
					|| (computer.contains("4") && computer.contains("5") && computer
							.contains("6"))
					|| (computer.contains("7") && computer.contains("8") && computer
							.contains("9"))
					|| (computer.contains("1") && computer.contains("5") && computer
							.contains("9"))
					|| (computer.contains("1") && computer.contains("4") && computer
							.contains("7"))
					|| (computer.contains("2") && computer.contains("5") && computer
							.contains("8"))
					|| (computer.contains("3") && computer.contains("6") && computer
							.contains("9"))
					|| (computer.contains("3") && computer.contains("5") && computer
							.contains("7"))) {
				message = "I Won";
				g.setAiPlayer(true);
				g.setCompleted(true);

				Date dt = new Date();
				try {
					g.setEnd_time(df.parse(df.format(dt)));

				} catch (ParseException e) {

					e.printStackTrace();
				}

				GameUser gug = GameUserDao.getGameUser((String) r
						.getAttribute("username"));
				if (g.getSave_time() != null) {
					g = gameDao.getGameByStartTime(gug, g.getStart_time());
					// g = gameDao.getgamebyid((Integer)r.getAttribute("gid"));
					g.setSave_time(null);
					saveDao.remove(saveDao.getSave(g));
				} /*
				 * else { g = new Game(); }
				 */
				g.setOutcome("Loose");
				g.setP2(null);
				GameUserDao.insertGame(g);
				GameUser gu = GameUserDao.getGameUser((String) r
						.getAttribute("username"));
				gu.getGames().add(GameUserDao.getGame(g.getStart_time()));
				GameUserDao.reg(gu);
				r.removeAttribute("g");

			} else if ((player.contains("1") || computer.contains("1"))
					&& (player.contains("2") || computer.contains("2"))
					&& (player.contains("3") || computer.contains("3"))
					&& (player.contains("4") || computer.contains("4"))
					&& (player.contains("5") || computer.contains("5"))
					&& (player.contains("6") || computer.contains("6"))
					&& (player.contains("7") || computer.contains("7"))
					&& (player.contains("8") || computer.contains("8"))
					&& (player.contains("9") || computer.contains("9"))) {
				message = "Game Tied";
				g.setAiPlayer(true);
				g.setCompleted(true);

				Date dt = new Date();
				try {
					g.setEnd_time(df.parse(df.format(dt)));

				} catch (ParseException e) {

					e.printStackTrace();
				}

				GameUser gug = GameUserDao.getGameUser((String) r
						.getAttribute("username"));
				if (g.getSave_time() != null) {
					g = gameDao.getGameByStartTime(gug, g.getStart_time());

					// g = gameDao.getgamebyid((Integer)r.getAttribute("gid"));
					g.setSave_time(null);
					saveDao.remove(saveDao.getSave(g));
				} /*
				 * else { g = new Game(); }
				 */

				g.setOutcome("Tie");
				g.setP2(null);
				GameUserDao.insertGame(g);
				GameUser gu = GameUserDao.getGameUser((String) r
						.getAttribute("username"));
				gu.getGames().add(GameUserDao.getGame(g.getStart_time()));
				GameUserDao.reg(gu);
				r.removeAttribute("g");

			}

			models.put("message", message);
			models.put("computer", computer);
			// models.put("computer", computer);

			models.put("player", player);
			r.setAttribute("player", player);
			r.setAttribute("player", player);
			r.setAttribute("st", st);

			return "TicTacToe";
		}
	}

	@RequestMapping(value = "/history.html", method = RequestMethod.GET)
	public String history(ModelMap models, HttpSession session) {

		
		GameUser gu = GameUserDao.getGameUser((String) session
				.getAttribute("username"));
		List<Game> g = gameDao.getCompletedGames(gu);
		List<Game> g1 = gameDao.getplayer1completed(gu);
		List<Game> g2 = gameDao.getplayer2completed(gu);
		List<Game> g3 = gameDao.getplayerWinRateAgainstAi(gu);
		List<Game> g4 = gameDao.getplayerWinRateAgainstHuman(gu);

		double rateAgainstAI = (double) (g3.size() * 100)
				/ (double) (g1.size());
		double rateAgainstHuman = (double) (g4.size() * 100)
				/ (double) (g1.size());

		models.put("allcompletedgames", g.size());
		models.put("all1player", g1.size());
		models.put("all2player", g2.size());
		// models.put("allWinRateAgainstAI",g3.size());
		models.put("allWinRateAgainstAI", rateAgainstAI);
		models.put("getplayerWinRateAgainstHuman", rateAgainstHuman);

		/*----------------------------------*/

		List<MonthModel> mm = new ArrayList<MonthModel>();
		List<Game> gm = GameUserDao.getMonthGames(gu);
		for (int i = 0; i < gm.size(); i++) {

			Date start = gm.get(i).getStart_time();
			Date end = gm.get(i).getEnd_time();
			long duration = (end.getTime() - start.getTime()) / 100;

			String opp = "";
			if (gm.get(i).isAiPlayer() == true) {
				opp = "AI";
			}
			String outcome = gm.get(i).getOutcome();
			MonthModel m = new MonthModel(start, end, duration, opp, outcome);
			mm.add(m);
		}
		models.put("mm", mm);
		return "history";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/save.html", method = RequestMethod.GET)
	public String save(HttpSession session, ModelMap models) {

		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		List<String> comp = (List<String>) session.getAttribute("computer");
		List<String> play = (List<String>) session.getAttribute("player");
		GameUser gu = GameUserDao.getGameUser((String) session
				.getAttribute("username"));

		Game g = (Game) session.getAttribute("g");

		if (g.getSave_time() != null) {
			System.out.println(g.getStart_time());
			g = gameDao.getGameByStartTime(gu, g.getStart_time());
			Date dt = new Date();
			try {
				g.setSave_time(df.parse(df.format(dt)));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Save s = saveDao.getSave(g);
			for (int i = 0; i < comp.size(); i++) {
				String m = comp.get(i);
				if (m.equals("1")) {
					s.setValue1("O");
				} else if (m.equals("2")) {
					s.setValue2("O");
				} else if (m.equals("3")) {
					s.setValue3("O");
				} else if (m.equals("4")) {
					s.setValue4("O");
				} else if (m.equals("5")) {
					s.setValue5("O");
				} else if (m.equals("6")) {
					s.setValue6("O");
				} else if (m.equals("7")) {
					s.setValue7("O");
				} else if (m.equals("8")) {
					s.setValue8("O");
				} else if (m.equals("9")) {
					s.setValue9("O");
				}
			}

			for (int i = 0; i < play.size(); i++) {
				String m = play.get(i);
				if (m.equals("1")) {
					s.setValue1("X");
				} else if (m.equals("2")) {
					s.setValue2("X");
				} else if (m.equals("3")) {
					s.setValue3("X");
				} else if (m.equals("4")) {
					s.setValue4("X");
				} else if (m.equals("5")) {
					s.setValue5("X");
				} else if (m.equals("6")) {
					s.setValue6("X");
				} else if (m.equals("7")) {
					s.setValue7("X");
				} else if (m.equals("8")) {
					s.setValue8("X");
				} else if (m.equals("9")) {
					s.setValue9("X");
				}
			}
			saveDao.saveposition(s);

			GameUserDao.insertGame(g);

			session.removeAttribute("g");

			return "redirect:/ttt.html";
		}

		Date dt = new Date();
		try {
			g.setP1(gu);

			g.setSave_time(df.parse(df.format(dt)));
			g.setCompleted(false);
			g.setAiPlayer(true);
			g.setOutcome(null);
		} catch (ParseException e) {

			e.printStackTrace();
		}
		GameUserDao.insertGame(g);
		Game ga = gameDao.getGameByStartTime(gu,
				(Date) session.getAttribute("st"));
		/*
		 * if(session.getAttribute("gid") == null) { ga =
		 * gameDao.getGameByStartTime(gu, (Date) session.getAttribute("st")); }
		 * else {
		 */
		// ga = gameDao.getgamebyid((Integer)session.getAttribute("gid"));
		// }
		Save s = new Save();
		s.setGame(ga);
		for (int i = 0; i < comp.size(); i++) {
			String m = comp.get(i);
			if (m.equals("1")) {
				s.setValue1("O");
			} else if (m.equals("2")) {
				s.setValue2("O");
			} else if (m.equals("3")) {
				s.setValue3("O");
			} else if (m.equals("4")) {
				s.setValue4("O");
			} else if (m.equals("5")) {
				s.setValue5("O");
			} else if (m.equals("6")) {
				s.setValue6("O");
			} else if (m.equals("7")) {
				s.setValue7("O");
			} else if (m.equals("8")) {
				s.setValue8("O");
			} else if (m.equals("9")) {
				s.setValue9("O");
			}
		}

		for (int i = 0; i < play.size(); i++) {
			String m = play.get(i);
			if (m.equals("1")) {
				s.setValue1("X");
			} else if (m.equals("2")) {
				s.setValue2("X");
			} else if (m.equals("3")) {
				s.setValue3("X");
			} else if (m.equals("4")) {
				s.setValue4("X");
			} else if (m.equals("5")) {
				s.setValue5("X");
			} else if (m.equals("6")) {
				s.setValue6("X");
			} else if (m.equals("7")) {
				s.setValue7("X");
			} else if (m.equals("8")) {
				s.setValue8("X");
			} else if (m.equals("9")) {
				s.setValue9("X");
			}
		}
		saveDao.saveposition(s);

		session.removeAttribute("g");

		return "redirect:/ttt.html";

	}

	@RequestMapping(value = "/savesgame.html", method = RequestMethod.GET)
	public String savedGames(ModelMap models, HttpSession session) {

		
		GameUser gu = GameUserDao.getGameUser((String) session
				.getAttribute("username"));

		List<Game> sg = saveDao.getsavedGame(gu);

		models.put("save", sg);
		System.out.println(sg.size());

		return "savedgames";
	}

	@RequestMapping(value = "/displaySaveGames.html", method = RequestMethod.GET)
	public String resumeGame(ModelMap models, HttpSession session,
			@RequestParam int i) {
		
		GameUser gu = GameUserDao.getGameUser((String) session
				.getAttribute("username"));
		Game g = GameUserDao.getGame(i);
		ArrayList<String> player = new ArrayList<String>();
		ArrayList<String> computer = new ArrayList<String>();
		List<Save> sa = saveDao.getGameposition(g);
		session.setAttribute("g", sa.get(0));
		for (Save s : sa) {
			if (s.getValue1() != null)
				if (s.getValue1().equals("X"))
					player.add("1");
				else if (s.getValue1().equals("O"))
					computer.add("1");

			if (s.getValue2() != null)
				if (s.getValue2().equals("X"))
					player.add("2");
				else if (s.getValue2().equals("O"))
					computer.add("2");

			if (s.getValue3() != null)
				if (s.getValue3().equals("X"))
					player.add("3");
				else if (s.getValue3().equals("O"))
					computer.add("3");

			if (s.getValue4() != null)
				if (s.getValue4().equals("X"))
					player.add("4");
				else if (s.getValue4().equals("O"))
					computer.add("4");

			if (s.getValue5() != null)
				if (s.getValue5().equals("X"))
					player.add("5");
				else if (s.getValue5().equals("O"))
					computer.add("5");

			if (s.getValue6() != null)
				if (s.getValue6().equals("X"))
					player.add("6");
				else if (s.getValue6().equals("O"))
					computer.add("6");

			if (s.getValue7() != null)
				if (s.getValue7().equals("X"))
					player.add("7");
				else if (s.getValue7().equals("O"))
					computer.add("7");

			if (s.getValue8() != null)
				if (s.getValue8().equals("X"))
					player.add("8");
				else if (s.getValue8().equals("O"))
					computer.add("8");

			if (s.getValue9() != null)
				if (s.getValue9().equals("X"))
					player.add("9");
				else if (s.getValue9().equals("O"))
					computer.add("9");

		}
		models.put("player", player);
		models.put("computer", computer);
		session.setAttribute("player", player);
		session.setAttribute("computer", computer);
		session.setAttribute("gid", g.getGame_id());
		session.setAttribute("g", g);
		return "TicTacToe";

	}

	@RequestMapping("/p2.html")
	public String p2(ModelMap models) {
		return "p2";
	}

	@RequestMapping("/hostgame.json")
	public String hostJson(ModelMap models) {

		models.put("usernames", hostwire.getUsernames());
		return "jsonView";
	}

	@RequestMapping("/joingame.json")
	public String joinJson(ModelMap models) {

		models.put("usernames", joinwire.getUsernames());
		return "jsonView";
	}

	@RequestMapping("/hostgame.deferred.json")
	@ResponseBody
	public DeferredResult<String> hostDeferred() {

		DeferredResult<String> result = new DeferredResult<String>();
		hostwire.addResult(result);
		return result;
	}

	@RequestMapping("/joingame.deferred.json")
	@ResponseBody
	public DeferredResult<String> joinJson() {

		DeferredResult<String> result = new DeferredResult<String>();
		joinwire.addResult(result);
		return result;
	}


	@RequestMapping("/hostgame.html")
	public String hostGameWithHuman(HttpSession session) {
		String username = (String) session.getAttribute("username");

		hostwire.add(username);
		

		if (joinwire.getUsernames().size() == 0) {
			return "hostgame";
		} else {
             
			
			
			return "redirect:player2.html";

		}
	}

	@RequestMapping("/joingame.html")
	public String joinGameWithHuman(HttpSession session) {
		String username = (String) session.getAttribute("username");

		
		
		joinwire.add(username);
		

		if (hostwire.getUsernames().size() == 0) {
			return "joingame";
		} else {
			//Gameplayer2 g=new Gameplayer2();
			//g.setGamename(hostwire.getUsernames().get(0)+"-"+username);
			//gs.add(g);
			return "redirect:player2.html";
		}
	}

	@RequestMapping("/player2.html")
	public String play2p(HttpSession session, ModelMap model) {

		
		List<String> hostlist = hostwire.getUsernames();
		List<String> joinlist = joinwire.getUsernames();

		
		String username = (String) session.getAttribute("username");

		String msgprint = "";
		if (username.equals(hostlist.get(0))) {
			msgprint = joinlist.get(0) + " has joined the game.";
		} else if (username.equals(joinlist.get(0))) {
			msgprint = "Joined game hosted by " + hostlist.get(0) + ". Waiting for "
					+ hostlist.get(0) + "'s move ...";
		}
		for(Gameplayer2 gt: gs.getGames())
		{
			String[] temp=gt.getGamename().split("-");
			if(username.equals(temp[0])|| username.equals(temp[1]))
			{
				gs.removegame(gt);
				break;
			}
		}
		Gameplayer2 g=new Gameplayer2();
		g.setGamename(hostlist.get(0)+"-"+joinlist.get(0));
		gs.add(g);
	//	hostwire.remove(hostlist.get(0));
		//joinwire.remove(joinlist.get(0));
		model.put("user", username);
		model.put("msg", msgprint);
		return "player2";
	}
	@RequestMapping("/multigame.json")
	public String multigame(ModelMap models) {

		models.put("games", gs.getGames());
		return "jsonView";
	}
	@RequestMapping("/multigame.deferred.json")
	@ResponseBody
	public DeferredResult<List<Gameplayer2>> gameDeferred() {

		DeferredResult<List<Gameplayer2>> result = new DeferredResult<List<Gameplayer2>>();
		gs.addResult(result);
		return result;
	}

	
	@RequestMapping(value="/game2player.html" , method = RequestMethod.GET)
	public String multiplayer(ModelMap models,HttpSession session,@RequestParam Integer m)

	{
		String username=(String)session.getAttribute("username");
		
		for(Gameplayer2 g:gs.getGames())
		{
			String[] temp=g.getGamename().split("-");
			if(username.equals(temp[0]))
			{
				
				if(session.getAttribute("sd")== null)
					session.setAttribute("sd", new Date());
				g.getPlayer1().add(""+m);
				List<String> player=g.getPlayer1();
				Gameplayer2 t=new Gameplayer2();
				
				if ((player.contains("1") && player.contains("2") && player
						.contains("3"))
						|| (player.contains("4") && player.contains("5") && player
								.contains("6"))
						|| (player.contains("1") && player.contains("4") && player
								.contains("7"))
						|| (player.contains("2") && player.contains("5") && player
								.contains("8"))
						|| (player.contains("7") && player.contains("8") && player
								.contains("9"))
						|| (player.contains("3") && player.contains("6") && player
								.contains("9"))
						|| (player.contains("3") && player.contains("5") && player
								.contains("7"))
						|| (player.contains("1") && player.contains("5") && player
								.contains("9"))) {
					g.setResult(username+"won the match");
					System.out.println(g.getResult());
					Game gm=new Game();
					Date d=(Date)session.getAttribute("sd");
					gm.setStart_time(d);
					gm.setAiPlayer(false);
					gm.setCompleted(true);
					gm.setEnd_time(new Date());
					gm.setOutcome("WIN");
					gm.setP1(GameUserDao.getGameUser(username));
					gm.setP2(GameUserDao.getGameUser(temp[1]));
					gameDao.saveupdatedgame(gm);

				} 
				t=g;
				gs.removegame(g);
				gs.add(t);
				break;
				
			}
			else if(username.equals(temp[1]))
			{
				
				g.getPlayer2().add(""+m);
				List<String> computer=g.getPlayer2();
				Gameplayer2 t=new Gameplayer2();
			
				if ((computer.contains("1") && computer.contains("2") && computer
						.contains("3"))
						|| (computer.contains("4") && computer.contains("5") && computer
								.contains("6"))
						|| (computer.contains("7") && computer.contains("8") && computer
								.contains("9"))
						|| (computer.contains("1") && computer.contains("5") && computer
								.contains("9"))
						|| (computer.contains("1") && computer.contains("4") && computer
								.contains("7"))
						|| (computer.contains("2") && computer.contains("5") && computer
								.contains("8"))
						|| (computer.contains("3") && computer.contains("6") && computer
								.contains("9"))
						|| (computer.contains("3") && computer.contains("5") && computer
								.contains("7"))) {
					g.setResult(username+"won the match");}
				t=g;
				gs.removegame(g);
				gs.add(t);
				break;
			}
			
		}
		models.put("user", username);
		models.put("games", gs.getGames());
		return "player2";
	}

	
	
////////////////////////////////////////////////////////////////////////////////




	@RequestMapping("/Guest.html")
	public String Guest(HttpSession session, ModelMap model) {
		
		ArrayList<String> player = new ArrayList<String>();
		ArrayList<String> computer = new ArrayList<String>();
	
		String print = "Please make your move:";

		model.put("print", print);
		
		model.put("computer", computer);
		session.setAttribute("computer", computer);
		
		model.put("player", player);
		session.setAttribute("player", player);
		
	
		
		return "Guest";
		
	}


	@RequestMapping("/Guest2.html")
	public String Guest2(HttpSession session, ModelMap model, @RequestParam String id) {
		
		List<String> player = (List<String>) session.getAttribute(
				"player");
		List<String> computer = (List<String>) session
				.getAttribute("computer");

		String message = "Please make your move:";

	
		player.add(id);

		if ((computer.contains("2") && computer.contains("3") && !player
				.contains("1"))
				|| (computer.contains("4") && computer.contains("7") && !player
						.contains("1"))
				|| (computer.contains("5") && computer.contains("9") && !player
						.contains("1"))) {
			computer.add("1");
		}

		

		else if ((computer.contains("1") && computer.contains("3") && !player
				.contains("2"))
				|| (computer.contains("5") && computer.contains("8") && !player
						.contains("2"))
				|| (computer.contains("5") && computer.contains("8") && !player
						.contains("2"))) {
			computer.add("2");
		}

		

		else if ((computer.contains("1") && computer.contains("2") && !player
				.contains("3"))
				|| (computer.contains("6") && computer.contains("9") && !player
						.contains("3"))
				|| (computer.contains("5") && computer.contains("7") && !player
						.contains("3"))) {
			computer.add("3");
		} 
		else if ((computer.contains("5") && computer.contains("6") && !player
				.contains("4"))
				|| (computer.contains("1") && computer.contains("7") && !player
						.contains("4"))) {
			computer.add("4");
		} 

		else if ((computer.contains("4") && computer.contains("6") && !player
				.contains("5"))
				|| (computer.contains("2") && computer.contains("8") && !player
						.contains("5"))
				|| (computer.contains("1") && computer.contains("9") && !player
						.contains("5"))
				|| (computer.contains("3") && computer.contains("7") && !player
						.contains("5")))

		{
			computer.add("5");
		}

		else if ((computer.contains("4") && computer.contains("5") && !player
				.contains("6"))
				|| (computer.contains("3") && computer.contains("9") && !player
						.contains("6"))
				|| (player.contains("4") && player.contains("5") && !computer
						.contains("6"))
				|| (player.contains("3") && player.contains("9") && !computer
						.contains("6"))) {
			computer.add("6");
		}

		

		else if ((computer.contains("8") && computer.contains("9") && !player
				.contains("7"))
				|| (computer.contains("1") && computer.contains("4") && !player
						.contains("7"))
				|| (computer.contains("3") && computer.contains("5") && !player
						.contains("7"))) {
			computer.add("7");
		}

		else if ((computer.contains("7") && computer.contains("9") && !player
				.contains("8"))
				|| (computer.contains("2") && computer.contains("5") && !player
						.contains("8"))
				|| (player.contains("7") && player.contains("9") && !computer
						.contains("8"))) {
			computer.add("8");
		}

		else if ((computer.contains("7") && computer.contains("8") && !player
				.contains("9"))
				|| (computer.contains("3") && computer.contains("6") && !player
						.contains("9"))
				|| (computer.contains("1") && computer.contains("5") && !player
						.contains("9"))) {
			computer.add("9");
		} 

		// //////////////////////////////
		else {
			if ((player.contains("2") && player.contains("3") && !computer
					.contains("1"))
					|| (player.contains("4") && player.contains("7") && !computer
							.contains("1"))
					|| (player.contains("5") && player.contains("9") && !computer
							.contains("1"))) {
				computer.add("1");
			} else if ((player.contains("1") && player.contains("3") && !computer
					.contains("2"))
					|| (player.contains("5") && player.contains("8") && !computer
							.contains("2"))) {
				computer.add("2");
			} else if ((player.contains("6") && player.contains("9") && !computer
					.contains("3"))
					|| (player.contains("5") && player.contains("7") && !computer
							.contains("3"))
					|| (player.contains("6") && player.contains("9") && !computer
							.contains("3"))
					|| (player.contains("1") && player.contains("2") && !computer
							.contains("3"))) {
				computer.add("3");
			} else if ((player.contains("5") && player.contains("6") && !computer
					.contains("4"))
					|| (player.contains("1") && player.contains("7") && !computer
							.contains("4"))) {
				computer.add("4");
			} else if ((player.contains("4") && player.contains("6") && !computer
					.contains("5"))
					|| (player.contains("2") && player.contains("8") && !computer
							.contains("5"))
					|| (player.contains("3") && player.contains("7") && !computer
							.contains("5"))
					|| (player.contains("1") && player.contains("9") && !computer
							.contains("5")))

			{
				computer.add("5");
			}

			else if ((player.contains("4") && player.contains("5") && !computer
					.contains("6"))
					|| (player.contains("3") && player.contains("9") && !computer
							.contains("6"))) {
				computer.add("6");
			}

			else if ((player.contains("8") && player.contains("9") && !computer
					.contains("7"))
					|| (player.contains("8") && player.contains("9") && !computer
							.contains("7"))
					|| (player.contains("3") && player.contains("5") && !computer
							.contains("7"))
					|| (player.contains("1") && player.contains("4") && !computer
							.contains("7"))) {
				computer.add("7");
			}

			else if ((player.contains("2") && player.contains("5") && !computer
					.contains("8"))
					|| (player.contains("2") && player.contains("5") && !computer
							.contains("8"))) {
				computer.add("8");
			} else if ((player.contains("7") && player.contains("8") && !computer
					.contains("9"))
					|| (player.contains("3") && player.contains("6") && !computer
							.contains("9"))
					|| (player.contains("1") && player.contains("5") && !computer
							.contains("9"))) {
				computer.add("9");
			}

			else {

				String x = " ";
				do {
					int randomNum = 1 + (int) (Math.random() * 9);
					x = Integer.toString(randomNum);

					if (!player.contains(x) && !computer.contains(x)) {
						computer.add(x);

					}
				} while (!computer.contains(x));
			}
		}
		if ((player.contains("1") && player.contains("2") && player
				.contains("3"))
				|| (player.contains("4") && player.contains("5") && player
						.contains("6"))
				|| (player.contains("1") && player.contains("4") && player
						.contains("7"))
				|| (player.contains("2") && player.contains("5") && player
						.contains("8"))
				|| (player.contains("7") && player.contains("8") && player
						.contains("9"))
				|| (player.contains("3") && player.contains("6") && player
						.contains("9"))
				|| (player.contains("3") && player.contains("5") && player
						.contains("7"))
				|| (player.contains("1") && player.contains("5") && player
						.contains("9"))) {
			message = "You Won !";

		} else if ((computer.contains("1") && computer.contains("2") && computer
				.contains("3"))
				|| (computer.contains("4") && computer.contains("5") && computer
						.contains("6"))
				|| (computer.contains("7") && computer.contains("8") && computer
						.contains("9"))
				|| (computer.contains("1") && computer.contains("5") && computer
						.contains("9"))
				|| (computer.contains("1") && computer.contains("4") && computer
						.contains("7"))
				|| (computer.contains("2") && computer.contains("5") && computer
						.contains("8"))
				|| (computer.contains("3") && computer.contains("6") && computer
						.contains("9"))
				|| (computer.contains("3") && computer.contains("5") && computer
						.contains("7"))) {
			message = "I Won !";

		} else if ((player.contains("1") || computer.contains("1"))
				&& (player.contains("2") || computer.contains("2"))
				&& (player.contains("3") || computer.contains("3"))
				&& (player.contains("4") || computer.contains("4"))
				&& (player.contains("5") || computer.contains("5"))
				&& (player.contains("6") || computer.contains("6"))
				&& (player.contains("7") || computer.contains("7"))
				&& (player.contains("8") || computer.contains("8"))
				&& (player.contains("9") || computer.contains("9"))) {
			message = "Game Tied !";

		}

		model.put("message", message);
		model.put("computer", computer);
		session.setAttribute("computer", computer);

		model.put("player", player);
		session.setAttribute("player", player);

		
		
		return "Guest";
		
	}










}





