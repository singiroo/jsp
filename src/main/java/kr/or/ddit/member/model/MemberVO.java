package kr.or.ddit.member.model;

public class MemberVO {
	private String userId;
	private String userNm;
	private String pass;
	private String alias;
	private String reg_dt;
	
	
	
	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String password) {
		this.pass = password;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((alias == null) ? 0 : alias.hashCode());
		result = prime * result + ((pass == null) ? 0 : pass.hashCode());
		result = prime * result + ((reg_dt == null) ? 0 : reg_dt.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result + ((userNm == null) ? 0 : userNm.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberVO other = (MemberVO) obj;
		if (alias == null) {
			if (other.alias != null)
				return false;
		} else if (!alias.equals(other.alias))
			return false;
		if (pass == null) {
			if (other.pass != null)
				return false;
		} else if (!pass.equals(other.pass))
			return false;
		if (reg_dt == null) {
			if (other.reg_dt != null)
				return false;
		} else if (!reg_dt.equals(other.reg_dt))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		if (userNm == null) {
			if (other.userNm != null)
				return false;
		} else if (!userNm.equals(other.userNm))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userNm=" + userNm + ", pass=" + pass + ", alias=" + alias + ", reg_dt="
				+ reg_dt + "]";
	}
	
}
