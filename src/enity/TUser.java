package enity;

import java.util.HashSet;
import java.util.Set;

/**
 * TUser entity. @author MyEclipse Persistence Tools
 */

public class TUser implements java.io.Serializable {

	// Fields

	private String userId;
	private String userName;
	private String userPassword;
	private String userSex;
	private String userTelephone;
	private Integer userIsManager;
	private Set TOrders = new HashSet(0);

	// Constructors

	/** default constructor */
	public TUser() {
	}

	/** minimal constructor */
	public TUser(String userId, String userPassword) {
		this.userId = userId;
		this.userPassword = userPassword;
	}

	/** full constructor */
	public TUser(String userId, String userName, String userPassword, String userSex, String userTelephone,
			Integer userIsManager, Set TOrders) {
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userSex = userSex;
		this.userTelephone = userTelephone;
		this.userIsManager = userIsManager;
		this.TOrders = TOrders;
	}

	// Property accessors

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserSex() {
		return this.userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserTelephone() {
		return this.userTelephone;
	}

	public void setUserTelephone(String userTelephone) {
		this.userTelephone = userTelephone;
	}

	public Integer getUserIsManager() {
		return this.userIsManager;
	}

	public void setUserIsManager(Integer userIsManager) {
		this.userIsManager = userIsManager;
	}

	public Set getTOrders() {
		return this.TOrders;
	}

	public void setTOrders(Set TOrders) {
		this.TOrders = TOrders;
	}

}