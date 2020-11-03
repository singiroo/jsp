package kr.or.ddit.board.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.board.model.BoardVO;
import kr.or.ddit.board.repository.BoardRepositoryI;

//빈 등록
// <bean id="boardService" />
@Service("boardService")
public class BoardService implements BoardServiceI {
	
	//빈 주입
	//boardRepository 참조 변수에 boardRepository 빈을 주입.
	@Resource(name = "boardRepository")
	private BoardRepositoryI boardRepository;
	
	public BoardService() {
	}
	
	public BoardService(BoardRepositoryI boardRepository) {
		this.boardRepository = boardRepository;
	}
	

	public BoardRepositoryI getBoardRepository() {
		return boardRepository;
	}

	public void setBoardRepository(BoardRepositoryI boardRepository) {
		this.boardRepository = boardRepository;
	}

	@Override
	public BoardVO getBoard(int boardNo) {
		return boardRepository.getBoard(boardNo);
	}
	
	
}
