class AwardsController < ApplicationController

  # # GET: /awards
  # get "/awards" do
  #   erb :"/awards/index.html"
  # end

  # GET: /awards/new
  get "/awards/new" do
    erb :"/awards/new.html"
  end

  # POST: /awards
  post "/awards" do
    award = Award.create(params[:award])
    if award.save && logged_in?
      current_book.add_award(award)
    end
    redirect "/awards"
  end

  # GET: /awards/5
  get "/awards/:id" do
    @award = Award.find_by(id: params[:id])
    if @award && logged_in? && current_book
      erb :"/awards/show.html"
    elsif @award.nil? && logged_in?
      redirect "/books/#{current_book.id}"
    else
      redirect "/service_members/login"
    end
  end

  # GET: /awards/5/edit
  get "/awards/:id/edit" do
    erb :"/awards/edit.html"
  end

  # PATCH: /awards/5
  patch "/awards/:id" do
    redirect "/awards/:id"
  end

  # DELETE: /awards/5/delete
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
  end
end
