package com.bookstore.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookstore.vo.User;

@Repository
public class UserDAO {
		
		@Autowired
		private SessionFactory sessionFactory;
		
		@Transactional
		public void addUser(User user) {
				Session session = sessionFactory.getCurrentSession();
				session.saveOrUpdate(user);
		}
		
		@Transactional
		public List login(String email, String password) {
				Session session = sessionFactory.getCurrentSession();
				Query q = session.createQuery("from User where email = '"+email+"' and password = '"+password+"'");
				List ls = q.list();
				return ls;
		}
		
		@Transactional
		public List getUser(long userId) {
				Session session = sessionFactory.getCurrentSession();
				Query query = session.createQuery("from User where userId = "+userId);
				List ls = query.list();
				return ls;
		}
		
		@Transactional
		public List getWishlist(long userId) {
				Session session = sessionFactory.getCurrentSession();
				Query query = session.createQuery("from Wishlist where user = "+userId);
				List ls = query.list();
				return ls;
		}
		
		@Transactional
		public List getSellingList(long userId) {
				Session session = sessionFactory.getCurrentSession();
				Query query = session.createQuery("from Book where user = "+userId);
				List ls = query.list();
				return ls;
		}
}
