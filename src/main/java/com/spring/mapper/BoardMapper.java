package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

public interface BoardMapper {

	public List<BoardVO> getListWithPaging(Criteria cri);

	public boolean insertboard(BoardVO vo);

	public BoardVO read(int bno);

	public int updateboard(BoardVO vo);

	public int delete(BoardVO vo);

	public int getCount(Criteria cri);

	public int readCountupdate(int bno);

	// 댓글 갯수를 변경하기
	public int updateReplyCnt(@Param("amount") int amount, @Param("bno") int bno);

}
