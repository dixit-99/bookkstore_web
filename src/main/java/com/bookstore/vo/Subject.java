package com.bookstore.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Subject")
public class Subject {
		
		@Id
		@Column(name = "subjectId",length = 3)
		private int subjectId;
		
		@Column(name="subjectName",length = 10,nullable = false)
		private String subjectName;
		
		@Column(name="subjectCode",length = 7,nullable = false)
		private int subjectCode;
		
		@Column(name="semester",length = 1,nullable = false)
		private int semester;
		
		@ManyToOne
		private Branch branch;
		
		@Override
		public String toString() {
			return "Subject [subjectId=" + subjectId + ", subjectName=" + subjectName + ", subjectCode=" + subjectCode
					+ ", semester=" + semester + ", branch=" + branch + "]";
		}

		public int getSubjectId() {
			return subjectId;
		}

		public void setSubjectId(int subjectId) {
			this.subjectId = subjectId;
		}

		public String getSubjectName() {
			return subjectName;
		}

		public void setSubjectName(String subjectName) {
			this.subjectName = subjectName;
		}

		public int getSubjectCode() {
			return subjectCode;
		}

		public void setSubjectCode(int subjectCode) {
			this.subjectCode = subjectCode;
		}

		public int getSemester() {
			return semester;
		}

		public void setSemester(int semester) {
			this.semester = semester;
		}

		public Branch getBranch() {
			return branch;
		}

		public void setBranch(Branch branch) {
			this.branch = branch;
		}
}
