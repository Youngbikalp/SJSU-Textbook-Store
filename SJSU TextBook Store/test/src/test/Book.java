package test;

public class Book {
	private String book_id;
	private String title;
	private String description;
	private String Author;
	private String price;
	private String ISBN;

	public Book(String t, String d, String a, String p, String isbn) {

		this.title = t;
		this.description = d;
		this.Author = a;
		this.price = p;
		this.ISBN = isbn;

	}

	public Book(String book_id) {

		this.book_id = book_id;

	}

	public String getBook_id() {
		return book_id;
	}

	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAuthor() {
		return Author;
	}

	public void setAuthor(String author) {
		Author = author;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getIsbn() {
		return ISBN;
	}

	public void setISBN(String isbn) {
		this.ISBN = isbn;
	}

}