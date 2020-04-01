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
		private Users user;
		
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
		
		public Book getBook() {
			return book;
		}
		
		public void setBook(Book book) {
			this.book = book;
		}

		public Users getUser() {
			return user;
		}

		public void setUser(Users user) {
			this.user = user;
		}
}