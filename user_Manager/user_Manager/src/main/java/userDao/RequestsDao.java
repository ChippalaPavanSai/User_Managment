package userDao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import userDto.requests;

public class RequestsDao {
	 
	EntityManager em=Persistence.createEntityManagerFactory("ashok").createEntityManager();
	EntityTransaction et=em.getTransaction();
    public List<requests> getPendingRequests() {
        List<requests> pendingRequests = new ArrayList<>();
        // Database logic to fetch requests with status "Pending"
        
        Query q=em.createQuery("select a from requests a where a.status='pending'");
        pendingRequests=q.getResultList();
        System.out.println(pendingRequests);
        return pendingRequests;
    }

   public void saveRequest(requests r)
   {
	   et.begin();
	   em.persist(r);
	   et.commit();
   }
   public void updateRequestStatus(int requestId, String status) {
	    
	    et.begin();
	    Query query = em.createQuery("UPDATE requests a SET a.status = :status WHERE a.id = :requestId");
	    
	    query.setParameter("status", status);
	    query.setParameter("requestId", requestId);
	    
	   
	    int n = query.executeUpdate();
	    System.out.println(n + " row(s) updated.");
	   
	    et.commit();
	}


}
