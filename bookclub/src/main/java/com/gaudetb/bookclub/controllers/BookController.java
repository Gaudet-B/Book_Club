package com.gaudetb.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gaudetb.bookclub.models.Book;
import com.gaudetb.bookclub.models.User;
import com.gaudetb.bookclub.services.BookService;
import com.gaudetb.bookclub.services.UserService;


@RequestMapping("/bookclub")
@Controller
public class BookController {
	
	@Autowired
	BookService bookService;
	
	@Autowired
	UserService userService;
	
	// ============> DISPLAY ROUTES <============
	
	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session) {
		
		if (session.getAttribute("uuid") == null) return "redirect:/bookclub";
		
		model.addAttribute("allBooks", bookService.findAll());
		model.addAttribute("loggedInUser", userService.findOne((Long) session.getAttribute("uuid")));
		
		return "dashboard.jsp";
	}
	
	@GetMapping("/books/new")
	public String newBook(@ModelAttribute("newBook") Book book, HttpSession session) {
		
		if (session.getAttribute("uuid") == null) return "redirect:/bookclub";
		
		return "create.jsp";
	}
	
	@GetMapping("/books/{id}")
	public String viewBook(@PathVariable("id") Long id, Model model, HttpSession session) {
		
		if (session.getAttribute("uuid") == null) return "redirect:/bookclub";
		
		model.addAttribute("loggedInUser", userService.findOne((Long) session.getAttribute("uuid")));
		model.addAttribute("book", bookService.findOne(id));
		
		return "view.jsp";
	}
	
	@GetMapping("/books/{id}/edit")
	public String editBook(@PathVariable("id") Long id, Model model, HttpSession session) {
		
		if (session.getAttribute("uuid") == null) return "redirect:/bookclub";
		
		Book book = bookService.findOne(id);
		
		if (!session.getAttribute("uuid").equals(book.getUser().getId())) return "redirect:/bookclub/dashboard";
		
		model.addAttribute("loggedInUser", userService.findOne((Long) session.getAttribute("uuid")));
		model.addAttribute("book", book);
		
		return "edit.jsp";
	}
	
	// ============> ACTION ROUTES <============
	
	@PostMapping("/books/create")
	public String createBook(@Valid @ModelAttribute("newBook") Book book, BindingResult result, HttpSession session) {
		
		if (session.getAttribute("uuid") == null) return "redirect:/bookclub";
		
		if (result.hasErrors()) return "create.jsp";
		
		User user = userService.findOne((Long) session.getAttribute("uuid"));
		book.setUser(user);
		
		bookService.save(book);
		
		return "redirect:/bookclub/dashboard";
//		return "redirect:/bookclub/books/new";
	}
	
	@PutMapping("/books/{id}/update")
	public String updateBook(@Valid @ModelAttribute("book") Book bookFromForm, BindingResult result, HttpSession session, @PathVariable("id") Long id, Model model) {
		
		if (session.getAttribute("uuid") == null) return "redirect:/bookclub";
		
		Book bookFromDB = bookService.findOne(id);
		if (result.hasErrors()) {
			model.addAttribute("loggedInUser", userService.findOne((Long) session.getAttribute("uuid")));
//			model.addAttribute("book", bookFromDB);
			return "edit.jsp";
		} else {
			if (!session.getAttribute("uuid").equals(bookFromDB.getUser().getId())) return "redirect:/bookclub/dashboard";
			// safe update:
			bookFromDB.setTitle(bookFromForm.getTitle());
			bookFromDB.setAuthor(bookFromForm.getAuthor());
			bookFromDB.setMyThoughts(bookFromForm.getMyThoughts());
			bookService.save(bookFromDB);
		}
		
		return"redirect:/bookclub/dashboard";
	}
	
	@DeleteMapping("/books/{id}/delete")
	public String deleteBook(@PathVariable("id") Long id, HttpSession session) {
		
		if (session.getAttribute("uuid") == null) return "redirect:/bookclub";
		
		Book book = bookService.findOne(id);
		
		// check to make sure the loggedInUser is the User who created the Book
		if (!session.getAttribute("uuid").equals(book.getUser().getId())) return "redirect:/bookclub/dashboard";
		
		bookService.delete(id);
		
		return "redirect:/bookclub/dashboard";
	}

}
