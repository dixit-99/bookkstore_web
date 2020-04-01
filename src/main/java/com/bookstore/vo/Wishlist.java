package com.bookstore.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "Wishlist")
public class Wishlist {

		@Id
		@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "wish_Generator")
		@SequenceGenerator(name = "wish_Generator",initialValue = 400000, allocationSize = 1,sequenceName = "wish_Sequence")
		private long wishlistId;
		
		@ManyToOne
		private User user;
		
		@ManyToOne
		private Book book;
			
		@Override
		public String toString() {
			return "Wishlist [wishlistId=" + wishlistId + ", user=" + user + ", book=" + book + "]";
		}
		
		public long getWishlistId() {
			return wishlistId;
		}
		
		public void setWishlistId(long wishlistId) {
			this.wishlistId = wishlistId;
		}
		
		public User getUser() {
			return user;
		}
		
		public void setUser(User user) {
			this.user = user;
		}
		
		public Book getBook() {
			return book;
		}
		
		public void setBook(Book book) {
			this.book = book;
		}
}