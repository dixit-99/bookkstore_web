package com.bookstore.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.bookstore.dao.UserDAO;
import com.bookstore.vo.Book;
import com.bookstore.vo.Order;
import com.bookstore.vo.User;
import com.bookstore.vo.Wishlist;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@Controller
public class BookController {
	
		@Autowired
		private BookDAO bookDAO;
		
		@Autowired
		private UserDAO userDAO;
		
		@RequestMapping(value = "/home", method = RequestMethod.GET)
		private ModelAndView home(HttpSession session) {
			if(session.getAttribute("user") != null) {
				if(!(session.getAttribute("filter") != null) && !(session.getAttribute("sort") != null) && !(session.getAttribute("search") != null))
					session.setAttribute("bookList", bookDAO.getBooks(session.getAttribute("user")));
				session.removeAttribute("filter");
				session.removeAttribute("sort");
				session.removeAttribute("search");
				return new ModelAndView("home");
			}
			session.setAttribute("required",true);
			return new ModelAndView("redirect:/");
		}
		
		@RequestMapping(value = "/applyFilter", method = RequestMethod.GET)
		private ResponseEntity<Object> applyFilter(@RequestParam int subjectId, HttpSession session) {
			session.setAttribute("filter", true);
			session.setAttribute("bookList", bookDAO.applyFilter(subjectId));
			return new ResponseEntity<Object>(null,HttpStatus.OK);
		}
		
