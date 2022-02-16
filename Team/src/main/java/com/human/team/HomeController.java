package com.human.team;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.human.team.iTeam;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private SqlSession sqlSession;
	private ServletRequest session;
	
	@RequestMapping("/index")
	public String Index(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String type1="";
		String userid="";
		
		if(session.getAttribute("userid")==null) {
			userid="null";
		} else {
			userid=(String) session.getAttribute("userid");
		}
		if(session.getAttribute("type")==null){
			type1="2";
		} else {
			type1=(String) session.getAttribute("type");
		}
		int type=Integer.parseInt(type1);
		model.addAttribute("type",type);
		model.addAttribute("userid",userid);
		
		/* return "home"; */
		return "index";
	}
	
	@RequestMapping("/map")
	public String Map() {
		return "Map";
	}
	
	@RequestMapping("/home") 
	public String home(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String type1="";
		String userid="";
		
		if(session.getAttribute("userid")==null) {
			userid="null";
		} else {
			userid=(String) session.getAttribute("userid");
		}
		if(session.getAttribute("type")==null){
			type1="2";
		} else {
			type1=(String) session.getAttribute("type");
		}
		int type=Integer.parseInt(type1);
		model.addAttribute("type",type);
		model.addAttribute("userid",userid);
		
		return "home";
	}
	
	@RequestMapping("/login")
	public String Login() {
		return "login";
	}
	@RequestMapping("/register")
	public String Register() {
		return "register";
	}
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.GET, produces="application/json;charset=utf-8") 
	public String idCheck(HttpServletRequest hsr) {
			iTeam team=sqlSession.getMapper(iTeam.class); 
			ArrayList<Member> mem=team.getMemberList();
			JSONArray ja=new JSONArray();
		      for(int i=0; i<mem.size(); i++) {
		         JSONObject jo=new JSONObject();
		         jo.put("userid",mem.get(i).getUserid());
		         ja.add(jo);
		      }
		      return ja.toString();
	}
	@RequestMapping(value="/signCheck", method=RequestMethod.POST, produces="application/jason;charset=utf-8")
	public String signCheck(HttpServletRequest hsr) {
		try {
			String name=hsr.getParameter("name");
		   	String gender=hsr.getParameter("gender");
			String userid=hsr.getParameter("userid");
			String passcode=hsr.getParameter("passcode");
			String mobile=hsr.getParameter("mobile");
			String type=hsr.getParameter("type");
				
			iTeam team=sqlSession.getMapper(iTeam.class); 
			team.signCheck(name,gender,userid,passcode,mobile,type);

			return "login";
		} catch(Exception e) {
			System.out.println(e.getMessage());
			return "register";
		}
	}
	@RequestMapping("/viewquit")
	public String Viewquit() {
		return "quit";
	}
	@ResponseBody
    @RequestMapping(value="/quit", method= RequestMethod.POST, produces="application/json; charset=utf-8")
    public String Quit(HttpServletRequest hsr) {
    	String retval="";
    	try {
		       iTeam member=sqlSession.getMapper(iTeam.class);
		       ArrayList<Member> ml=member.getMemberList();
		       System.out.println(ml.size());
		       JSONArray ja=new JSONArray();
		       for(int i=0; i<ml.size(); i++) {
		          JSONObject jo = new JSONObject();
		          jo.put("id",ml.get(i).getUserid());
		          jo.put("pw",ml.get(i).getPasscode());
		          jo.put("name",ml.get(i).getName());
		          jo.put("mobile",ml.get(i).getMobile());
		          ja.add(jo);
		       }
		       System.out.println(ja);
		       
		       retval= ja.toString();
    	} catch(Exception e) {
            retval="fail";
        }
        return retval;
    }
	@ResponseBody
	@RequestMapping(value="/quitMember", method= RequestMethod.POST, produces="application/json; charset=utf-8")
	public String Quitmember(HttpServletRequest hsr, HttpServletRequest request) {
		String retval="";
	       try {
	    	   String userid=hsr.getParameter("id");
	    	   iTeam member=sqlSession.getMapper(iTeam.class);
	    	   member.quitMember(userid);
	    	   
	    	   HttpSession session = request.getSession(true);
		       session.invalidate();
	    	   retval="ok";
	          
	       } catch(Exception e) {
	    	   retval="fail";
	       }
	       return retval;
	}
	
	
	 @ResponseBody
     @RequestMapping(value="/type_check",method= RequestMethod.POST,
                    produces="application/json; charset=utf-8")
     public String type_check(HttpServletRequest hsr) {
        iTeam member=sqlSession.getMapper(iTeam.class);
        ArrayList<Member> ml=member.getTypeList();
        
        JSONArray ja=new JSONArray();
        for(int i=0; i<ml.size(); i++) {
           JSONObject jo = new JSONObject();
           jo.put("id",ml.get(i).getUserid());
           jo.put("type",ml.get(i).getType());
           ja.add(jo);
        }
        return ja.toString();
     }
    @ResponseBody
    @RequestMapping(value="/login_check", method= RequestMethod.POST,
          produces="application/json; charset=utf-8")
    public String login_check(HttpServletRequest hsr) {
       
       iTeam member=sqlSession.getMapper(iTeam.class);
       ArrayList<Member> ml=member.getMemberList();
       System.out.println(ml.size());
       JSONArray ja=new JSONArray();
       for(int i=0; i<ml.size(); i++) {
          JSONObject jo = new JSONObject();
          jo.put("id",ml.get(i).getUserid());
          jo.put("pw",ml.get(i).getPasscode());
          ja.add(jo);
       }
       return ja.toString();
    }
    @ResponseBody
    @RequestMapping(value="/login_update", method= RequestMethod.POST,
                produces="application/json; charset=utf-8")
    public String login_update(HttpServletRequest hsr, HttpServletRequest request) {
       String retval="";
       try {
       String userid=hsr.getParameter("id");
       iTeam member=sqlSession.getMapper(iTeam.class);
       member.UpdateMember(userid);
          retval="ok";
          
          HttpSession session = request.getSession(true);
          session.setAttribute("userid",hsr.getParameter("id"));
          session.setAttribute("type",hsr.getParameter("type")); 
       } catch(Exception e) {
          retval="fail";
       }
       
       return retval;
    }
  //-----------------------로그아웃
    @RequestMapping(value="/logout_update", method= RequestMethod.GET)
    public String logout_update(HttpServletRequest hsr, HttpServletRequest request) {
       HttpSession session = request.getSession(true);
       String userid = (String) session.getAttribute("userid");
       iTeam member=sqlSession.getMapper(iTeam.class);
       member.logoutMember(userid);
       session.invalidate();
       return "redirect:/home";
    }
    
	
	@ResponseBody
	@RequestMapping(value="/posit1", produces="application/json;charset=utf-8")
	public String doPosit1(HttpServletRequest hsr) { 
		int typecode=Integer.parseInt(hsr.getParameter("typecode"));
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		iTeam team=sqlSession.getMapper(iTeam.class);
		ArrayList<Reserve> reserve=team.getReserve(typecode,howmany);
		System.out.println(reserve.size());
		JSONArray ja= new JSONArray();
		for(int i=0; i<reserve.size(); i++) { 
			JSONObject jo=new JSONObject();
			jo.put("aname",reserve.get(i).getAname());
			jo.put("bname",reserve.get(i).getBname());
			jo.put("howmany",reserve.get(i).getHowmany());
			jo.put("howmuch",reserve.get(i).getHowmuch());
			ja.add(jo);
		}
	return ja.toString(); 
	}
	
	@RequestMapping("/Roomtype") 
	public String doRoomtype(Model m) { 
		iTeam team = sqlSession.getMapper(iTeam.class); 
		ArrayList<Roomtype> alType = team.getRoomtype(); 
		m.addAttribute("alType",alType); 
		return "admincheck";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/typelist", produces="application/json;charset=UTF-8")
	public String gettypeList() {
		iTeam co=sqlSession.getMapper(iTeam.class);
		ArrayList<Roomtype> types = co.getroomType();
	      
		JSONArray ja=new JSONArray();
		for(int i=0; i<types.size(); i++) {
			JSONObject jo=new JSONObject();
			jo.put("typecode",types.get(i).getTypecode());
			jo.put("typename",types.get(i).getName());
			ja.add(jo);
		}
		return ja.toString();
	}
	@ResponseBody
	@RequestMapping(value="/roomlist", produces="application/json;charset=UTF-8")
	public String getroomList() {
		iTeam co=sqlSession.getMapper(iTeam.class);
		ArrayList<RoomList> types = co.getroomList();
	      
		JSONArray ja=new JSONArray();
		for(int i=0; i<types.size(); i++) {
			JSONObject jo=new JSONObject();
			jo.put("roomcode",types.get(i).getCode());
			jo.put("roomname",types.get(i).getR_name());
			jo.put("roomtype",types.get(i).getT_name());
			jo.put("howmany",types.get(i).getHowmany());
			jo.put("howmuch",types.get(i).getHowmuch());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/typeAdd", produces="application/text;charset=UTF-8")
	public String typeAdd(HttpServletRequest hsr) {
		String typecode=hsr.getParameter("typecode");
		String typename=hsr.getParameter("typename");
	      
		iTeam co=sqlSession.getMapper(iTeam.class);
	      
		if(typecode.equals("") || typecode==null) { //insert
			co.typeAdd(typename);
		} else { //update
			int code=Integer.parseInt(typecode);
			co.typeupdate(code,typename);
		}
		return "ok";
	}
	@ResponseBody
	@RequestMapping(value="/RoomAdd", produces="application/text;charset=UTF-8")
	public String roomAdd(HttpServletRequest hsr) {
		String roomcode=hsr.getParameter("roomcode");
		String roomname=hsr.getParameter("roomname");
		int roomtype=Integer.parseInt(hsr.getParameter("roomtype"));
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
	      
		iTeam co=sqlSession.getMapper(iTeam.class);
	      
		if(roomcode.equals("") || roomcode==null) { //insert
			co.RoomAdd(roomname,roomtype,howmany,howmuch);
		} else { //update
			int code=Integer.parseInt(roomcode);
			co.Roomupdate(code,roomname,roomtype,howmany,howmuch);
		}
		return "ok";
	}
	
	@RequestMapping("/insertBook")
	  public String doinsertBook(HttpServletRequest hsr) { 
	     HttpSession session = hsr.getSession(true);
	     iTeam team = sqlSession.getMapper(iTeam.class);
	     int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
	     String date3=hsr.getParameter("date3");
	     String date4=hsr.getParameter("date4");
	     int howmany=Integer.parseInt(hsr.getParameter("howmany"));
	     String guest=hsr.getParameter("guest");
	     String mobile=hsr.getParameter("mobile1");
//	     String member_id=hsr.getParameter("userid");
	     int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
	     String member_id=(String)session.getAttribute("userid");
	     team.insertBook(roomcode,date3,date4,howmany,guest,mobile,howmuch,member_id);
	     
	     return "redirect:/admin";
	  }
	@ResponseBody
	@RequestMapping(value="/typeDelete", produces="application/text;charset=UTF-8")
	public String typeDelete(HttpServletRequest hsr) {
		int typecode=Integer.parseInt(hsr.getParameter("typecode"));
	      
		iTeam co=sqlSession.getMapper(iTeam.class);
		co.typeDelete(typecode);
	      
		return "ok";
	}
	@ResponseBody
	@RequestMapping(value="/RoomDelete", produces="application/text;charset=UTF-8")
	public String roomDelete(HttpServletRequest hsr) {
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
	      
		iTeam co=sqlSession.getMapper(iTeam.class);
		co.roomDelete(roomcode);
	      
		return "ok";
	}
	
	//-------------------공지사항
//    @RequestMapping("/notice")
//    public String notice(Model model, HttpServletRequest request) { 
//       iTeam notice=sqlSession.getMapper(iTeam.class);
//       ArrayList<Notice> alNotice=notice.getPaging();
//       HttpSession session = request.getSession(true);
//       String type1="";
//       String userid="";
//       if(session.getAttribute("userid")==null) {
//          userid="null";
//       } else {
//          userid=(String) session.getAttribute("userid");
//       }
//       if(session.getAttribute("type")==null){
//          type1="2";
//       } else {
//          type1=(String) session.getAttribute("type");
//       }
//       int type=Integer.parseInt(type1);
//       
//       model.addAttribute("type",type);
//       model.addAttribute("userid",userid);
//       model.addAttribute("alNotice",alNotice);
//       
//       return "notice";
//    }
//	@RequestMapping(value="/serchpage")
//	public String serchpage(Model model, HttpServletRequest request) {
//		HttpSession session = request.getSession(true);
//	       String type1="";
//	       String userid="";
//	       if(session.getAttribute("userid")==null) {
//	          userid="null";
//	       } else {
//	          userid=(String) session.getAttribute("userid");
//	       }
//	       if(session.getAttribute("type")==null){
//	          type1="2";
//	       } else {
//	          type1=(String) session.getAttribute("type");
//	       }
//	       int type=Integer.parseInt(type1);
//	       
//	       model.addAttribute("type",type);
//	       model.addAttribute("userid",userid);
//			return "serchpage";
//	}
//    @ResponseBody
//    @RequestMapping(value="/Serch", method=RequestMethod.GET,produces="application/text;charset=UTF-8")
//    
//    public String serch(HttpServletRequest hsr) {
//    	iTeam Notice=sqlSession.getMapper(iTeam.class);
//    	String serch=hsr.getParameter("serch");
//    	System.out.println(serch);
//    	ArrayList<Notice> getSerch = Notice.getSerch(serch); 
//    		System.out.println(getSerch.size());
//    	JSONArray ja=new JSONArray();
//		for(int i=0; i<getSerch.size(); i++) {
//			JSONObject jo=new JSONObject();
//			jo.put("id",getSerch.get(i).getId());
//			jo.put("title",getSerch.get(i).getTitle());   // getter,setter 한 이름을 가져다 씀
//			jo.put("name",getSerch.get(i).getName());
//			jo.put("content",getSerch.get(i).getContent());
//			jo.put("created",getSerch.get(i).getCreated());
//			jo.put("viewCnt",getSerch.get(i).getViewCnt());
//			jo.put("bno",getSerch.get(i).getBno());
//			ja.add(jo);
//		}
//    	return ja.toString();
//    }
	@RequestMapping(value="/notice")
	public String Notice(Model model, HttpServletRequest request) {
		 HttpSession session = request.getSession(true);
       String type1="";
       String userid="";
       if(session.getAttribute("userid")==null) {
          userid="null";
       } else {
          userid=(String) session.getAttribute("userid");
       }
       if(session.getAttribute("type")==null){
          type1="2";
       } else {
          type1=(String) session.getAttribute("type");
       }
       int type=Integer.parseInt(type1);
       
       model.addAttribute("type",type);
       model.addAttribute("userid",userid);
		return "notice";
	}

	@ResponseBody
	@RequestMapping(value="/Notice1",method=RequestMethod.GET,
            produces="application/json;charset=utf-8")
	public String doNotice(Model model, HttpServletRequest request) {
		iTeam ml = sqlSession.getMapper(iTeam.class);// 인터페이스 이름 작성(iEmp)
		ArrayList<Notice> alNotice = ml.getPaging();
		
		JSONArray ja = new JSONArray();
		for(int i=0; i<alNotice.size(); i++) { //ArrayList -> JSON 으로 바꾸는 작업 해야함
			JSONObject jo = new JSONObject();
			jo.put("id",alNotice.get(i).getId());
			jo.put("title",alNotice.get(i).getTitle());   // getter,setter 한 이름을 가져다 씀
			jo.put("name",alNotice.get(i).getName());
			jo.put("content",alNotice.get(i).getContent());
			jo.put("created",alNotice.get(i).getCreated());
			jo.put("viewCnt",alNotice.get(i).getViewCnt());
			jo.put("bno",alNotice.get(i).getBno());
			ja.add(jo);
		}

		return ja.toString();   //  return 시 addMenu 의 ajax -> function(txt) 의 txt라는 변수에 들어간다.
	}
    @RequestMapping("/view")
    public String view(HttpServletRequest hsr, Model model) {
       int id=Integer.parseInt(hsr.getParameter("id"));
       System.out.println(id);
       iTeam notice=sqlSession.getMapper(iTeam.class);
       notice.plusViewCnt(id); 
       Notice view=notice.getView(id); 
       HttpSession session = hsr.getSession(true);
       String type1="";
       String userid="";
       if(session.getAttribute("userid")==null) {
          userid="null";
       } else {
          userid=(String) session.getAttribute("userid");
       }
       if(session.getAttribute("type")==null){
          type1="2";
       } else {
          type1=(String) session.getAttribute("type");
       }
       int type=Integer.parseInt(type1);
       model.addAttribute("type",type);
       model.addAttribute("userid",userid);
       model.addAttribute("notice",view);
       return "view";
    }
    @RequestMapping("/compose") public String compose() {return "write";}
    @RequestMapping(value="/write", method=RequestMethod.GET)
    public String write(HttpServletRequest hsr) {
       String title=hsr.getParameter("title");
       String name=hsr.getParameter("name");
       String content=hsr.getParameter("content");
       
       iTeam notice=sqlSession.getMapper(iTeam.class);
       notice.writeNotice(title,name,content);
       return "redirect:/notice";
    }
    @RequestMapping("/update")
    public String update(HttpServletRequest hsr, Model model) {
       int id=Integer.parseInt(hsr.getParameter("id"));
       
       iTeam team=sqlSession.getMapper(iTeam.class);
       Notice notice=team.getView(id);
       model.addAttribute("notice",notice);
       return "update";
    }
    @RequestMapping("/delete")
       public String delete(HttpServletRequest hsr) {
          int notice_id=Integer.parseInt(hsr.getParameter("id"));
          
          iTeam notice=sqlSession.getMapper(iTeam.class);
          notice.deleteNotice(notice_id);
          return "redirect:/notice";
       }
    @RequestMapping(value="/modify", method=RequestMethod.POST)
    public String Modify(HttpServletRequest hsr) {
       int id=Integer.parseInt(hsr.getParameter("id"));
       String title=hsr.getParameter("title");
       String name=hsr.getParameter("name");
       String content=hsr.getParameter("content");
       
       iTeam notice=sqlSession.getMapper(iTeam.class);
          notice.updateNotice(id,title,name,content);
       return "redirect:/notice";
    }
    @ResponseBody
    @RequestMapping(value="/paging" ,method=RequestMethod.GET, produces="application/text;charset=UTF-8")
    public String getLines(HttpServletRequest hsr, Model model) {
    	iTeam notice=sqlSession.getMapper(iTeam.class);
    	int lines=10;
    	int pageno=Integer.parseInt(hsr.getParameter("pageno"));
//    	System.out.println(pageno);
    	int start=lines*pageno+1;
    	int end=lines*(pageno+1);
//    	System.out.println(start);
//    	System.out.println(end);
    	ArrayList<Notice> pageList = notice.PagingList(start,end);
//    	System.out.println("["+pageList.size()+"]");
		
    	JSONArray ja = new JSONArray();
		for(int i=0; i<pageList.size(); i++) { //ArrayList -> JSON 으로 바꾸는 작업 해야함
			JSONObject jo = new JSONObject();
			
			jo.put("id",pageList.get(i).getId());
			jo.put("title",pageList.get(i).getTitle());   // getter,setter 한 이름을 가져다 씀
			jo.put("name",pageList.get(i).getName());
			jo.put("content",pageList.get(i).getContent());
			jo.put("created",pageList.get(i).getCreated());
			jo.put("viewCnt",pageList.get(i).getViewCnt());
			jo.put("bno",pageList.get(i).getBno());
			ja.add(jo);
	}
//		System.out.println(ja.toString());
		return ja.toString(); 
    }

    @ResponseBody 
    @RequestMapping(value="/pagecheck", method=RequestMethod.GET,produces="application/text;charset=UTF-8")
    public String pagecheck(HttpServletRequest hsr) {
		iTeam Notice=sqlSession.getMapper(iTeam.class);
		int lines=10;
    	int pageno=Integer.parseInt(hsr.getParameter("pageno"));
    	int start=lines*pageno+1;
    	int end=lines*(pageno+1);
    	ArrayList<Notice> pageList = Notice.PagingList(start,end);
    	System.out.println(pageList.size());
		JSONArray ja=new JSONArray();
		for(int i=0; i<pageList.size(); i++) {
			JSONObject jo=new JSONObject();
			jo.put("id",pageList.get(i).getId());
			ja.add(jo);
		}
		return ja.toString();
    }

}