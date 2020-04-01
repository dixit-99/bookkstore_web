package com.bookstore.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookstore.vo.Book;
import com.bookstore.vo.Wishlist;


@Repository
public class BookDAO {

		@Autowired
		private SessionFactory sessionFactory;
		
		@Transactional
		public void addBook(Book book) {
				Session session = sessionFactory.getCurrentSession();
				session.saveOrUpdate(book);
		}
		
		@Transactional
		public List getSubject(String branch, String sem) {
				Session session = sessionFactory.getCurrentSession();
				Query q = session.createQuery("from Subject where semester = "+sem+" and branch = "+branch);
				List ls = q.list();
				return ls;
		}
		
		@Transactional
		public List getBooks(Object obj) {
				long userId = Long.parseLong(obj.toString());
				Session session = sessionFactory.getCurrentSession();
				Query q = session.createQuery("from Wishlist where user = "+userId);
				List<Wishlist> wishlist = q.list();
				List<Book> rm = new ArrayList<Book>();
				for(Wishlist w:wishlist) {
					rm.add(w.getBook());
				}
				q = session.createQuery("from Book where status=true order by bookId desc");
				List<Book> bookList = q.list();
				bookList.removeAll(rm);
				return bookList;
		}
		
		@Transactional
		public List bookDetails(long bookId) {
				Session session = sessionFactory.getCurrentSession();
				Query q = session.createQuery("from Book where bookId="+bookId);
				List ls = q.list();
				return ls;
		}
		
		@Transactional
		public List applyFilter(int subjectId) {
				Session session = sessionFactory.getCurrentSession();
				Query q = session.createQuery("from Book where status=true and subject="+subjectId);
				List ls = q.list();
				return ls;
		}
		
		@Transactional
		public List bookCondition(int subjectId, String bookCondition) {
				Session session = sessionFactory.getCurrentSession();
				Query q = session.createQuery("from Book where status=true and subject="+subjectId+" and bookCondition='"+bookCondition+"'");
				List ls = q.list();
				return ls;
		}
		
		@Transactional
		public void addWish(Wishlist wishlist) {
				Session session = sessionFactory.getCurrentSession();
				session.saveOrUpdate(wishlist);
		}
		
		@Transactional
		public void rmWish(Wishlist wishlist) {
				Session session = sessionFactory.getCurrentSession();
				Query q = session.createSQLQuery("delete from wishlist where book_bookId="+wishlist.getBook().getBookId()+" and user_userId="+wishlist.getUser().getUserId());
				q.executeUpdate();
		}
	
}
