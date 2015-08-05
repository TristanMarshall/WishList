class UsersController < ApplicationController

  # does username exist?
  def does_user_exist(username)
    user = UsersModel.find_by(:user_name => username.to_s)
    if user
      return true
    else
      return false
    end
  end

  # registration
  get '/register' do
    erb :users_register
  end

  post "/register" do
    @message = ''

    if self.does_user_exist(params[:user_name]) == true
      @message = 'The username you selected already exists. Please try again'
      erb :user_notification
    end

    # generate a salt and hash to use
    password_salt = BCrypt::Engine.generate_salt
    password_hash = BCrypt::Engine.hash_secret(params[:password], password_salt)

    new_user = UsersModel.new
    new_user.user_name = params[:user_name]
    new_user.user_email = params[:user_email]
    new_user.password_salt = password_salt
    new_user.password_hash = password_hash
    new_user.is_admin = false
    new_user.save

    session[:current_user] = user
    @message = 'Congrats!  Your account has been registered.'

    erb :user_notification

  end

  #login
  get '/login' do
    erb :users_login
  end

  post "/login" do
    @message = ''
    if self.does_user_exist(params[:user_name]) == true
      user = UsersModel.where(:user_name => params[:user_name]).first!
      if user.password_hash == BCrypt::Engine.hash_secret(params[:password], user.password_salt)
        session[:current_user] = user
        redirect "/"
      end
    end
    @message = 'A login error has occured. Please try again.'
    erb :user_notification
  end

  get "/logout" do
    session[:current_user] = nil
    redirect "/"
  end

end
