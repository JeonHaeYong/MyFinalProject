package kh.spring.dto;

public class QuizDTO {
	private int seq;
	private String quiz;	// ���� ����
	private String correct;	// ����
	private int point;
	private String explain;
	
	public QuizDTO() {}
	public QuizDTO(int seq, String quiz, String correct, int point, String explain) {
		this.seq = seq;
		this.quiz = quiz;
		this.correct = correct;
		this.point = point;
		this.explain = explain;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getQuiz() {
		return quiz;
	}
	public void setQuiz(String quiz) {
		this.quiz = quiz;
	}
	public String getCorrect() {
		return correct;
	}
	public void setCorrect(String correct) {
		this.correct = correct;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
}
