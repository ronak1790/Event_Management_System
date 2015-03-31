package ttt.model;

import java.util.Date;

public class MonthModel {

	Date StartTime;
	Date EndTime;

	Long Duration;
	String Opponent;
	String Result;
	
	
	public MonthModel(Date StartTime, Date EndTime, Long Duration, String Opponent, String Result) {
		this.StartTime = StartTime;
		this.EndTime = EndTime;
		this.Duration = Duration;
		this.Opponent = Opponent;
		this.Result = Result;
		
	}
	

	public Date getStartTime() {
		return StartTime;
	}
	public void setStartTime(Date startTime) {
		StartTime = startTime;
	}
	public Date getEndTime() {
		return EndTime;
	}
	public void setEndTime(Date endTime) {
		EndTime = endTime;
	}
	public Long getDuration() {
		return Duration;
	}
	public void setDuration(Long duration) {
		Duration = duration;
	}
	public String getOpponent() {
		return Opponent;
	}
	public void setOpponent(String opponent) {
		Opponent = opponent;
	}
	public String getResult() {
		return Result;
	}
	public void setResult(String result) {
		Result = result;
	}
	
	
}
