package org.kosta.gibuticon.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.fund.FundDAO;
import org.kosta.gibuticon.model.fund.FundPhotoVO;
import org.kosta.gibuticon.model.fund.FundVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FundServiceImpl implements FundService {
	@Resource(name = "uploadPath")
	private String path;

	@Resource(name = "fundDAOImpl")
	FundDAO fundDAO;

	public void writeFund(FundVO fundVO) {
		fundDAO.writeFund(fundVO);
	}

	public FundVO getFundByNo(String no) {
		// 조회수 증가
		fundDAO.updateHit(no);
		return fundDAO.getFundByNo(no);
	}

	@Override
	public FundVO getFundByNoNotHit(String no) {
		// TODO Auto-generated method stub
		return fundDAO.getFundByNo(no);
	}

	public List<FundVO> getFundList(String pageNo) {
		return fundDAO.getFundList(pageNo);
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
	public String getPageNo(String no) {
		return fundDAO.getPageNo(no);
	}

	@Override
	public int getTotalPostingCount() {
		// TODO Auto-generated method stub
		return fundDAO.getTotalPostingCount();
	}

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

}
