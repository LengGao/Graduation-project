package enity;

import java.sql.Timestamp;

/**
 * TOrder entity. @author MyEclipse Persistence Tools
 */

public class TOrder implements java.io.Serializable {

	// Fields

	private String ordId;
	private TRoominfo TRoominfo;
	private TConstumer TConstumer;
	private TUser TUser;
	private Double rommDeposite;
	private Double staySolt;
	private Double collectedMoney;
	private Double expenditureMoney;
	private Double discount;
	private Timestamp roomOuttime;
	private Timestamp roomBooktime;

	// Constructors

	/** default constructor */
	public TOrder() {
	}

	/** minimal constructor */
	public TOrder(String ordId, TRoominfo TRoominfo, TConstumer TConstumer, TUser TUser) {
		this.ordId = ordId;
		this.TRoominfo = TRoominfo;
		this.TConstumer = TConstumer;
		this.TUser = TUser;
	}

	/** full constructor */
	public TOrder(String ordId, TRoominfo TRoominfo, TConstumer TConstumer, TUser TUser, Double rommDeposite,
			Double staySolt, Double collectedMoney, Double expenditureMoney, Double discount, Timestamp roomOuttime,
			Timestamp roomBooktime) {
		this.ordId = ordId;
		this.TRoominfo = TRoominfo;
		this.TConstumer = TConstumer;
		this.TUser = TUser;
		this.rommDeposite = rommDeposite;
		this.staySolt = staySolt;
		this.collectedMoney = collectedMoney;
		this.expenditureMoney = expenditureMoney;
		this.discount = discount;
		this.roomOuttime = roomOuttime;
		this.roomBooktime = roomBooktime;
	}

	// Property accessors

	public String getOrdId() {
		return this.ordId;
	}

	public void setOrdId(String ordId) {
		this.ordId = ordId;
	}

	public TRoominfo getTRoominfo() {
		return this.TRoominfo;
	}

	public void setTRoominfo(TRoominfo TRoominfo) {
		this.TRoominfo = TRoominfo;
	}

	public TConstumer getTConstumer() {
		return this.TConstumer;
	}

	public void setTConstumer(TConstumer TConstumer) {
		this.TConstumer = TConstumer;
	}

	public TUser getTUser() {
		return this.TUser;
	}

	public void setTUser(TUser TUser) {
		this.TUser = TUser;
	}

	public Double getRommDeposite() {
		return this.rommDeposite;
	}

	public void setRommDeposite(Double rommDeposite) {
		this.rommDeposite = rommDeposite;
	}

	public Double getStaySolt() {
		return this.staySolt;
	}

	public void setStaySolt(Double staySolt) {
		this.staySolt = staySolt;
	}

	public Double getCollectedMoney() {
		return this.collectedMoney;
	}

	public void setCollectedMoney(Double collectedMoney) {
		this.collectedMoney = collectedMoney;
	}

	public Double getExpenditureMoney() {
		return this.expenditureMoney;
	}

	public void setExpenditureMoney(Double expenditureMoney) {
		this.expenditureMoney = expenditureMoney;
	}

	public Double getDiscount() {
		return this.discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Timestamp getRoomOuttime() {
		return this.roomOuttime;
	}

	public void setRoomOuttime(Timestamp roomOuttime) {
		this.roomOuttime = roomOuttime;
	}

	public Timestamp getRoomBooktime() {
		return this.roomBooktime;
	}

	public void setRoomBooktime(Timestamp roomBooktime) {
		this.roomBooktime = roomBooktime;
	}

}