package com.gaudetb.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaudetb.bookclub.models.Book;
import com.gaudetb.bookclub.repos.BookRepo;


@Service
public class BookService {
	
	@Autowired
	BookRepo bookRepo;
	
	// ============> CREATE / UPDATE <============
	
	public Book save(Book book) {
		return bookRepo.save(book);
	}

	// ============> READ <============
	
	public List<Book> findAll() {
		return bookRepo.findAll();
	}
	
	public Book findOne(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if (optionalBook.isPresent()) return optionalBook.get();		
		else return null;
		
	}

	// ============> DELETE <============

	public void delete(Long id) {
		bookRepo.deleteById(id);
	}

}