		@RequestMapping(value = "/search", method = RequestMethod.GET)
		private ResponseEntity<Object> search(@RequestParam String bookName, HttpSession session) {
			session.setAttribute("search", true);
			session.setAttribute("bookList", bookDAO.search(bookName,session.getAttribute("user")));
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
		private ModelAndView addBook(HttpSession session) {
			if(session.getAttribute("user") != null) {
				return new ModelAndView("addBook","book",new Book());
			}
			session.setAttribute("required",true);
			return new ModelAndView("redirect:/");
		}
		
		@RequestMapping(value = "/editBook", method = RequestMethod.GET)
		private ModelAndView editBook(@RequestParam long bookId, HttpSession session) {
			if(session.getAttribute("user") != null) {
				Book book = (Book)bookDAO.getBook(bookId).get(0);
				session.setAttribute("edit", true);
				return new ModelAndView("addBook","book",book);
			}
			session.setAttribute("required",true);
			return new ModelAndView("redirect:/");
		}
		
		@RequestMapping(value = "/deleteBook", method = RequestMethod.GET)
		private ResponseEntity<Object> deleteBook(@RequestParam long bookId,@ModelAttribute Book book , HttpSession session) {
			book.setBookId(bookId);
			bookDAO.deleteBook(book);
			List sellingList = userDAO.getSellingList(Long.parseLong(session.getAttribute("user").toString()));
			return new ResponseEntity<Object>(null,HttpStatus.OK);
		}
		
		@RequestMapping(value = "/soldBook", method = RequestMethod.GET)
		private ResponseEntity<Object> soldBook(@RequestParam long bookId,@ModelAttribute Book book , HttpSession session) {
			book = (Book)bookDAO.getBook(bookId).get(0);
			book.setStatus(false);
			bookDAO.addBook(book);
			List sellingList = userDAO.getSellingList(Long.parseLong(session.getAttribute("user").toString()));
			return new ResponseEntity<Object>(null,HttpStatus.OK);
		}
		
		@RequestMapping(value = "/sellBook", method = RequestMethod.GET)
		private ResponseEntity<Object> sellBook(@RequestParam long bookId,@ModelAttribute Book book , HttpSession session) {
			book = (Book)bookDAO.getBook(bookId).get(0);
			book.setStatus(true);
			bookDAO.addBook(book);
			List sellingList = userDAO.getSellingList(Long.parseLong(session.getAttribute("user").toString()));
			return new ResponseEntity<Object>(null,HttpStatus.OK);
		}
		
		@RequestMapping(value = "/orderBook", method = RequestMethod.GET)
		private ResponseEntity<Object> orderBook(@RequestParam long bookId,@ModelAttribute Book book, @ModelAttribute User user, @ModelAttribute Order order, HttpSession session) {
			book.setBookId(bookId);
			user.setUserId(Long.parseLong(session.getAttribute("user").toString()));
			order.setBook(book);
			order.setUser(user);
			bookDAO.orderBook(order);
			return new ResponseEntity<Object>(null,HttpStatus.OK);
		}
		
		@RequestMapping(value = "/deleteOrder", method = RequestMethod.GET)
		private ResponseEntity<Object> deleteOrder(@RequestParam long orderId ,@ModelAttribute Order order) {
			order.setOrderId(orderId);
			bookDAO.deleteOrder(order);
			return new ResponseEntity<Object>(null,HttpStatus.OK);
		}
		
		@RequestMapping(value = "/getSubject", method = RequestMethod.GET)
		private ResponseEntity<Object> getSubject(@RequestParam String branch, @RequestParam String sem) {
			List ls = bookDAO.getSubject(branch,sem);
			return new ResponseEntity<Object>(ls,HttpStatus.OK);
		}
		
		@RequestMapping(value = "/addWish", method = RequestMethod.GET)
		private ResponseEntity<Object> addWish(@RequestParam long userId, @RequestParam long bookId,@ModelAttribute Book book, @ModelAttribute User user, @ModelAttribute Wishlist wishlist) {
			user.setUserId(userId);
			book.setBookId(bookId);
			wishlist.setUser(user);
			wishlist.setBook(book);
			bookDAO.addWish(wishlist);
			return new ResponseEntity<Object>(null,HttpStatus.OK);
		}
		
		@RequestMapping(value = "/rmWish", method = RequestMethod.GET)
		private ResponseEntity<Object> rmWish(@RequestParam long userId, @RequestParam long bookId,@ModelAttribute Book book, @ModelAttribute User user, @ModelAttribute Wishlist wishlist) {
			user.setUserId(userId);
			book.setBookId(bookId);
			wishlist.setUser(user);
			wishlist.setBook(book);
			bookDAO.rmWish(wishlist);
			return new ResponseEntity<Object>(null,HttpStatus.OK);
		}
		
		@RequestMapping(value = "/bookDetails", method = RequestMethod.GET)
		private ModelAndView bookDetails(@RequestParam long bookId, HttpSession session) {			
			if(session.getAttribute("user") != null) {
				Book book = (Book)bookDAO.bookDetails(bookId).get(0);
				return new ModelAndView("bookDetails","book",book);
			}
			session.setAttribute("required",true);
			return new ModelAndView("redirect:/");
		}
		
		@RequestMapping(value = "/bookkDetails", method = RequestMethod.GET)
		private ModelAndView bookkDetails(@RequestParam long bookId,HttpSession session) {
			if(session.getAttribute("user") != null) {
				Book book = (Book)bookDAO.bookDetails(bookId).get(0);
				session.setAttribute("noBuy", true);
				return new ModelAndView("bookDetails","book",book);
			}
			session.setAttribute("required",true);
			return new ModelAndView("redirect:/");
		}
		
		@RequestMapping(value = "/incrementViews", method = RequestMethod.GET)
		private ResponseEntity<Object> incrementViews(@RequestParam long bookId,@ModelAttribute Book book) {
			book = (Book)bookDAO.getBook(bookId).get(0);
			int views = book.getViews();
			views++;
			book.setViews(views);
			bookDAO.addBook(book);
			return new ResponseEntity<Object>(null,HttpStatus.OK);
		}
		
		@RequestMapping(value = "/addBookk", method = RequestMethod.POST)
		private ModelAndView addBookk(@ModelAttribute Book book, @RequestParam MultipartFile front,@RequestParam MultipartFile back, HttpServletRequest req, HttpSession session) {
			
			if(session.getAttribute("user") != null) {
				try {
					Map config = new HashMap();
					config.put("cloud_name", "bookshare123");
					config.put("api_key", "826311686619931");
					config.put("api_secret", "HiON8Lb6uoU5mb4gYZTYGFTNjdo");
					Cloudinary cloudinary = new Cloudinary(config);
					
					Map uploadResultFront = cloudinary.uploader().upload(front.getBytes(), ObjectUtils.emptyMap());
					Map uploadResultBack = cloudinary.uploader().upload(back.getBytes(), ObjectUtils.emptyMap());
					
					String imgurlFront = (String) uploadResultFront.get("url");
					System.out.println(imgurlFront);
					
					String imgurlBack = (String) uploadResultBack.get("url");
					System.out.println(imgurlBack);
					
					book.setFrontImage(imgurlFront);
					book.setBackImage(imgurlBack);

					
					int originalPrice = book.getOriginalPrice();
					int sellingPrice = book.getSellingPrice();
					int discount =  ( (originalPrice - sellingPrice) * 100 ) / originalPrice;
					book.setDiscount(discount);
					
					bookDAO.addBook(book);
					return new ModelAndView("sell");
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}
			session.setAttribute("required",true);
			return new ModelAndView("redirect:/");
		}
}
