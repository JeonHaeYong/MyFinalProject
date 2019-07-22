package kh.spring.dto;

public class DonationPaymentDTO {
	private int seq;
	private String donator;
	private String donator_name;
	private String donation_name;
	private int donation;
	private String donated_time;
	private String docate_type;
	
	public DonationPaymentDTO() {
		super();
	}

	public DonationPaymentDTO(int seq, String donator, String donator_name, String donation_name, int donation,
			String donated_time, String docate_type) {
		super();
		this.seq = seq;
		this.donator = donator;
		this.donator_name = donator_name;
		this.donation_name = donation_name;
		this.donation = donation;
		this.donated_time = donated_time;
		this.docate_type = docate_type;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getDonator() {
		return donator;
	}

	public void setDonator(String donator) {
		this.donator = donator;
	}

	public String getDonator_name() {
		return donator_name;
	}

	public void setDonator_name(String donator_name) {
		this.donator_name = donator_name;
	}

	public String getDonation_name() {
		return donation_name;
	}

	public void setDonation_name(String donation_name) {
		this.donation_name = donation_name;
	}

	public int getDonation() {
		return donation;
	}

	public void setDonation(int donation) {
		this.donation = donation;
	}

	public String getDonated_time() {
		return donated_time;
	}

	public void setDonated_time(String donated_time) {
		this.donated_time = donated_time;
	}

	public String getDocate_type() {
		return docate_type;
	}

	public void setDocate_type(String docate_type) {
		this.docate_type = docate_type;
	}
	
}
