package userDto;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class requests 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	private users user; 
	
	@ManyToMany
	private List<software>  software;;
	private String access_type;
	private String reason;
	private String status;
	public requests(users user, List<userDto.software> software, String access_type, String reason, String status) {
		super();
		this.user = user;
		this.software = software;
		this.access_type = access_type;
		this.reason = reason;
		this.status = status;
	}
	
	
	public requests() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public users getUser() {
		return user;
	}
	public void setUser(users user) {
		this.user = user;
	}
	public List<software> getSoftware() {
		return software;
	}
	public void setSoftware(List<software> software) {
		this.software = software;
	}
	public String getAccess_type() {
		return access_type;
	}
	public void setAccess_type(String access_type) {
		this.access_type = access_type;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "requests [id=" + id + ", user=" + user + ", software=" + software + ", access_type=" + access_type
				+ ", reason=" + reason + ", status=" + status + "]";
	}
	
	
	
	
}
