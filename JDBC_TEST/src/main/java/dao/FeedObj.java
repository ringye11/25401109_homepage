package dao;

public class FeedObj {
	private int no;
	private String id;
    private String content;
    private String ts;
    private String images;
    private String pwd;
	
	public FeedObj(int no, String id, String content, String ts, String images) {
		this.no = no;
		this.id = id;
		this.content = content;
		this.ts = ts;
		this.images = images;
	}
	
	
	public FeedObj(String id, String content, String ts, String images, String pwd) {
		this.id = id;
		this.content = content;
		this.ts = ts;
		this.images = images;
		this.pwd = pwd;
	}
	

	public int getNo() { return this.no; }
	public String getId() { return this.id; }
	public String getContent() { return this.content; }
	public String getTs() { return this.ts; }
	public String getImages() { return this.images; }
	public String getPwd() { return this.pwd; }
}
