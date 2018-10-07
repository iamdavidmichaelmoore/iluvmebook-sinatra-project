class AwardsController < ApplicationController

  use Rack::Flash
  
  get "/awards" do
    if logged_in?
      @awards = current_book.awards.all
      erb :"/awards/index.html"
    else
      redirect "/"
    end
  end

  get "/awards/new" do
    erb :"/awards/new.html"
  end

  post "/awards" do
    award = Award.create(params[:award])
    if award.save && logged_in?
      current_book.add_award(award)
      flash[:message] = "The '#{params[:award][:name]}' was successfully added to #{current_book.book_name}!"
      redirect "/awards/#{award.id}"
    elsif award.nil? && logged_in?
      flash[:message] = "Something went wrong. Try adding an award again."
      redirect "/awards/new"
    else
      redirect "/"
    end
  end

  get "/awards/:id" do
    @award = Award.find_by(id: params[:id])
    if @award && current_book.id == @award.book_id
      session[:award_id] = params[:id]
      erb :"/awards/show.html"
    elsif @award.nil? && logged_in?
      redirect "/books/#{@award.id}"
    else
      redirect "/"
    end
  end

  get "/awards/:id/edit" do
    @award = Award.find_by(id: params[:id])
    if @award && current_book.id == @award.book_id
      erb :"/awards/edit.html"
    elsif @award.nil? && logged_in?
      redirect "/awards"
    else
      redirect "/"
    end
  end

  patch "/awards/:id" do
    redirect "/awards/:id"
  end

  delete "/awards/:id/delete" do
    redirect "/awards"
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

    def current_award
      match = current_book.awards.find(session[:award_id])
      if match
        Award.find(session[:award_id])
      end
    end
  end
end
