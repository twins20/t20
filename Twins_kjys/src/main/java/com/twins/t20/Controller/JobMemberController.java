package com.twins.t20.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.twins.t20.Domain.JobBoardCommentVo;
import com.twins.t20.Domain.JobBoardVo;
import com.twins.t20.Domain.JobMemberVo;
import com.twins.t20.Service.JobMemberDaoFather;
import com.twins.t20.Service.JobMemberDaoSon;

@Controller
@RequestMapping(value="/twins")
public class JobMemberController {
	
	@Autowired
	private JobMemberDaoSon jmds;
	
	@Autowired
	 JavaMailSender mailSender;
	
	@RequestMapping(value="/jmMainController")
	public String JobMemberMain(
			JobMemberVo jmv,
			JobBoardVo jbv,              //
			JobBoardCommentVo jbcv,	     //
			String msg,
			Model model
		   ){
		
		model.addAttribute("jmv", jmv);
		model.addAttribute("msg", msg);
		model.addAttribute("jbv", jbv);      //
		model.addAttribute("jbcv", jbcv);    //
		
		return "TwinsMain";	
	}
	
	
	@RequestMapping(value="/jmLoginController")
	public String JobMemberLogin(
			String msg,
			Model model
		   ){
		
		model.addAttribute("msg", msg);
		
		return "/Member/TwinsJobMemberLoginCheck";
	}
	
	
	@RequestMapping(value="/jmLoginCheckController")
	public String JobMemberLoginCheck(
			JobMemberVo jmv, 
			RedirectAttributes rttr
		   ){
		
		HashMap<String,Object> map = new  HashMap<String,Object>();
		map.put("jmid", jmv.getJmid());
		map.put("jmpsword", jmv.getJmpsword());
		
		jmv = jmds.loginJobMember(map); 
		
		if(jmv == null) {
			String msg = "로그인에 실패하였습니다. 다시 로그인하여 주십시요.";
			rttr.addAttribute("msg", msg);
			return "redirect:/twins/jmLoginController";
		}
		
		String jmid = jmv.getJmid();
		int jmidx= jmv.getJmidx();
		String jmname = jmv.getJmname();
		
		rttr.addAttribute("jmid", jmid);
		rttr.addAttribute("jmidx", jmidx);
		rttr.addAttribute("jmname", jmname);

		return "redirect:/twins/jmMainController";
	}
	
	
	@RequestMapping(value="/jmLoginOutController")
	public String JobMemberLoginOut(HttpSession session,Model model){
		
		jmds.loginout(session);
		System.out.println("로그아웃"+session);
		return "redirect:/twins/jmLoginController";
	}
	
	
	@RequestMapping(value="/jmJoinController")
	public String JobMemberJoin(
			String msg, 
			Model model
		   ){
		
		model.addAttribute("msg", msg);		
		return "/Member/TwinsJobMemberJoin";
	}
	
	
	@RequestMapping(value="/jmJoinActionController")
	public String JobMemberJoinAction(
			JobMemberVo jmv,
			RedirectAttributes rttr
		   ){
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");		
		String date = sdf.format(dt);		
		date = date.substring(2);		
				
		jmv.setJmregdate(date);
	
		int rd = jmds.insertJobMember(jmv);

//		int rd = 0;  // 테스트 용

		String msg;
		
		if (rd == 0) {
			msg = "회원가입에 실패하였습니다. 다시한번 시도해 주십시요.";
			rttr.addAttribute("msg", msg);
			
			return "redirect:/twins/jmJoinController";
		} else {
			msg = "회원가입을 축하드립니다. Twins에 오신것을 환영합니다. 로그인 해주십시요.";
			rttr.addAttribute("msg", msg);
			
			return "redirect:/twins/jmLoginController";
		}		
	}
	
		
//	@RequestMapping(value="/jmConfimController")
//	public String JobMemberConfirm(
////			@RequestParam("jmid")String jmid,
////			Model model
//		   ){
//		
//		return "/Member/TwinsMemberConfirm";
//	}
	
	
	@RequestMapping(value="/jmConfirmIDController")
	public String JobMemberConfirmID(
//			@ModelAttribute("jmid")String jmid,
			String jmid,
			Model model
		   ) {
		
		String url = "";
		
		System.out.println("아이디 = " + jmid);	
		int rd = jmds.confirmJobMemberID(jmid);
		
		System.out.println("rd = " + rd);
		model.addAttribute("rd", rd);	
		
		url = "/Member/TwinsJobMemberConfirm";
		
//		if(rd != 0){
//			url = "/Member/TwinsJobMemberJoin";
//		}else{
//			url = "/Member/TwinsJobMemberConfirm";
//		}
		
		return url;
	}
	
	
	@RequestMapping(value="/jmDropController")
	public String JobMemberDrop(
			JobMemberVo jmv,
			Model model,
			RedirectAttributes rttr
		   ){
		
//		System.out.println("jmDropContoller의 jmv.jmidx = " + jmv.getJmidx());
//		System.out.println("jmDropContoller의 jmv.jmid = " + jmv.getJmid());
//		System.out.println("jmDropContoller의 jmv.jmname = " + jmv.getJmname());
		
		HashMap<String,Object> map = new  HashMap<String,Object>();
		
		map.put("jmidx", jmv.getJmidx());
		map.put("jmid", jmv.getJmid());
		
		int rd = jmds.deleteJobMember(map);
		
		System.out.println("jmDropContoller의 rd = " + rd);

//		rd = 0; // 테스트 용    // or jmid = 'admin'
		
		if (rd == 1) {
			
			model.addAttribute("jmv", jmv);				
			
			return "/Member/TwinsJobMemberDrop";
		} else {		
			String msg = "회원탈퇴 처리에 실패 하였습니다. 다시한번 시도해 주십시요.";
			
			rttr.addAttribute("jmidx", jmv.getJmidx());
			rttr.addAttribute("jmid", jmv.getJmid());
			rttr.addAttribute("jmname", jmv.getJmname());
			rttr.addAttribute("msg",  msg);
			
			return "redirect:/twins/jmMainController";
		}
	}
	
	
	@RequestMapping(value="/jmChangePswordController")
	public String JobMemberChangePsword(
			Integer jmidx,
			String msg,
			Model model
		   ){
		
		JobMemberVo jmv = jmds.selectJobMember(jmidx);
		
//		System.out.println("비밀번호 : " + jmv.getJmpsword());
		
		model.addAttribute("jmv", jmv);
		model.addAttribute("msg", msg);
		
		return "/Member/TwinsJobMemberChangePsword";
	}
	
	
	@RequestMapping(value="/jmChangePswordActionController")
	public String JobMemberChangePswordAction(
			JobMemberVo jmv,
			RedirectAttributes rttr
		   ){
		
		HashMap<String,Object> map = new  HashMap<String,Object>();
		
		map.put("jmpsword", jmv.getJmpsword());
		map.put("jmidx",jmv.getJmidx());
		
//		System.out.println("새 비밀번호 : " + jmv.getJmpsword());
		
		int rd = jmds.changePsword(map);
		
//		rd = 0;  // 테스트 용
		
		if (rd == 1) {
			String msg = "비밀번호 변경에 성공하였습니다.";
			
			rttr.addAttribute("jmidx", jmv.getJmidx());
			rttr.addAttribute("jmid", jmv.getJmid());
			rttr.addAttribute("jmname", jmv.getJmname());
			rttr.addAttribute("msg", msg);
			
			return "redirect:/twins/jmMainController";
		} else {
			String msg = "비밀번호 변경에 실패하였습니다. 다시한번 시도해 주십시요.";
			int jmidx = jmv.getJmidx();
			
			rttr.addAttribute("jmidx", jmidx);
			rttr.addAttribute("msg", msg);
			
			return "redirect:/twins/jmChangePswordController";
		}	
	}
	
	
	@RequestMapping(value="/jmModifyController")
	public String JobMemberModify(
			JobMemberVo jmv,
			String msg,
			Model model
		   ){
	
		jmv = jmds.selectJobMember(jmv.getJmidx());
	
		model.addAttribute("jmv", jmv);
		model.addAttribute("msg", msg);   // 어떻게 처리할지 고민 중
	
		return "/Member/TwinsJobMemberModify";
	}
	
	
	@RequestMapping(value="/jmModifyActionController")
	public String JobMemberModifyAction(
			JobMemberVo jmv,
			RedirectAttributes rttr
		   ) throws Exception {
		
		HashMap<String,Object> map = new  HashMap<String,Object>();
	
		map.put("jmemail", jmv.getJmemail());
		map.put("jmaddr", jmv.getJmaddr());
		map.put("jmidx", jmv.getJmidx());
		
		int rd = jmds.modifyJobMember(map);
		
		String msg = "";
		
		if (rd == 1) {
//			msg = "내 정보 수정에 성공하였습니다."; 	// iframe을 이용하여 
										        // alert처리 요망			
		} else {
//			msg = "내 정보 수정에 실패하였습니다. 다시 시도하여 주십시요.";  						        
									// iframe을 이용하여 alert처리 요망			
		}
		
		System.out.println("\njmModifyActionController의 rd = " + rd);
		
		rttr.addAttribute("jmidx", jmv.getJmidx());
		rttr.addAttribute("msg", msg);
		
		return "redirect:/twins/jmModifyController";
		// forward 방식은 공유 메모리에 저장된 내용을 그대로 전달함
		// ********** 비번 노출을 심각히 고려 해야 됨 **********
	}
	
	
	@RequestMapping(value="/jmIDController")
	public String JobMemberFindID(){
		
		return "/Member/TwinsJobMemberGetID";		
	}
	
	
	@RequestMapping(value="/jmGetIDController")
	public String JobMemberGetID(
			JobMemberVo jmv,
			RedirectAttributes rttr
		   ){
		
		HashMap<String,Object> map = new  HashMap<String,Object>();
		
		map.put("jmname", jmv.getJmname());
		map.put("jmemail", jmv.getJmemail());
		
//		System.out.println(jmv.getJmname());
//		System.out.println(jmv.getJmemail());
		
		String id = jmds.getIDJobMember(map);
// 		바로 윗 부분. 이메일과 이름을 입력하여 아이디를 뽑아로는 쿼리가 실제로 되는지 실험해야 됨
		
//		id = "ok"; // 임시로 설정	

		if (id != null) {
			
			// 여기에 이메일 전송 프로세스가 있어야 함
			String msg = "아이디는 " + id + " 입니다.";			
			rttr.addAttribute("msg",  msg);
			
			return "redirect:/twins/jmLoginController?";	
		} else {		
			String msg = "Twins 회원이 아닙니다. 회원가입을 해주십시요.";
			rttr.addAttribute("msg",  msg);
			return "redirect:/twins/jmLoginController";	
		}	
	}
	
	
	@RequestMapping(value="/jmPswordController")
	public String JobMemberFindPsword(){
		
		return "/Member/TwinsJobMemberGetPsword";
	}
	
	
	@RequestMapping(value="/jmGetPswordController")
	public String JobMemberGetPsword(
			JobMemberVo jmv,
			RedirectAttributes rttr
		   ){
		
		HashMap<String,Object> map = new  HashMap<String,Object>();
		map.put("jmid", jmv.getJmid());
		map.put("jmemail",jmv.getJmemail());
		
		String ps = jmds.getPswordJobMember(map);
		// 바로 윗 부분. 이메일과 이름을 입력하여 패스워드를 뽑아로는 쿼리가 실제로 되는지 실험해야 됨
		
//		ps = "ok"; // 임시로 설정	
		
		if (ps != null) {
			
			// 여기에 이메일 전송 프로세스가 있어야 함
			String msg = "패스워드는 " + ps + " 입니다.";			
			rttr.addAttribute("msg",  msg);
			
			return "redirect:/twins/jmLoginController?";	
		} else {		
			String msg = "Twins 회원이 아닙니다. 회원가입을 해주십시요.";
			rttr.addAttribute("msg",  msg);
			return "redirect:/twins/jmLoginController";	
		}
	}
	
	
	@RequestMapping(value="/jmBlankPageController")
	public String JobMemberBlankPage(){
		
		return "/Member/TwinsJobMemberBlankPage";
	}
	
	
	@RequestMapping(value="/jmAgreementController")
	public String JobMemberAgreement(){
		
		return "/Member/TwinsJobMemberJoinAgreement";
	}
	
	
//	@RequestMapping(value="/jmMailController")
//	public String JobMemberMailSending(
//			JobMemberVo jmv,
//			Model model,
//			HttpServletResponse response){
//		
//		String email = jmv.getJmemail();
//		String content = jmv.getJmpsword();
//		
//		System.out.println("이메일"+email);
//		System.out.println("비번"+content);
//		 try {
//			MimeMessage message = mailSender.createMimeMessage();
//			MimeMessageHelper messageHelper  = new MimeMessageHelper(message, true, "UTF-8");
//			
//			messageHelper.setFrom("twinstw20@gmail.com");
//			messageHelper.setTo(email);
//			messageHelper.setText(content);
//			
//			mailSender.send(message);
//			
//		 } catch (MessagingException e) {
//		
//			e.printStackTrace();
//		} 
//		return "redirect:/twins/jmLoginController";	
//	}
}
