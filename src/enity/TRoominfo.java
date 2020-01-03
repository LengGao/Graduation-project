package enity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * TRoominfo entity. @author MyEclipse Persistence Tools
 */

public class TRoominfo implements java.io.Serializable {

	// Fields

	private String roomId;
	private String roomType;
	private Integer roomBed;
	private Double roomPrice;
	private Double rommDeposite;
	private String roomResever;
	private Integer roomState;
	private Timestamp roomBooktime;
	private Timestamp roomOuttime;
	private Set TOrders = new HashSet(0);

	// Constructors

	/** default constructor */
	public TRoominfo() {
	}

	/** minimal constructor */
	public TRoominfo(String roomId, String roomType, Integer roomBed, Double roomPrice, Double rommDeposite,
			Integer roomState) {
		this.roomId = roomId;
		this.roomType = roomType;
		this.roomBed = roomBed;
		this.roomPrice = roomPrice;
		this.rommDeposite = rommDeposite;
		this.roomState = roomState;
	}

	/** full constructor */
	public TRoominfo(String roomId, String roomType, Integer roomBed, Double roomPrice, Double rommDeposite,
			String roomResever, Integer roomState, Timestamp roomBooktime, Timestamp roomOuttime, Set TOrders) {
		this.roomId = roomId;
		this.roomType = roomType;
		this.roomBed = roomBed;
		this.roomPrice = roomPrice;
		this.rommDeposite = rommDeposite;
		this.roomResever = roomResever;
		this.roomState = roomState;
		this.roomBooktime = roomBooktime;
		this.roomOuttime = roomOuttime;
		this.TOrders = TOrders;
	}

	// Property accessors

	public String getRoomId() {
		return this.roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getRoomType() {
		return this.roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public Integer getRoomBed() {
		return this.roomBed;
	}

	public void setRoomBed(Integer roomBed) {
		this.roomBed = roomBed;
	}

	public Double getRoomPrice() {
		return this.roomPrice;
	}

	public void setRoomPrice(Double roomPrice) {
		this.roomPrice = roomPrice;
	}

	public Double getRommDeposite() {
		return this.rommDeposite;
	}

	public void setRommDeposite(Double rommDeposite) {
		this.rommDeposite = rommDeposite;
	}

	public String getRoomResever() {
		return this.roomResever;
	}

	public void setRoomResever(String roomResever) {
		this.roomResever = roomResever;
	}

	public Integer getRoomState() {
		return this.roomState;
	}

	public void setRoomState(Integer roomState) {
		this.roomState = roomState;
	}

	public Timestamp getRoomBooktime() {
		return this.roomBooktime;
	}

	public void setRoomBooktime(Timestamp roomBooktime) {
		this.roomBooktime = roomBooktime;
	}

	public Timestamp getRoomOuttime() {
		return this.roomOuttime;
	}

	public void setRoomOuttime(Timestamp roomOuttime) {
		this.roomOuttime = roomOuttime;
	}

	public Set getTOrders() {
		return this.TOrders;
	}

	public void setTOrders(Set TOrders) {
		this.TOrders = TOrders;
	}

}