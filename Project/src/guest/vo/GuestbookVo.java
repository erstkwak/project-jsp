package guest.vo;

public class GuestbookVo {
	// fields
	private int    gb_no;
	private String gb_id;
	private String gb_pass;
	private String gb_con;
	private int    gb_group;
	private int    gb_parent;
	private String gb_date;
	private int    gb_level;		// 답변글 깊이
	
	// constructor
	public GuestbookVo() {}

	public GuestbookVo(int gb_no, String gb_id, String gb_pass, String gb_con, int gb_group, int gb_parent,
			String gb_date, int gb_level) {
		this.gb_no = gb_no;
		this.gb_id = gb_id;
		this.gb_pass = gb_pass;
		this.gb_con = gb_con;
		this.gb_group = gb_group;
		this.gb_parent = gb_parent;
		this.gb_date = gb_date;
		this.gb_level = gb_level;
	}

	// getter & setter
	public int getGb_no() {
		return gb_no;
	}

	public void setGb_no(int gb_no) {
		this.gb_no = gb_no;
	}

	public String getGb_id() {
		return gb_id;
	}

	public void setGb_id(String gb_id) {
		this.gb_id = gb_id;
	}

	public String getGb_pass() {
		return gb_pass;
	}

	public void setGb_pass(String gb_pass) {
		this.gb_pass = gb_pass;
	}

	public String getGb_con() {
		return gb_con;
	}

	public void setGb_con(String gb_con) {
		this.gb_con = gb_con;
	}

	public int getGb_group() {
		return gb_group;
	}

	public void setGb_group(int gb_group) {
		this.gb_group = gb_group;
	}

	public int getGb_parent() {
		return gb_parent;
	}

	public void setGb_parent(int gb_parent) {
		this.gb_parent = gb_parent;
	}

	public String getGb_date() {
		return gb_date;
	}

	public void setGb_date(String gb_date) {
		this.gb_date = gb_date;
	}
	public int getGb_level() {
		return gb_level;
	}

	public void setGb_level(int gb_level) {
		this.gb_level = gb_level;
	}

	// toString()
	@Override
	public String toString() {
		return "GuestBookVo [gb_no=" + gb_no + ", gb_id=" + gb_id + ", gb_pass=" + gb_pass + ", gb_con=" + gb_con
				+ ", gb_group=" + gb_group + ", gb_parent=" + gb_parent + ", gb_date=" + gb_date + "]";
	}
}
