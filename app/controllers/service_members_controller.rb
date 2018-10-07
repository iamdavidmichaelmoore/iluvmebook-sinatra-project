class ServiceMembersController < ApplicationController

  use Rack::Flash

  get "/" do
    if logged_in?
      redirect "/service_members/#{current_user.slug}"
    else
      erb :welcome
    end
  end

  get '/service_members/signup' do 
    if logged_in?
      redirect "/service_members/#{current_user.slug}"
    else
      erb :"/service_members/new.html"
    end
  end

  get '/service_members/login' do
    if logged_in?
      redirect "/service_members/#{current_user.slug}"
    else
      redirect "/"
    end
  end

  post '/service_members/login' do
    sm = ServiceMember.find_by(email: params[:service_member][:email])
    if sm && sm.authenticate(params[:service_member][:password])
      session[:user_id] = sm.id
      flash[:message] = "Welcome back, #{sm.first_name}!"
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
    if params[:service_member][:password] == params[:service_member][:confirm_password]
      sm = ServiceMember.create(params[:service_member])
      if sm.save
        session[:user_id] = sm.id
        flash[:message] = "User account successfully created!"
        redirect "/service_members/#{sm.slug}"
      else
        redirect "/service_members/failure"
      end
    else
      flash[:message] = "Password entries do not match!"
      redirect "/service_members/signup"
    end
  end

  get "/service_members/:slug" do
    @sm = ServiceMember.find_by_slug_and_id(params[:slug], current_user.id) 
    if @sm && logged_in?
      erb :"/service_members/show.html"
    elsif @sm.nil? && logged_in?
      redirect "/service_members/#{current_user.slug}"
    else
      redirect "/service_members/login"
    end
  end

  get "/service_members/:slug/edit" do
    @sm = ServiceMember.find_by_slug_and_id(params[:slug], current_user.id)
    if @sm && logged_in?
      @logged_in = session[:user_id]
      erb :"/service_members/edit.html"
    elsif @sm.nil? && logged_in?
      redirect "/service_members/#{current_user.slug}"
    else
      redirect "/service_members/login"
    end
  end

  patch "/service_members/:slug" do
    sm = ServiceMember.find_by_slug_and_id(params[:slug], current_user.id)
    if params[:service_member][:password] == params[:service_member][:confirm_password]
      new_params = delete_nil_hashes(params[:service_member])
      sm.update(new_params)
      sm.save
      if sm.save
        flash[:message] = "Successfully updated your account information!"
        redirect "/service_members/#{sm.slug}"
      else
        flash[:message] = "Something went wrong! Please try updating again."
        redirect "/sevice_members/#{sm.slug}"
      end
    else
      flash[:message] = "Password entries do not match!"
      redirect "/service_members/#{sm.slug}"
    end
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

    def delete_nil_hashes(hash)
      hash.delete_if {|k,v| v == ""}
    end
  end
end
