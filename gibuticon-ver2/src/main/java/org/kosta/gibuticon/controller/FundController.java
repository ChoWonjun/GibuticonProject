package org.kosta.gibuticon.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.gibuticon.model.fund.FundVO;
import org.kosta.gibuticon.model.fund.ListVO;
import org.kosta.gibuticon.model.fund.PagingBean;
import org.kosta.gibuticon.model.fund.SearchOptionVO;
import org.kosta.gibuticon.model.fund.comment.CommentListVO;
import org.kosta.gibuticon.model.fund.comment.CommentPageVO;
import org.kosta.gibuticon.model.fund.comment.CommentPagingBean;
import org.kosta.gibuticon.model.fund.comment.FundCommentVO;
import org.kosta.gibuticon.model.history.ChargeHistoryVO;
import org.kosta.gibuticon.model.history.GibuHistoryVO;
import org.kosta.gibuticon.model.service.FundService;
import org.kosta.gibuticon.model.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FundController {

	@Resource
	private FundService fundService;
	@Resource
	private MemberService memberService;
	private Logger log = LoggerFactory.getLogger(getClass());

	@RequestMapping("fund/getList.gibu")
	public ModelAndView getList(String pageNo, String no, SearchOptionVO svo) {
		if (no != null)
			pageNo = "" + fundService.getPageNo(no);
		if (pageNo == null)
			pageNo = "1";
		
		svo.setPageNo(pageNo);
		/*List<FundVO> list = fundService.getFundList(pageNo);*/
		List<FundVO> list = fundService.getSearchFundList(svo);		
		ListVO vo = new ListVO(list, new PagingBean(
				fundService.getTotalPostingCount(), Integer.parseInt(pageNo)));
		return new ModelAndView("fund_list", "vo", vo);
	}

	@RequestMapping("fund/showContent.gibu")
	public ModelAndView showContent(String no, String commentPage,
			HttpServletRequest request, HttpServletResponse response) {
		Cookie cookies[] = request.getCookies();
		String hitcookieVal = "";
		String noStr = "|" + no + "|";

		boolean flag = true;
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("fundhitcookie")) {
					hitcookieVal = cookies[i].getValue();

					if (hitcookieVal.indexOf(noStr) != -1) {
						flag = false;
						break;
					}
				}
			}
		}

		FundVO vo = null;
		if (flag) {
			vo = fundService.getFundByNo(no);
			// 개별 게시물 조회 ( 조회수 증가 )
			Cookie cookie = new Cookie("fundhitcookie", hitcookieVal + noStr);
			// 쿠키 유효시간 설정
			// cookie.setMaxAge(60);// 60초간 쿠키가 유효하다.
			// 응답객체에 쿠키를 저장해 전송한다.
			response.addCookie(cookie);
		} else
			vo = fundService.getFundByNoNotHit(no);

		if (commentPage == null)
			commentPage = "1";

		List<FundCommentVO> list = fundService
				.getCommentList(new CommentPageVO(no, commentPage));
		CommentListVO listVO = new CommentListVO(list, new CommentPagingBean(
				fundService.getTotalCommentCount(no),
				Integer.parseInt(commentPage)));

		System.out.println(vo.getPhotoList());

		ModelAndView mv = new ModelAndView("fund_show_content");
		mv.addObject("posting", vo);
		mv.addObject("comment", listVO);
		System.out.println(listVO);

		return mv;
	}

	@RequestMapping("fund/showContentNotHit.gibu")
	public ModelAndView showContentNoHit(String no) {
		FundVO vo = fundService.getFundByNoNotHit(no);
		return new ModelAndView("fund_show_content", "posting", vo);
	}

	@RequestMapping(value="fund/writeForm.gibu",method=RequestMethod.GET)
	public ModelAndView fundWriteForm(HttpServletRequest request) {
		return new ModelAndView("fund_write");
	}

	@RequestMapping("fund/currentState.gibu")
	public ModelAndView currentState() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("fund_fund_state");
		mv.addObject("totalParticipants",
				fundService.getTotalGibuParticipants());
		mv.addObject("totalAmount", fundService.getTotalGibuAmount());
		return mv;
	}

	@RequestMapping("fund/currentStateYear.gibu")
	@ResponseBody
	public HashMap<String, Object> currentStateYear(String year) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("totalParticipants", fundService.getTotalGibuParticipants(year));
		map.put("totalAmount", fundService.getTotalGibuAmount(year));
		return map;
	}

	@RequestMapping("fund/updateForm.gibu")
	public ModelAndView updateForm(String no) {
		return new ModelAndView("fund_update", "posting",
				fundService.getFundByNoNotHit(no));
	}

	@RequestMapping(value = "fund/write.gibu", method = RequestMethod.POST)
	public ModelAndView write(FundVO fundVO, HttpServletRequest request) {
		System.out.println(fundVO.getContent());
		fundService.writeFund(fundVO);
		fundService.uploadPhoto(fundVO);
		return new ModelAndView("redirect:showContentNotHit.gibu", "no",
				fundVO.getFundNo());
	}

	@RequestMapping("fund/update.gibu")
	public ModelAndView updateFund(FundVO vo) {
		fundService.updateFund(vo);
		return new ModelAndView("redirect:showContentNotHit.gibu", "no",
				vo.getFundNo());
	}

	@RequestMapping("fund/delete.gibu")
	public ModelAndView delete(String no) {
		fundService.deleteFundByNo(no);
		return new ModelAndView("redirect:getList.gibu");
	}

	@RequestMapping("fund/writeComment.gibu")
	public ModelAndView writeComment(FundCommentVO fundCommentVO,
			String memberId) {
		fundCommentVO.setMemberVO(memberService.findMemberById(memberId));
		fundService.writeComment(fundCommentVO);
		return new ModelAndView("fund/writeComment_result");
	}

	@RequestMapping("history/getChargeHistory.gibu")
	@ResponseBody
	public List<ChargeHistoryVO> getChargeHistory(String memberId) {
		List<ChargeHistoryVO> list = fundService.getChargeHistory(memberId);
		System.out.println(list);
		return list;
	}

	@RequestMapping("history/getGibuHistory.gibu")
	@ResponseBody
	public List<GibuHistoryVO> getGibuHistory(String memberId) {
		List<GibuHistoryVO> list = fundService.getGibuHistory(memberId);
		System.out.println(list);
		return list;
	}
}
