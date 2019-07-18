package kh.spring.dto;

import org.springframework.web.multipart.MultipartFile;

public class FileDTO {
	private String title;
	private String content;
	private MultipartFile image;
	public FileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FileDTO(String title, String content, MultipartFile image) {
		super();
		this.title = title;
		this.content = content;
		this.image = image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
}
