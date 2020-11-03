package kr.or.ddit.person.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import kr.or.ddit.board.repository.BoardRepositoryI;

public class Person {
	
	private int age;
	private BoardRepositoryI boardRepository;
	
	//필드 마다 설정해줘야 하는 번거로움이 있지만
	//필드 마다 패턴을 다르게 설정해 줄 수 있는 장점이 있다.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthdate;
	
	
	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public Person() {
	}
	
	public Person(int age, BoardRepositoryI boardRepository) {
		this.age = age;
		this.boardRepository = boardRepository;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public BoardRepositoryI getBoardRepository() {
		return boardRepository;
	}
	public void setBoardRepository(BoardRepositoryI boardRepository) {
		this.boardRepository = boardRepository;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + age;
		result = prime * result + ((boardRepository == null) ? 0 : boardRepository.hashCode());
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
		Person other = (Person) obj;
		if (age != other.age)
			return false;
		if (boardRepository == null) {
			if (other.boardRepository != null)
				return false;
		} else if (!boardRepository.equals(other.boardRepository))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Person [age=" + age + ", boardRepository=" + boardRepository + ", birthdate=" + birthdate + "]";
	}
	
	
	
	

}
