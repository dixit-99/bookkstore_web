package com.bookstore.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "Book")
public class Book {
		
		@Id
		@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "book_Generator")
		@SequenceGenerator(name = "book_Generator",initialValue = 200000, allocationSize = 1,sequenceName = "book_Sequence")
		private Long bookId;
		
		@Column(name = "bookName",nullable = false,length = 20)
		private String bookName;
		
		@Column(name="authorName",length = 30,nullable = false)
		private String authorName;
		
		@Column(name="publication",length = 30,nullable = false)
		private String publication;
		
		@Column(name="edition",length = 2,nullable = false)
		private Integer edition;
		
		@Column(name="publishedYear",length = 4,nullable = false)
		private Integer publishedYear;
		
		@Column(name="totalPage",length = 4,nullable = false)
		private Integer totalPage;
		
		@Column(name="bookCondition",length = 10,nullable = false)
		private String bookCondition;
		
		@Column(name="originalPrice",length = 4,nullable = false)
		private Integer originalPrice;
		
		@Column(name="sellingPrice",length = 4,nullable = false)
		private Integer sellingPrice;
		
		@Column(name="discount",length = 2,nullable = false)
		private Integer discount;
		
		@Column(name="frontImage",length = 200,nullable = false)
		private String frontImage;
		
		@Column(name="backImage",length = 200,nullable = false)
		private String backImage;
		
		@Column(name = "seen",length = 4,nullable = false)
		private Integer views = 0;
		
		@Column(name = "status",nullable = false)
		private boolean status = true;
		
		@ManyToOne
		private Subject subject;
		
		//seller Id
		@ManyToOne
		private User user;
		
		@Override
		public String toString() {
			return "Book [bookId=" + bookId + ", bookName=" + bookName + ", authorName=" + authorName + ", publication="
					+ publication + ", edition=" + edition + ", publishedYear=" + publishedYear + ", totalPage="
					+ totalPage + ", bookCondition=" + bookCondition + ", originalPrice=" + originalPrice
					+ ", sellingPrice=" + sellingPrice + ", discount=" + discount + ", frontImage=" + frontImage
					+ ", backImage=" + backImage + ", views=" + views + ", status=" + status + ", subject=" + subject
					+ ", user=" + user + "]";
		}

		public Long getBookId() {
			return bookId;
		}

		public void setBookId(Long bookId) {
			this.bookId = bookId;
		}

		public String getBookName() {
			return bookName;
		}

		public void setBookName(String bookName) {
			this.bookName = bookName;
		}

		public String getAuthorName() {
			return authorName;
		}

		public void setAuthorName(String authorName) {
			this.authorName = authorName;
		}

		public String getPublication() {
			return publication;
		}

		public void setPublication(String publication) {
			this.publication = publication;
		}

		public Integer getEdition() {
			return edition;
		}

		public void setEdition(Integer edition) {
			this.edition = edition;
		}

		public Integer getPublishedYear() {
			return publishedYear;
		}

		public void setPublishedYear(Integer publishedYear) {
			this.publishedYear = publishedYear;
		}

		public Integer getTotalPage() {
			return totalPage;
		}

		public void setTotalPage(Integer totalPage) {
			this.totalPage = totalPage;
		}

		public String getBookCondition() {
			return bookCondition;
		}

		public void setBookCondition(String bookCondition) {
			this.bookCondition = bookCondition;
		}

		public Integer getOriginalPrice() {
			return originalPrice;
		}

		public void setOriginalPrice(Integer originalPrice) {
			this.originalPrice = originalPrice;
		}

		public Integer getSellingPrice() {
			return sellingPrice;
		}

		public void setSellingPrice(Integer sellingPrice) {
			this.sellingPrice = sellingPrice;
		}

		public Integer getDiscount() {
			return discount;
		}

		public void setDiscount(Integer discount) {
			this.discount = discount;
		}

		public String getFrontImage() {
			return frontImage;
		}

		public void setFrontImage(String frontImage) {
			this.frontImage = frontImage;
		}

		public String getBackImage() {
			return backImage;
		}

		public void setBackImage(String backImage) {
			this.backImage = backImage;
		}

		public Integer getViews() {
			return views;
		}

		public void setViews(Integer views) {
			this.views = views;
		}

		public boolean isStatus() {
			return status;
		}

		public void setStatus(boolean status) {
			this.status = status;
		}

		public Subject getSubject() {
			return subject;
		}

		public void setSubject(Subject subject) {
			this.subject = subject;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

}
