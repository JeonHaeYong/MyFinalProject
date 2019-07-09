package kh.spring.dto;

public class QuizDTO {
	private int seq;
	private String quiz;	// 퀴즈 내용
	private String correct;	// 정답
	private int point;
	
	public QuizDTO() {}
	public QuizDTO(int seq, String quiz, String correct, int point) {
		this.seq = seq;
		this.quiz = quiz;
		this.correct = correct;
		this.point = point;
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
}
