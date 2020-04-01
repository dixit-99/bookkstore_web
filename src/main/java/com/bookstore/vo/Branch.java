package com.bookstore.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Branch")
public class Branch {
	
		@Id
		@Column(name = "branchId",length = 2,nullable = false)
		private int branchId;
		
		@Column(name = "branchCode",length = 2,nullable = false)
		private int branchCode;
		
		@Column(name = "branchName",length = 50, nullable = false)
		private String branchName;
	
		@Override
		public String toString() {
			return "Branch [branchId=" + branchId + ", branchCode=" + branchCode + ", branchName=" + branchName + "]";
		}
	
		public int getBranchId() {
			return branchId;
		}
	
		public void setBranchId(int branchId) {
			this.branchId = branchId;
		}
	
		public int getBranchCode() {
			return branchCode;
		}
	
		public void setBranchCode(int branchCode) {
			this.branchCode = branchCode;
		}
	
		public String getBranchName() {
			return branchName;
		}
	
		public void setBranchName(String branchName) {
			this.branchName = branchName;
		}
}
