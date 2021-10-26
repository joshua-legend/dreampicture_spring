package com.example.dreampicturespring.controller.ajax;

import com.example.dreampicturespring.entity.*;
import com.example.dreampicturespring.repository.*;
import com.example.dreampicturespring.vo.CardVO;
import com.example.dreampicturespring.vo.CommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
public class AjaxController {

	@Autowired
	AdminRepository adminRepository;
	@Autowired
	CartRepository cartRepository;
	@Autowired
	CartpaintingRepository cartpaintingRepository;
	@Autowired
	CommentRepository commentRepository;
	@Autowired
	MembershiptblRepository membershiptblRepository;
	@Autowired
	NoticeRepository noticeRepository;
	@Autowired
	PaintingRepository paintingRepository;
	@Autowired
	PaymentRepository paymentRepository;
	@Autowired
	ReportRepository reportRepository;
	@Autowired
	QaRepository qaRepository;

	@RequestMapping(value="/ajax_email_check",method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String email_check(String email) { return membershiptblRepository.existsByemail(email) ? "N" : "Y"; }

	@RequestMapping(value="/ajax_tel_check",method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String tel_check(String tel) { return membershiptblRepository.existsBytel(tel) ? "N" : "Y"; }

	@RequestMapping(value = "/ajax_nickname_check",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	@ResponseBody
	public String nickname_check(String nickname){return membershiptblRepository.existsBynickname(nickname) ? "N" : "Y"; }


	@RequestMapping(value = "/ajax_picture_finder",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	public String picture_find(Model model, String pname, String style, String theme, Integer width, Integer height, Integer price){
		List<Paintingtbl> paintingtbls;
		if(pname.equals("all")){ paintingtbls = paintingRepository.findAll(); }
		else{ paintingtbls = paintingRepository.findPainting(makeNotNull(pname),makeNotNull(style),makeNotNull(theme),width,height,price); }
		List<Membershiptbl> membershiptbls = new ArrayList<>();
		List<CardVO> cardVOList = new ArrayList<>();
		for(int i=0;i<paintingtbls.size();i++){ membershiptbls.add(membershiptblRepository.getById(paintingtbls.get(i).getNo_membership())); }
		for(int i=0;i<paintingtbls.size();i++){ CardVO vo = new CardVO(paintingtbls.get(i),membershiptbls.get(i));cardVOList.add(vo);}
		model.addAttribute("cardVOlist",cardVOList);
/*
		ModelAndView mv = new ModelAndView();
		List<CommentVO> commentVOList = new ArrayList<>();
		List<String> list = paintingRepository.findAllPainting_Desc();
		for(String card : list){
			List<String> obj = Arrays.asList(card.split(","));
			CardVO cardVO = new CardVO();
			cardVO.setNo_painting(obj.get(0));
			cardVO.setAvatarimg(obj.get(1)+"/avatarimg/avatarimg.jpg");
			cardVO.setPaintingmimg(obj.get(4));
			cardVO.setNickname(obj.get(2));
			cardVO.setPname(obj.get(3));
			cardVO.setCommentNumber(commentRepository.countByno_painting(Integer.parseInt(obj.get(0))));

			List<String> comments = commentRepository.findCommenttbl(Integer.parseInt(obj.get(0)));
			List<CommentVO> commentVOlist = new ArrayList<>();
			for(String comment : comments){
				List<String> comment_member = Arrays.asList(comment.split(","));
				CommentVO commentVO = new CommentVO();
				Integer no_comment = commentRepository.findByNo_comment(Integer.parseInt(comment_member.get(1)),Integer.parseInt(obj.get(0)));
				Membershiptbl membershiptbl = membershiptblRepository.getById(Integer.parseInt(comment_member.get(1)));
				commentVO.setNo_comment(no_comment);
				commentVO.setAvatarimg(membershiptbl.getImg());
				commentVO.setAuthor(membershiptbl.getNickname());
				commentVO.setDate("1H");
				commentVO.setComments(comment_member.get(0));
				commentVO.setNo_membership(membershiptbl.getNo_membership());
				commentVOlist.add(commentVO);
			}
			cardVO.setCommentVOList(commentVOlist);
			cardVOList.add(cardVO);
		}
		mv.setViewName("user/buy/buy");
		mv.addObject("cardVOlist",cardVOList);


*/


		return "user/ajax/picture_find";
	}

	@RequestMapping(value = "/ajax_picture_finder_soldout",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	public String picture_find_soldout(Model model,String deadline){
		System.out.println("============="+deadline+"==========================");
		List<Paintingtbl> paintingtbls = paintingRepository.findPainting_soldout_deadline(deadline);
		List<Membershiptbl> membershiptbls = new ArrayList<>();
		List<CardVO> cardVOList = new ArrayList<>();
		for(int i=0;i<paintingtbls.size();i++){ membershiptbls.add(membershiptblRepository.getById(paintingtbls.get(i).getNo_membership())); }
		for(int i=0;i<paintingtbls.size();i++){ CardVO vo = new CardVO(paintingtbls.get(i),membershiptbls.get(i));cardVOList.add(vo);}
		System.out.println(cardVOList);
		model.addAttribute("cardVOlist",cardVOList);
		return "user/ajax/picture_finder_soldout";
	}



	@RequestMapping(value = "/ajax_pay",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	@ResponseBody
	public String pay(Model model,Integer point,Integer buyer,Integer seller,Integer paint){
		Optional<Membershiptbl> MTBL_buyer = membershiptblRepository.findById(buyer);
		Membershiptbl buyerTBL =MTBL_buyer.get();
		buyerTBL.dreampayCal(point,false);
		membershiptblRepository.save(buyerTBL);

		Optional<Membershiptbl> MTBL_seller = membershiptblRepository.findById(seller);
		Membershiptbl sellerTBL =MTBL_seller.get();
		sellerTBL.dreampayCal(point,true);
		membershiptblRepository.save(sellerTBL);

		Optional<Paintingtbl> PTBL = paintingRepository.findById(paint);
		Paintingtbl paintingtbl = PTBL.get();
		paintingtbl.setStatus(1);
		paintingRepository.save(paintingtbl);

		Paymenttbl paymenttbl = new Paymenttbl();
		paymenttbl.setPaymentprice(point);
		paymenttbl.setNo_membership(buyer);
		paymenttbl.setNo_painting(paint);
		paymentRepository.save(paymenttbl);

		return "success";
	}

	@RequestMapping(value = "/ajax_answer_QA",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	public String answer_QA(HttpServletRequest request, Integer no_qa, String answer){
		Optional<Qatbl> qatblOptional = qaRepository.findById(no_qa);
		Qatbl qatbl =qatblOptional.get();
		qatbl.setAnswer(answer);
		qaRepository.save(qatbl);
		return "redirect:/notice";
	}

	@RequestMapping(value = "/ajax_delete_QA",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	@ResponseBody
	public String delete_QA(HttpServletRequest request,Integer num){
		qaRepository.deleteById(num);
		return "success";
	}

	@RequestMapping(value = "/ajax_request_QA",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	public String request_Qa(Model model,HttpServletRequest request, String question, Integer status){
		HttpSession session = request.getSession();
		Membershiptbl membershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
		if(membershipTBL == null){ return "user/redirect/not_login"; }
		Qatbl qatbl = new Qatbl(membershipTBL, question, status);
		qaRepository.save(qatbl);
		return "redirect:/notice";
	}

	@RequestMapping(value = "/ajax_push_notice",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	@ResponseBody
	public String push_notice(HttpServletRequest request,String title,String question){
		HttpSession session = request.getSession();
		Noticetbl noticetbl = new Noticetbl();
		noticetbl.setTitle(title);
		noticetbl.setContent(question);
		System.out.println(adminRepository.findByadminID_no((String) session.getAttribute("adminLogin")));
		noticetbl.setNo_admin(adminRepository.findByadminID_no((String) session.getAttribute("adminLogin")));
		noticeRepository.save(noticetbl);
		return "redirect:/admin/notice";
	}

	@RequestMapping(value = "/ajax_delete_notice",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	@ResponseBody
	public String delete_notice(HttpServletRequest request,Integer num){
		noticeRepository.deleteById(num);
		return "success";
	}

	@RequestMapping(value = "/ajax_push_changeInfo",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	@ResponseBody
	public String push_changeInfo(HttpServletRequest request,String addr,String addrDetail,String tel){
		HttpSession session = request.getSession();
		Membershiptbl membershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
		membershipTBL.setAddr(addr);
		membershipTBL.setDetailAddr(addrDetail);
		membershipTBL.setTel(tel);
		System.out.println(membershipTBL);
		membershiptblRepository.save(membershipTBL);
		return "redirect:/mypage";
	}

    @RequestMapping(value = "/ajax_report", method = RequestMethod.GET, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String report(HttpServletRequest request, Integer reportNum, Integer no_painting) {
        HttpSession session = request.getSession();
        Membershiptbl membershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
        if (membershipTBL == null) {
            return "not_login";
        }
        List<Integer> list = reportRepository.isOverlap(no_painting);
        if (list.contains(membershipTBL.getNo_membership())) {
            return "overlap";
        }
        Reporttbl reporttbl = new Reporttbl();
        reporttbl.setNo_painting(no_painting);
        reporttbl.setNo_membership(membershipTBL.getNo_membership());
        reporttbl.parser(reportNum);
        reportRepository.save(reporttbl);
        return "user/buy/buy";
    }


    @RequestMapping(value = "/ajax_cart_add", method = RequestMethod.GET, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String cart_add(HttpServletRequest request, Integer no_painting) {
        HttpSession session = request.getSession();
        Membershiptbl membershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
        if (membershipTBL == null) {
            return "not_login";
        }
        Carttbl carttbls = cartRepository.findByno_membership(membershipTBL.getNo_membership());
        List<Cartpaintingtbl> cartpaintingtblList = cartpaintingRepository.findByno_cart(carttbls.getNo_cart());
        for (Cartpaintingtbl cartpaintingtbl : cartpaintingtblList) {
            if (cartpaintingtbl.getNo_painting() == no_painting) return "has_already";
        }
        Cartpaintingtbl cartpaintingtbl = new Cartpaintingtbl();
        cartpaintingtbl.setNo_cart(carttbls.getNo_cart());
        cartpaintingtbl.setNo_painting(no_painting);
        cartpaintingRepository.save(cartpaintingtbl);
        return "success";
    }


    @RequestMapping(value = "/ajax_comment_finder", method = RequestMethod.GET, produces = "application/text;charset=UTF-8")
    public String comment_finder(Model model, Integer no_painting) {
        List<String> comments = commentRepository.findCommenttbl(no_painting);
        List<CommentVO> commentVOlist = new ArrayList<>();
        for (String comment : comments) {
            List<String> obj = Arrays.asList(comment.split(","));
            Membershiptbl membershiptb = membershiptblRepository.getById(Integer.parseInt(obj.get(1)));
            CommentVO commentVO = new CommentVO();
            commentVO.setAvatarimg(membershiptb.getImg());
            commentVO.setAuthor(membershiptb.getNickname());
            commentVO.setDate("1H");
            commentVO.setComments(obj.get(0));
            commentVOlist.add(commentVO);
        }
        model.addAttribute("commentVOlist", commentVOlist);
        return "user/ajax/comment_find";
    }

    @RequestMapping(value = "/ajax_comment_add", method = RequestMethod.GET, produces = "application/text;charset=UTF-8")
    public String comment_add(Model model, HttpServletRequest request, String comment, Integer no_painting) {
        System.out.println(comment + no_painting + "ㅁㅁㅁㅁ");
        HttpSession session = request.getSession();

        Membershiptbl membershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
        System.out.println(comment + no_painting);
        if (membershipTBL == null) {
            return "user/redirect/not_login";
        }

        System.out.println("=======3333=====" + comment + "=============");
        Commentstbl commentstbl = new Commentstbl();
        commentstbl.setNo_membership(membershipTBL.getNo_membership());
        System.out.println("=====2222=======" + comment + "=============");
        commentstbl.setComments(comment);
        commentstbl.setNo_painting(no_painting);
        commentRepository.save(commentstbl);
        System.out.println("============" + comment + "=============");

        return "redirect:/buy";
    }

    private String makeNotNull(String target) {
        if (StringUtils.isEmpty(target)) return target = null;
        return target;
    }
}