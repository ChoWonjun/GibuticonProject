package org.kosta.gibuticon.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.fund.FundDAO;
import org.kosta.gibuticon.model.fund.FundPhotoVO;
import org.kosta.gibuticon.model.fund.FundVO;
import org.kosta.gibuticon.model.fund.SearchOptionVO;
import org.kosta.gibuticon.model.fund.comment.FundCommentVO;
import org.kosta.gibuticon.model.history.ChargeHistoryVO;
import org.kosta.gibuticon.model.history.GibuHistoryVO;
import org.kosta.gibuticon.model.history.HistoryDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
public class FundServiceImpl implements FundService {
	@Resource(name = "uploadPath")
	private String path;
	@Resource(name = "fundDAOImpl")
	FundDAO fundDAO;
	@Resource(name = "historyDAOImpl")
	HistoryDAO historyDAO;

	public void writeFund(FundVO fundVO) {
		fundDAO.writeFund(fundVO);
	}

	public FundVO getFundByNo(String no) {
		// 조회수 증가
		fundDAO.updateHit(no);
		FundVO vo = fundDAO.getFundByNo(no);
		vo.setPhotoList(fundDAO.getPhotoByNo(no));
		return vo;
	}

	@Override
	public FundVO getFundByNoNotHit(String no) {
		FundVO vo = fundDAO.getFundByNo(no);
		vo.setPhotoList(fundDAO.getPhotoByNo(no));
		return vo;
	}

	public List<FundVO> getFundList(SearchOptionVO svo) {
		List <FundPhotoVO> photoList = new ArrayList<FundPhotoVO>();
		List <FundVO> list = fundDAO.getFundList(svo);
		for(int i=0;i<list.size();i++){
			FundVO vo = list.get(i);
			photoList = fundDAO.getPhotoByNo(list.get(i).getFundNo());
			vo.setPhotoList(photoList);
		}
		return list;
	}

	public void updateFund(FundVO fundVO) {
		fundDAO.updateFund(fundVO);
	}

	public void deleteFundByNo(String no) {
		fundDAO.deleteFundByNo(no);
	}

	public void increaseParticipant(String no) {
		fundDAO.increaseParticipant(no);
	}

	public void gibuMoney(FundVO fundVO) {
		fundDAO.gibuMoney(fundVO);
	}

	@Override
	public String getPageNo(SearchOptionVO svo) {
		return fundDAO.getPageNo(svo);
	}

	@Override
	public int getTotalPostingCount(SearchOptionVO svo) {
		return fundDAO.getTotalPostingCount(svo);
	}

	@Override
	public void writeComment(FundCommentVO fundCommentVO) {
		fundDAO.writeComment(fundCommentVO);
	}

	@Override
	public List<FundCommentVO> getCommentList(String fundNo, String commentPage) {
		return fundDAO.getCommentList(fundNo, commentPage);
	}

	@Override
	public int getTotalCommentCount(String fundNo) {
		return fundDAO.getTotalCommentCount(fundNo);
	}

	@Override
	public List<ChargeHistoryVO> getChargeHistory(String memberId) {
		return historyDAO.getChargeHistory(memberId);
	}

	@Override
	public List<GibuHistoryVO> getGibuHistory(String memberId) {
		return historyDAO.getGibuHistory(memberId);
	}

	@Override
	public int getTotalGibuParticipants(String year) {
		return fundDAO.getTotalGibuParticipants(year);
	}

	@Override
	public int getTotalGibuAmount(String year) {
		return fundDAO.getTotalGibuAmount(year);
	}

	@Override
	public int getTotalGibuParticipants() {
		return fundDAO.getTotalGibuParticipants();
	}

	@Override
	public int getTotalGibuAmount() {
		return fundDAO.getTotalGibuAmount();
	}

	@Override
	public void uploadPhoto(FundVO vo) {
		List<MultipartFile> list = vo.getFile();
		ArrayList<String> nameList = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			String fundNo = vo.getFundNo();
			String orgName = list.get(i).getOriginalFilename();
			String realName = fundNo + "_" + System.currentTimeMillis() + "_"
					+ orgName;
			FundPhotoVO fpvo = new FundPhotoVO(orgName, realName, fundNo);
			if (!orgName.equals("")) {
				try {
					fundDAO.savePhoto(fpvo);
					list.get(i).transferTo(new File(path + realName));
					nameList.add(orgName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println("fileupload ok:" + nameList);
	}

	@Override
	public void deleteComment(String commentNo) {
		fundDAO.deleteComment(commentNo);
	}

}
