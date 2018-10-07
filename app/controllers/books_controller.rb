class BooksController < ApplicationController

  use Rack::Flash
  
  get "/books" do
    if logged_in?
      @books = current_user.books.all
      erb :"/books/index.html"
    else
      redirect "/"
    end
  end

  get "/books/new" do
    erb :"/books/new.html"
  end

  post "/books" do
    book = Book.create(params[:book])
    if book.save && logged_in?
      book.branch = Branch.find_or_create_by(id: params[:branch][:id])
      current_user.add_book(book)
      flash[:message] = "#{book.book_name} was successfully added!"
      redirect "/books/#{book.id}"
    else
      flash[:message] = "something went wrong. Try adding a book again."
      redirect "books/new"
    end
  end

  get "/books/:id" do
    @book = Book.find_by(id: params[:id])
    if @book && current_user.id == @book.service_member_id
      session[:book_id] = params[:id]
      erb :"/books/show.html"
    elsif @book.nil? && logged_in?
      redirect "/books"
    else
      redirect "/"
    end
  end

  get "/books/:id/edit" do
    @book = Book.find_by(id: params[:id])
    if logged_in?
      erb :"/books/edit.html"
    elsif @book.nil? && logged_in?
      redirect "/books"
    else
      redirect "/"
    end
  end

  patch "/books/:id" do
      redirect "/books/:id"
  end

  delete "/books/:id/delete" do
    redirect "/books"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
     ServiceMember.find(session[:user_id])
    end

    def current_book
      match = current_user.books.find(session[:book_id])
      if match
        Book.find(session[:book_id])
      end
    end
  end
end
