package model;
import java.text.NumberFormat;
public class HighLow {
	private String betType;
	private double balance;
	private double betAmount;
	private double betMultiplier;
	private boolean win;
	
	public HighLow() {
		this.balance = 1000;
	}
	
	public HighLow(double balance) {
		this.balance = balance;
	}
	
	public HighLow(String bet, double balance, double betAmount ) {
		this.betType = bet;
		this.balance = balance;
		this.betAmount = betAmount;
	}
	
	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public double getBetAmount() {
		return betAmount;
	}

	public void setBetAmount(double betAmount) {
		this.betAmount = betAmount;
	}

	public String getBetType() {
		return this.betType;
	}
	
	public void setBetType(String betType) {
		this.betType = betType;
	}
	
	public boolean winLoss(int d1, int d2) {
		this.win = false;
		int userVal = d1 + d2;
		switch(this.betType) {
		case "low":
			this.betMultiplier = 1;
			if (userVal >= 2 && userVal <= 6) {
				this.win = true;
				
			}
			break;
		case "seven":
			this.betMultiplier = 4;
			if (userVal == 7) {
				this.win = true;
			}
			else
				this.betMultiplier = 1;
			break;
		case "high":
			this.betMultiplier = 1;
			if (userVal < 13 && userVal > 7) {
				this.win = true;
			}
			break;
		}
		if(this.win != true)
			this.betMultiplier = -1 * this.betMultiplier;
		
		return win;
	}
	
	public String getMsg() {
		NumberFormat cf = NumberFormat.getCurrencyInstance();
		String msg ="";
		double earn;
		if(this.win)
			msg = "<p>Congratulations! You won " + cf.format(this.getEarnings()) + "</p>";
		else {
			earn = -(this.getEarnings());
			msg = "<p>Tough luck! You lost " + cf.format(earn) + "</p>";
		}
		
		return msg;
	}
	
	public double getEarnings() {
		double earnings = this.betMultiplier * this.getBetAmount();
		this.balance += earnings;
		this.setBalance(balance);
		
		return earnings;
		
	}
	
}
