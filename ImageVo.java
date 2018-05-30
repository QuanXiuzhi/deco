package Vo;

public class ImageVo {
	private String pt_place;
	private int img_no;
	private String img_name;
	private int pt_no;
	private int mb_no;
	private String img_temp1;
	private String img_temp2;
	private String pt_title;
	private int pt_like;
	private int pt_hit;
	
	public ImageVo() {}

	public ImageVo(String pt_place, String img_temp1, String pt_title, int pt_like, int pt_hit) {
		super();
		this.pt_place = pt_place;
		this.img_temp1 = img_temp1;
		this.pt_title = pt_title;
		this.pt_like = pt_like;
		this.pt_hit = pt_hit;
	}

	public String getPt_place() {
		return pt_place;
	}

	public void setPt_place(String pt_place) {
		this.pt_place = pt_place;
	}

	public int getImg_no() {
		return img_no;
	}

	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public int getPt_no() {
		return pt_no;
	}

	public void setPt_no(int pt_no) {
		this.pt_no = pt_no;
	}

	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public String getImg_temp1() {
		return img_temp1;
	}

	public void setImg_temp1(String img_temp1) {
		this.img_temp1 = img_temp1;
	}

	public String getImg_temp2() {
		return img_temp2;
	}

	public void setImg_temp2(String img_temp2) {
		this.img_temp2 = img_temp2;
	}

	public String getPt_title() {
		return pt_title;
	}

	public void setPt_title(String pt_title) {
		this.pt_title = pt_title;
	}

	public int getPt_like() {
		return pt_like;
	}

	public void setPt_like(int pt_like) {
		this.pt_like = pt_like;
	}

	public int getPt_hit() {
		return pt_hit;
	}

	public void setPt_hit(int pt_hit) {
		this.pt_hit = pt_hit;
	}
	
	

}
