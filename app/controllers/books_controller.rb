class BooksController < ApplicationController

  # GET: /books
  get "/books" do
    erb :"/books/index.html"
  end

  # GET: /books/new
  get "/books/new" do
    erb :"/books/new.html"
  end

  # POST: /books
  post "/books" do
    book = Book.create(
      book_name: params[:book][:book_name],
      unit_name: params[:book][:unit_name],
      security_clearance_level: params[:book][:security_clearance_level],
      firstline_supervisor_name: params[:book][:firstline_supervisor_name],
      firstline_supervisor_email: params[:book][:firstline_supervisor_email],
      firstline_supervisor_phone: params[:book][:firstline_supervisor_phone],
      commander_name: params[:book][:commander_name],
      commander_email: params[:book][:commander_email],
      commander_phone: params[:book][:commander_phone]
    )
    if book.save && logged_in?
      book.branch = Branch.find_or_create_by(name: params[:book][:branch])
      current_user.add_book(book)
    end
    redirect "/service_members/#{current_user.slug}"
  end

  # GET: /books/5
  get "/books/:id" do
    @book = Book.find_by(id: params[:id])
    if logged_in? && current_user.id == @book.service_member_id
      @logged_in = session[:user_id]
      erb :"/books/show.html"
    else
      redirect "/service_members/login"
    end
  end

  # GET: /books/5/edit
  get "/books/:id/edit" do
    erb :"/books/edit.html"
  end

  # PATCH: /books/5
  patch "/books/:id" do
    redirect "/books/:id"
  end

  # DELETE: /books/5/delete
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
  end
end
