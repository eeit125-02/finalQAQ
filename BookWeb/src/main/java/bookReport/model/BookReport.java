package bookReport.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "BookReport")
public class BookReport {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int BR_ID;
	private int MB_ID;
	private int BK_ID;
	@Column(columnDefinition = "nvarchar(Max)")
	private String BR_Content;
	private Date BR_Update;

	public BookReport() {
		super();
	}

	public BookReport(int bR_ID, int mB_ID, int bK_ID, String bR_Content, Date bR_Update) {
		super();
		BR_ID = bR_ID;
		MB_ID = mB_ID;
		BK_ID = bK_ID;
		BR_Content = bR_Content;
		BR_Update = bR_Update;
	}

	public int getBR_ID() {
		return BR_ID;
	}

	public void setBR_ID(int bR_ID) {
		BR_ID = bR_ID;
	}

	public int getMB_ID() {
		return MB_ID;
	}

	public void setMB_ID(int mB_ID) {
		MB_ID = mB_ID;
	}

	public int getBK_ID() {
		return BK_ID;
	}

	public void setBK_ID(int bK_ID) {
		BK_ID = bK_ID;
	}

	public String getBR_Content() {
		return BR_Content;
	}

	public void setBR_Content(String bR_Content) {
		BR_Content = bR_Content;
	}

	public Date getBR_Update() {
		return BR_Update;
	}

	public void setBR_Update(Date bR_Update) {
		BR_Update = bR_Update;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BookReport [BR_ID=");
		builder.append(BR_ID);
		builder.append(", MB_ID=");
		builder.append(MB_ID);
		builder.append(", BK_ID=");
		builder.append(BK_ID);
		builder.append(", BR_Content=");
		builder.append(BR_Content);
		builder.append(", BR_Update=");
		builder.append(BR_Update);
		builder.append("]");
		return builder.toString();
	}

}
