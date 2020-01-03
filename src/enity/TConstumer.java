package enity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * TConstumer entity. @author MyEclipse Persistence Tools
 */

public class TConstumer implements java.io.Serializable {

	// Fields

	private String corId;
	private String corIdtype;
	private String corIdcard;
	private String corName;
	private String corTelephone;
	private Timestamp corBooktime;
	private Timestamp corOuttime;
	private Set TOrders = new HashSet(0);

	// Constructors

	/** default constructor */
	public TConstumer() {
	}

	/** minimal constructor */
	public TConstumer(String corId, String corIdtype, String corIdcard, String corName) {
		this.corId = corId;
		this.corIdtype = corIdtype;
		this.corIdcard = corIdcard;
		this.corName = corName;
	}

	/** full constructor */
	public TConstumer(String corId, String corIdtype, String corIdcard, String corName, String corTelephone,
			Timestamp corBooktime, Timestamp corOuttime, Set TOrders) {
		this.corId = corId;
		this.corIdtype = corIdtype;
		this.corIdcard = corIdcard;
		this.corName = corName;
		this.corTelephone = corTelephone;
		this.corBooktime = corBooktime;
		this.corOuttime = corOuttime;
		this.TOrders = TOrders;
	}

	// Property accessors

	public String getCorId() {
		return this.corId;
	}

	public void setCorId(String corId) {
		this.corId = corId;
	}

	public String getCorIdtype() {
		return this.corIdtype;
	}

	public void setCorIdtype(String corIdtype) {
		this.corIdtype = corIdtype;
	}

	public String getCorIdcard() {
		return this.corIdcard;
	}

	public void setCorIdcard(String corIdcard) {
		this.corIdcard = corIdcard;
	}

	public String getCorName() {
		return this.corName;
	}

	public void setCorName(String corName) {
		this.corName = corName;
	}

	public String getCorTelephone() {
		return this.corTelephone;
	}

	public void setCorTelephone(String corTelephone) {
		this.corTelephone = corTelephone;
	}

	public Timestamp getCorBooktime() {
		return this.corBooktime;
	}

	public void setCorBooktime(Timestamp corBooktime) {
		this.corBooktime = corBooktime;
	}

	public Timestamp getCorOuttime() {
		return this.corOuttime;
	}

	public void setCorOuttime(Timestamp corOuttime) {
		this.corOuttime = corOuttime;
	}

	public Set getTOrders() {
		return this.TOrders;
	}

	public void setTOrders(Set TOrders) {
		this.TOrders = TOrders;
	}

}