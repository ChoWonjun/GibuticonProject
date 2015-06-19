package org.kosta.gibuticon.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.kosta.gibuticon.model.fund.FundVO;
import org.kosta.gibuticon.model.fund.ListVO;
import org.kosta.gibuticon.model.fund.PagingBean;
import org.kosta.gibuticon.model.fund.comment.CommentListVO;
import org.kosta.gibuticon.model.fund.comment.CommentPageVO;
import org.kosta.gibuticon.model.fund.comment.CommentPagingBean;
import org.kosta.gibuticon.model.fund.comment.FundCommentVO;
import org.kosta.gibuticon.model.history.ChargeHistoryVO;
import org.kosta.gibuticon.model.history.GibuHistoryVO;
import org.kosta.gibuticon.model.service.FundService;
import org.kosta.gibuticon.model.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	@RequestMapping("fund/getList.gibu")
	public ModelAndView getList(String pageNo, String no) {

		if (no != null)
			pageNo = "" + fundService.getPageNo(no);
		if (pageNo == null)
			pageNo = "1";

		List<FundVO> list = fundService.getFundList(pageNo);
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

	@RequestMapping("fund/writeForm.gibu")
	public ModelAndView fundWriteForm(@ModelAttribute FundVO fundVO) {
		return new ModelAndView("fund_write");
	}

	@RequestMapping("fund/updateForm.gibu")
	public ModelAndView updateForm(String no) {
		return new ModelAndView("fund_update", "posting",
				fundService.getFundByNoNotHit(no));
	}

	@Transactional
	@RequestMapping(value = "fund/write.gibu", method = RequestMethod.POST)
	public ModelAndView write(@Valid FundVO vo,  BindingResult result) {
		if (result.hasErrors()) {
			return new ModelAndView("fund_write");
			// 유효성 검사에 에러가 있으면 가입폼으로 다시 보낸다.
		}
		fundService.writeFund(vo);
		fundService.uploadPhoto(vo);
		return new ModelAndView("redirect:showContentNotHit.gibu", "no",
				vo.getFundNo());
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
