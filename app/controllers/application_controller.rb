require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET')
  end

  get "/" do
    erb :welcome
  end

  post "/service_members" do
    @sm = ServiceMember.find_by(email: params[:email], password: params[password])
    session[:id] = @sm.id
    redirect "/service_members/#{@sm.slug}"
  end

end
