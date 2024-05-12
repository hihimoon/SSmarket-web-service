package backendweb.z01_vo;

public class Product {

	private int pno;
	private String nickname;
	private String profile;
	private String category;
	private String title;
	private int price;
	private String pcontent;
	private String condition;
	private String transactionmethod;
	private String transactionlocation;
	private String writtendate;
	private String productimage;
	private int pavailable;
	private String location;

	public Product() {
	}

		//getProductListBySearch
	public Product(int pno, String nickname, String profile, String category, String title, int price, String pcontent,
			String condition, String transactionmethod, String transactionlocation, String writtendate,
			String productimage, int pavailable, String location) {
		this.pno = pno;
		this.nickname = nickname;
		this.profile = profile;
		this.category = category;
		this.title = title;
		this.price = price;
		this.pcontent = pcontent;
		this.condition = condition;
		this.transactionmethod = transactionmethod;
		this.transactionlocation = transactionlocation;
		this.writtendate = writtendate;
		this.productimage = productimage;
		this.pavailable = pavailable;
		this.location = location;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Product(int pno, String nickname, String profile, String category, String title, int price, String pcontent,
			String transactionmethod, String transactionlocation, String writtendate, String productimage,
			int pavailable) {
		this.pno = pno;
		this.nickname = nickname;
		this.profile = profile;
		this.category = category;
		this.title = title;
		this.price = price;
		this.pcontent = pcontent;
		this.transactionmethod = transactionmethod;
		this.transactionlocation = transactionlocation;
		this.writtendate = writtendate;
		this.productimage = productimage;
		this.pavailable = pavailable;
	}

	public Product(String category, String title) {
		this.category = category;
		this.title = title;
	}

	
	public Product(String category, String title, String location) {
		this.category = category;
		this.title = title;
		this.location = location;
	}

	public Product(int pno, String nickname, String category, String title, int price, String pcontent,
			String condition, String transactionmethod, String transactionlocation, String writtendate,
			int pavailable) {

		this.pno = pno;
		this.nickname = nickname;
		this.category = category;
		this.title = title;
		this.price = price;
		this.pcontent = pcontent;
		this.condition = condition;
		this.transactionmethod = transactionmethod;
		this.transactionlocation = transactionlocation;
		this.writtendate = writtendate;
		this.pavailable = pavailable;

	}
	public Product(int pno, String nickname, String category, String title, int price, String pcontent,
			String condition, String transactionmethod, String transactionlocation, String writtendate,
			int pavailable, String location) {
		
		this.pno = pno;
		this.nickname = nickname;
		this.category = category;
		this.title = title;
		this.price = price;
		this.pcontent = pcontent;
		this.condition = condition;
		this.transactionmethod = transactionmethod;
		this.transactionlocation = transactionlocation;
		this.writtendate = writtendate;
		this.pavailable = pavailable;
		this.location = location;
		
	}

	public Product(int pno, String category, String title) {
		this.pno = pno;
		this.category = category;
		this.title = title;
	}

	public Product(int pno) {
		this.pno = pno;
	}

	/*
	 * * public Product(int pno, String category, String title, int price, String
	 * pcontent, String transactionmethod, String transactionlocation) {
	 * 
	 * this.pno = pno; this.category = category; this.title = title; this.price =
	 * price; this.pcontent = pcontent; this.transactionmethod = transactionmethod;
	 * this.transactionlocation = transactionlocation; }
	 * 
	 * public Product(String category, String title, int price, String pcontent,
	 * String transactionmethod, String transactionlocation) { this.category =
	 * category; this.title = title; this.price = price; this.pcontent = pcontent;
	 * this.transactionmethod = transactionmethod; this.transactionlocation =
	 * transactionlocation; }
	 */

	public int getPno() {
		return pno;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getTransactionmethod() {
		return transactionmethod;
	}

	public void setTransactionmethod(String transactionmethod) {
		this.transactionmethod = transactionmethod;
	}

	public String getTransactionlocation() {
		return transactionlocation;
	}

	public void setTransactionlocation(String transactionlocation) {
		this.transactionlocation = transactionlocation;
	}

	public String getWrittendate() {
		return writtendate;
	}

	public void setWrittendate(String writtendate) {
		this.writtendate = writtendate;
	}

	public String getProductimage() {
		return productimage;
	}

	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}

	public int getPavailable() {
		return pavailable;
	}

	public void setPavailable(int pavailable) {
		this.pavailable = pavailable;
	}

}
