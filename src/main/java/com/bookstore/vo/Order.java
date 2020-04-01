package com.bookstore.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "Orders")
public class Order {
		
		@Id
		@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "order_Generator")
		@SequenceGenerator(name = "order_Generator",initialValue = 300000, allocationSize = 1,sequenceName = "order_Sequence")
		private long orderId;
		
		@Column(name = "bookId",nullable = false,length = 6)
		private long bookId;
		
		@Column(name = "date",nullable = false)
		private Date date = new Date();
		
		@Column(name = "status",nullable = false, length = 100)
		private String status;
		
		@Column(name = "paymentMode",nullable = false, length = 20)
		private String paymentMode = "Cash";
		
		//buyerId
		@ManyToOne
		private User user;

		@Override
		public String toString() {
			return "Order [orderId=" + orderId + ", bookId=" + bookId + ", date=" + date + ", status=" + status
					+ ", paymentMode=" + paymentMode + ", user=" + user + "]";
		}

		public long getOrderId() {
			return orderId;
		}

		public void setOrderId(long orderId) {
			this.orderId = orderId;
		}

		public long getBookId() {
			return bookId;
		}

		public void setBookId(long bookId) {
			this.bookId = bookId;
		}

		public Date getDate() {
			return date;
		}

		public void setDate(Date date) {
			this.date = date;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getPaymentMode() {
			return paymentMode;
		}

		public void setPaymentMode(String paymentMode) {
			this.paymentMode = paymentMode;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}
}
