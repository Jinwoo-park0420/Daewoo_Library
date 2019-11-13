package com.spring.mapper;

import java.util.List;

import com.spring.domain.AttachFileVO;
	
public interface Book_AttachMapper {
	
	public int attach_insert(AttachFileVO vo);
	
	public List<AttachFileVO> getAttachList(int bno);
	
	public int attach_delete(int bno);
	
	public List<AttachFileVO> getYesterDayList();
	
}
