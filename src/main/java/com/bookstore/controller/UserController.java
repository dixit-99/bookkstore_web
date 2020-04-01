package com.bookstore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookstore.dao.UserDAO;
import com.bookstore.vo.User;

@Controller
public class UserController {

		@Autowired
		private UserDAO userDAO;
		
		@RequestMapping(value = "/addUser", method = RequestMethod.POST)
		private ModelAndView index(@ModelAttribute User user, HttpSession session) {
			userDAO.addUser(user);
			user = (User)userDAO.login(user.getEmail(),user.getPassword()).get(0);
			long userId = user.getUserId();
			session.setAttribute("user", userId);
			return new ModelAndView("home");
		}
		
		@RequestMapping(value = "/editUser", method = RequestMethod.GET)
		private ModelAndView editUser(@RequestParam long userId) {
			User user = (User)userDAO.getUser(userId).get(0);
			return new ModelAndView("signup","user",user);
		}
		
		@RequestMapping(value = "/verify", method = RequestMethod.GET)
		private ResponseEntity<Object> verify(@RequestParam String email, @RequestParam String password,HttpSession session) {
			List ls = userDAO.login(email,password);
			if(ls.size() > 0) {
				User user = (User)ls.get(0);
				long userId = user.getUserId();
				session.setAttribute("user", userId);
				return new ResponseEntity<Object>("true",HttpStatus.OK);
			}
			else
				return new ResponseEntity<Object>("false",HttpStatus.OK);
		}
		
		@RequestMapping(value = "/wish", method = RequestMethod.GET)
		private ModelAndView wish(HttpSession session) {
			List wishlist = userDAO.getWishlist(Long.parseLong(session.getAttribute("user").toString()));
			return new ModelAndView("wish","wishlist",wishlist);
		}
		
		@RequestMapping(value = "/order", method = RequestMethod.GET)
		private ModelAndView order() {
			return new ModelAndView("order");
		}
		
		@RequestMapping(value = "/sell", method = RequestMethod.GET)
		private ModelAndView sell(HttpSession session) {
			List sellingList = userDAO.getSellingList(Long.parseLong(session.getAttribute("user").toString()));
			return new ModelAndView("sell","sellingList",sellingList);
		}
		
		@RequestMapping(value = "/profile", method = RequestMethod.GET)
		private ModelAndView profile(HttpSession session) {
			long userId = Long.parseLong(session.getAttribute("user").toString());
			User user = (User)userDAO.getUser(userId).get(0);
			return new ModelAndView("profile","user",user);
		}
}
