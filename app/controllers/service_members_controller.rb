class ServiceMembersController < ApplicationController

  # GET: /service_members
  get "/service_members" do
    @sms = ServiceMember.all
    erb :"/service_members/index.html"
  end

  get "/service_members/" do
    redirect "/service_members"
  end

  # GET: /service_members/new
  get "/service_members/new" do
    erb :"/service_members/new.html"
  end

  # POST: /service_members
  post "/service_members" do
    @sm = ServiceMember.create(params[:service_member])
    session[:message] = "Hi, #{@sm.first_name}!"
    session[:id] = @sm.id
    redirect "/service_members"
  end

  # GET: /service_members/5
  get "/service_members/:id" do
    @sm = ServiceMember.find_by_slug(params[:id])
    @message = session 
    binding.pry
    if @message && @message[:id] == @sm.id
      erb :"/service_members/show.html"
    else
      redirect '/service_members'
    end
  end

  # GET: /service_members/5/edit
  get "/service_members/:id/edit" do
    @message = session
    erb :"/service_members/edit.html"
  end

  # PATCH: /service_members/5
  patch "/service_members/:id" do
    redirect "/service_members/:id"
  end

  # DELETE: /service_members/5/delete
  delete "/service_members/:id/delete" do
    redirect "/service_members"
  end

  # LOGOUT: /service?members/logout
  get '/service_members/logout' do
    session.clear
  end
end
