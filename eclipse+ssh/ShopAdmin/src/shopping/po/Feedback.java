package shopping.po;

public class Feedback {
	private int feedID;
	private String name;
	private String email;
	private String subject;
	private String propose;
	public Feedback() {}
	public Feedback(int feedID) {
		this.feedID=feedID;
	}
	public Feedback(String name,String email,String subject,String propose) {
		this.name=name;
		this.email=email;
		this.subject=subject;
		this.propose=propose;
	}
	public int getFeedID() {
		return feedID;
	}
	public void setFeedID(int feedID) {
		this.feedID = feedID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPropose() {
		return propose;
	}
	public void setPropose(String propose) {
		this.propose = propose;
	}
	
}
