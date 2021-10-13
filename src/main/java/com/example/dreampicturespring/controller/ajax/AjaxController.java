package com.example.dreampicturespring.controller.ajax;

import com.example.dreampicturespring.constant.Path;
import com.example.dreampicturespring.entity.Membership;
import com.example.dreampicturespring.entity.Paintingtbl;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.PaintingRepository;
import com.example.dreampicturespring.vo.LoginVO;
import com.example.dreampicturespring.vo.PaintingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AjaxController {

	@Autowired
	MembershiptblRepository membershiptblRepository;
//	@Autowired
//	PaintingRepository paintingRepository;

	@RequestMapping(value="/ajax_email_check",method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String email_check(String email) { return membershiptblRepository.existsByemail(email) ? "N" : "Y"; }

	@RequestMapping(value="/ajax_tel_check",method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String tel_check(String tel) { return membershiptblRepository.existsBytel(tel) ? "N" : "Y"; }

	@RequestMapping(value = "/ajax_nickname_check",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	@ResponseBody
	public String nickname_check(String nickname){return membershiptblRepository.existsBynickname(nickname) ? "N" : "Y"; }

//	@RequestMapping(value = "/ajax_style_check",method = RequestMethod.GET, produces = "application/text;charset=UTF-8")
//	@ResponseBody
//	public String style_check(PaintingVO paintingVO){
//
//		List<Paintingtbl> paintingtblList = paintingRepository.findbypname(paintingVO.getPname());
//		return "a";
//
//	}
}