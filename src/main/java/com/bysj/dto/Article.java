package com.bysj.dto;

public class Article {

		private Integer uid;
		
		private String titlename;
		
		private String type;
		
		private String content;
		
		private String doctorname;
		
		

		public String getDoctorname() {
			return doctorname;
		}

		public void setDoctorname(String doctorname) {
			this.doctorname = doctorname;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public Integer getUid() {
			return uid;
		}

		public void setUid(Integer uid) {
			this.uid = uid;
		}

		public String getTitlename() {
			return titlename;
		}

		public void setTitlename(String titlename) {
			this.titlename = titlename;
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}
		
		
}
