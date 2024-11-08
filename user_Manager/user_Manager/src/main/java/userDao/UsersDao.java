package userDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

import userDto.users;

public class UsersDao 
{
	EntityManager em=Persistence.createEntityManagerFactory("ashok").createEntityManager();
	EntityTransaction et=em.getTransaction();
	public boolean checkRegisterUser(String username) {
	    Query q = em.createQuery("SELECT a FROM users a WHERE a.username = :username");
	    q.setParameter("username", username);
	    return !q.getResultList().isEmpty();
	}

	public void saveUser(users s)
	{
		et.begin();
		em.persist(s);
		et.commit();
	}
	
	public users signUpUser(String userName) {
		try {
			Query q = em.createQuery("SELECT a FROM users a WHERE a.username = :username");
			q.setParameter("username", userName);
			return (users) q.getSingleResult();
		} catch (NoResultException e) {
			return null; // Return null if no user with the given username is found
		}
	}
}
