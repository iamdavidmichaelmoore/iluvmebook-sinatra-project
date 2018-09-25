class ServiceMembersController < ApplicationController

  # GET: /service_members
  get "/service_members" do
    @service_members = ServiceMember.all
    erb :"/service_members/index.html"
  end

  # GET: /service_members/new
  get "/service_members/new" do
    erb :"/service_members/new.html"
  end

  # POST: /service_members
  post "/service_members" do
    @service_member = ServiceMember.create(params[:service_member])
    redirect "/service_members"
  end

  # GET: /service_members/5
  get "/service_members/:id" do
    first_name = params[:id].split("-").first.capitalize
    last_name = params[:id].split("-").last.capitalize
    @service_member = ServiceMember.find_by(first_name: first_name, last_name: last_name)
    erb :"/service_members/show.html"
  end

  # GET: /service_members/5/edit
  get "/service_members/:id/edit" do
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
end
