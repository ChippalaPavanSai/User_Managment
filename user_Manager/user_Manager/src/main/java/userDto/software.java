package userDto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class software 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	private String access_levels;
	
	public software(int id, String name, String description, String access_levels) 
	{
		this.id = id;
		this.name = name;
		this.description = description;
		this.access_levels = access_levels;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAccess_levels() {
		return access_levels;
	}
	public void setAccess_levels(String access_levels) {
		this.access_levels = access_levels;
	}
	public software() 
	{
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Software [id=" + id + ", name=" + name + ", description=" + description + ", access_levels="
				+ access_levels + "]";
	}
}
