package kh.spring.dto;

import java.util.Date;

public class MessageDTO {
    private int seq;
    private String sender;
    private String recipient;
    private String contents;
    private String readOk;
    private Date message_date;
    
	public MessageDTO() {
		super();
	}

	public MessageDTO(int seq, String sender, String recipient, String contents, String readOk, Date message_date) {
		super();
		this.seq = seq;
		this.sender = sender;
		this.recipient = recipient;
		this.contents = contents;
		this.readOk = readOk;
		this.message_date = message_date;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getReadOk() {
		return readOk;
	}

	public void setReadOk(String readOk) {
		this.readOk = readOk;
	}

	public Date getMessage_date() {
		return message_date;
	}

	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}
	
    
    
}
