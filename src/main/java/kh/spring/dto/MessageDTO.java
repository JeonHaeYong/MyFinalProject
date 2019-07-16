package kh.spring.dto;

public class MessageDTO {
    private int seq;
    private String sender;
    private String recipient;
    private String contents;
    private String readOk;
    private String message_date;
    private String owner;
    private int subseq;
    
	public MessageDTO() {
		super();
	}
	
	public MessageDTO(int seq, String sender, String recipient, String contents, String readOk, String message_date,
			String owner, int subseq) {
		super();
		this.seq = seq;
		this.sender = sender;
		this.recipient = recipient;
		this.contents = contents;
		this.readOk = readOk;
		this.message_date = message_date;
		this.owner = owner;
		this.subseq = subseq;
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

	public String getMessage_date() {
		return message_date;
	}

	public void setMessage_date(String message_date) {
		this.message_date = message_date;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public int getSubseq() {
		return subseq;
	}

	public void setSubseq(int subseq) {
		this.subseq = subseq;
	}
	

}
