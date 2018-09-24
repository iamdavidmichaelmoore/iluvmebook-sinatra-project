class AwardsController < ApplicationController

  # GET: /awards
  get "/awards" do
    erb :"/awards/index.html"
  end

  # GET: /awards/new
  get "/awards/new" do
    erb :"/awards/new.html"
  end

  # POST: /awards
  post "/awards" do
    redirect "/awards"
  end

  # GET: /awards/5
  get "/awards/:id" do
    erb :"/awards/show.html"
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
end
