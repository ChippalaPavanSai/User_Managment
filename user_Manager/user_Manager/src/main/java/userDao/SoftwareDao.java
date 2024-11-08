package userDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import userDto.software;

public class SoftwareDao 
{
	EntityManager em=Persistence.createEntityManagerFactory("ashok").createEntityManager();
	EntityTransaction et=em.getTransaction();
	public void saveSoftware(software s)
	{
		et.begin();
		em.merge(s);
		et.commit();
	}
	public List fetchSoftware()
	{
		Query q=em.createQuery("select a from software a");
		List<software> l=q.getResultList();
		return l;
	}
	public software fetchSoftwareById(int id) {
	    Query q = em.createQuery("SELECT a FROM software a WHERE a.id = :id");
	    q.setParameter("id", id);
	    software l = (software)q.getSingleResult();
	    return l;
	}

}
