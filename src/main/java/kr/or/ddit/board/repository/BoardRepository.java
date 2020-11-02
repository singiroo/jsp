package kr.or.ddit.board.repository;

import org.springframework.stereotype.Repository;

import kr.or.ddit.board.model.BoardVO;


@Repository("boardRepository")
public class BoardRepository implements BoardRepositoryI {
	
	public BoardVO getBoard(int boardNo) {
		//db에서 조회를 해야하나, 지금은 설정이 갖춰지지 않았으므로
		//가짜 객체(Mock)을 반환
		if(boardNo == 1) {
			return new BoardVO(1, "첫번째 글", "내용");
		}
		else {
			return null;			
		}
			
	}
	
	

}
