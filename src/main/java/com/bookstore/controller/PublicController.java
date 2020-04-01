package com.bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bookstore.vo.Users;

@Controller
public class PublicController {

		@RequestMapping(value = "/", method = RequestMethod.GET)
		private ModelAndView index() {
			return new ModelAndView("index");
		}
		
		@RequestMapping(value = "/signup", method = RequestMethod.GET)
		private ModelAndView signup() {
			return new ModelAndView("signup", "user", new Users());
		}
		
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		private ModelAndView login() {
			return new ModelAndView("login");
		}
}
