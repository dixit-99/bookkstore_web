package com.bookstore.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bookstore.dao.BookDAO;
import com.bookstore.vo.Book;
import com.bookstore.vo.Users;
import com.bookstore.vo.Wishlist;

@Controller
public class BookController {
	
		@Autowired
		private BookDAO bookDAO;
		
		@RequestMapping(value = "/home", method = RequestMethod.GET)
		private ModelAndView home(HttpSession session) {
			if(!(session.getAttribute("filter") != null) && !(session.getAttribute("sort") != null))
				session.setAttribute("bookList", bookDAO.getBooks(session.getAttribute("user")));
			session.removeAttribute("filter");
			session.removeAttribute("sort");
			return new ModelAndView("home");
		}
		
		@RequestMapping(value = "/applyFilter", method = RequestMethod.GET)
		private ResponseEntity<Object> applyFilter(@RequestParam int subjectId, HttpSession session) {
			session.setAttribute("filter", true);
			session.setAttribute("bookList", bookDAO.applyFilter(subjectId));
			return new ResponseEntity<Object>(null,HttpStatus.OK);
		}

		@RequestMapping(value = "/bookCondition", method = RequestMethod.GET)
		private ResponseEntity<Object> bookCondition(@RequestParam int subjectId,@RequestParam String bookCondition, HttpSession session) {
			session.setAttribute("filter", true);
			session.setAttribute("bookList", bookDAO.bookCondition(subjectId,bookCondition));
			return new ResponseEntity<Object>(null,HttpStatus.OK);
		}
		
		@RequestMapping(value = "/sortBooks", method = RequestMethod.GET)
		private ResponseEntity<Object> sortBooks(@RequestParam int option, HttpSession session) {
			session.setAttribute("sort", true);
			List<Book> bookList = (List<Book>) session.getAttribute("bookList");
			
			Comparator<Book> compareByBookId = new Comparator<Book>() {
			    @Override
			    public int compare(Book o1, Book o2) {
			        return o1.getBookId().compareTo(o2.getBookId());
			    }
			};
			
			Comparator<Book> compareBySeen = new Comparator<Book>() {
			    @Override
			    public int compare(Book o1, Book o2) {
			        return o1.getViews().compareTo(o2.getViews());
			    }
			};
			
			Comparator<Book> compareBySellingPrice = new Comparator<Book>() {
			    @Override
			    public int compare(Book o1, Book o2) {
			        return o1.getSellingPrice().compareTo(o2.getSellingPrice());
			    }
			};

			Comparator<Book> compareByDiscount = new Comparator<Book>() {
			    @Override
			    public int compare(Book o1, Book o2) {
			        return o1.getDiscount().compareTo(o2.getDiscount());
			    }
			};
			
			switch (option) {
				case 1:
					Collections.sort(bookList,compareByBookId.reversed());
				break;
				case 2:
					Collections.sort(bookList,compareByBookId);
				break;
				case 3:
					Collections.sort(bookList,compareBySeen.reversed());
				break;
				case 4:
					Collections.sort(bookList,compareBySellingPrice);
				break;
				case 5:
					Collections.sort(bookList,compareBySellingPrice.reversed());
				break;
				case 6:
					Collections.sort(bookList,compareByDiscount);
				break;
				case 7:
					Collections.sort(bookList,compareByDiscount.reversed());
				break;
			}
			
			return new ResponseEntity<Object>(null,HttpStatus.OK);
		}
		
		@RequestMapping(value = "/addBook", method = RequestMethod.GET)
		private ModelAndView addBook() {
			return new ModelAndView("addBook","book",new Book());
		}
		
		@RequestMapping(value = "/getSubject", method = RequestMethod.GET)
		private ResponseEntity<Object> getSubject(@RequestParam String branch, @RequestParam String sem) {
			List ls = bookDAO.getSubject(branch,sem);
			return new ResponseEntity<Object>(ls,HttpStatus.OK);
		}
		
		@RequestMapping(value = "/addWish", method = RequestMethod.GET)
		private ResponseEntity<Object> addWish(@RequestParam long userId, @RequestParam long bookId,@ModelAttribute Book book, @ModelAttribute Users user, @ModelAttribute Wishlist wishlist) {
			user.setUserId(userId);
			book.setBookId(bookId);
			wishlist.setUser(user);
			wishlist.setBook(book);
			bookDAO.addWish(wishlist);
			return new ResponseEntity<Object>(null,HttpStatus.OK);
		}
		
		@RequestMapping(value = "/rmWish", method = RequestMethod.GET)
		private ResponseEntity<Object> rmWish(@RequestParam long userId, @RequestParam long bookId,@ModelAttribute Book book, @ModelAttribute Users user, @ModelAttribute Wishlist wishlist) {
			user.setUserId(userId);
			book.setBookId(bookId);
			wishlist.setUser(user);
			wishlist.setBook(book);
			bookDAO.rmWish(wishlist);
			return new ResponseEntity<Object>(null,HttpStatus.OK);
		}
		
		@RequestMapping(value = "/bookDetails", method = RequestMethod.GET)
		private ModelAndView bookDetails(@RequestParam long bookId) {
			Book book = (Book)bookDAO.bookDetails(bookId).get(0);
			return new ModelAndView("bookDetails","book",book);
		}
		
		@RequestMapping(value = "/addBookk", method = RequestMethod.POST)
		private ModelAndView addBookk(@ModelAttribute Book book, @RequestParam MultipartFile front,@RequestParam MultipartFile back, HttpServletRequest req) {
			String frontName = front.getOriginalFilename();
			String backName = back.getOriginalFilename();
			String filePath = req.getSession().getServletContext().getRealPath("/");
			filePath += "documents\\file\\";
			book.setFrontImage(frontName);
			book.setBackImage(backName);
			
			int originalPrice = book.getOriginalPrice();
			int sellingPrice = book.getSellingPrice();
			int discount =  ( (originalPrice - sellingPrice) * 100 ) / originalPrice;
			book.setDiscount(discount);
			
			try {
				byte f[] = front.getBytes();
				byte b[] = back.getBytes();
				BufferedOutputStream frontImage = new BufferedOutputStream(new FileOutputStream(filePath+"\\"+frontName));
				BufferedOutputStream backImage = new BufferedOutputStream(new FileOutputStream(filePath+"\\"+backName));
				frontImage.write(f);
				backImage.write(b);
		        frontImage.close();
		        backImage.close();
		        
		        bookDAO.addBook(book);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return new ModelAndView("sell");
		}
}
