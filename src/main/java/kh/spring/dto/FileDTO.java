package kh.spring.dto;

import org.springframework.web.multipart.MultipartFile;

public class FileDTO {
	private String title;
	private String content;
	private MultipartFile files;
	public FileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FileDTO(String title, String content, MultipartFile files) {
		super();
		this.title = title;
		this.content = content;
		this.files = files;
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
	public MultipartFile getFiles() {
		return files;
	}
	public void setFiles(MultipartFile files) {
		this.files = files;
	}
}
