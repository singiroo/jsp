package kr.or.ddit.person.model;

import kr.or.ddit.board.repository.BoardRepositoryI;

public class Person {
	
	private int age;
	private BoardRepositoryI boardRepository;
	
	
	
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
	
	

}
