class ServiceMembersController < ApplicationController

  get "/" do
    erb :welcome
  end

  get '/service_members/signup' do 
    erb :"/service_members/new.html"
  end

  get '/service_members/login' do
    redirect "/"
  end

  post '/service_members/login' do
    sm = ServiceMember.find_by(email: params[:service_member][:email])
    if sm && sm.authenticate(params[:service_member][:password])
      session[:user_id] = sm.id
      redirect "/service_members/#{sm.slug}"
    else
      redirect "/service_members/failure"
    end
  end
  
  get "/service_members" do
    if logged_in?
      @sms = ServiceMember.all
      erb :"/service_members/index.html"
    else
      redirect "/service_members/login"
    end
  end

  get '/service_members/failure' do
    erb :"/service_members/failure.html"
  end

  get '/service_members/logout' do
    session.clear
    redirect "/service_members/login"
  end

  post "/service_members/signup" do
    sm = ServiceMember.create(params[:service_member])
    if sm.save
      session[:user_id] = sm.id
      redirect "/service_members/#{sm.slug}"
    else
      redirect "/service_members/failure"
    end
  end

  get "/service_members/:id" do
    @sm = ServiceMember.find_by_slug(params[:id]) 

    if @sm && logged_in? && current_user.id == @sm.id
      @logged_in = session[:user_id]
      erb :"/service_members/show.html"
    elsif @sm.nil? && logged_in?
      redirect "/service_members/#{current_user.slug}"
    else
      redirect "/service_members/login"
    end
  end

  get "/service_members/:id/edit" do
    @sm = ServiceMember.find_by_slug(params[:id])
    if logged_in? && current_user.id == @sm.id
      @logged_in = session[:user_id]
      erb :"/service_members/edit.html"
    else
      redirect "/service_members/login"
    end
  end

  patch "/service_members/:id" do
    redirect "/service_members/:id"
  end

  delete "/service_members/:id/delete" do
    redirect "/service_members"
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
