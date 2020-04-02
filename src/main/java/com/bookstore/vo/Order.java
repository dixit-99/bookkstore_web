package com.bookstore.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "Orders")
public class Order {
		
		@Id
		@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "order_Generator")
		@SequenceGenerator(name = "order_Generator",initialValue = 300000, allocationSize = 1,sequenceName = "order_Sequence")
		private long orderId;
		
		@Column(name = "date",nullable = false)
		private Date date = new Date();
		
		@Column(name = "paymentMode",nullable = false, length = 20)
		private String paymentMode = "Cash";
		
		//sellerId
		@OneToOne
		private Book book;
		
		//buyerId
		@ManyToOne
		private User user;
		
		@Override
		public String toString() {
			return "Order [orderId=" + orderId + ", date=" + date + ", paymentMode=" + paymentMode + ", book=" + book
					+ ", user=" + user + "]";
		}

		public long getOrderId() {
			return orderId;
		}

		public void setOrderId(long orderId) {
			this.orderId = orderId;
		}

		public Date getDate() {
			return date;
		}

		public void setDate(Date date) {
			this.date = date;
		}

		public String getPaymentMode() {
			return paymentMode;
		}

		public void setPaymentMode(String paymentMode) {
			this.paymentMode = paymentMode;
		}
		
		public Book getBook() {
			return book;
		}

		public void setBook(Book book) {
			this.book = book;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}
}
