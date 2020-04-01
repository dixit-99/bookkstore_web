package com.bookstore.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "User")
public class Users {
		
		@Id
		@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "user_Generator")
		@SequenceGenerator(name = "user_Generator",initialValue = 100000, allocationSize = 1,sequenceName = "user_Sequence")
		private long userId;
		
		@Column(name = "userName",nullable = false,length = 20)
		private String userName;
		
		@Column(name = "password",nullable = false,length = 8)
		private String password;
		
		@Column(name = "userType",nullable = false,length = 10)
		private String userType;
		
		@Column(name = "gender",nullable = false,length = 10)
		private String gender;
		
		@Column(name = "email",nullable = false,length = 30,unique = true)
		private String email;
		
		@Column(name = "mobileNo",nullable = false,length = 10)
		private String mobileNo;
		
		@Override
		public String toString() {
			return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", userType="
					+ userType + ", email=" + email + ", mobileNo=" + mobileNo + "]";
		}

		public long getUserId() {
			return userId;
		}

		public void setUserId(long userId) {
			this.userId = userId;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getUserType() {
			return userType;
		}

		public void setUserType(String userType) {
			this.userType = userType;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getMobileNo() {
			return mobileNo;
		}

		public void setMobileNo(String mobileNo) {
			this.mobileNo = mobileNo;
		}

		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}
}
