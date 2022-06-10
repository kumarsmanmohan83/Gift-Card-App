class SessionsController < ApplicationController
      def new
      end
    
      def create
        user = User.find_by(username: params[:login][:username].downcase)
         
        if user && user.authenticate(params[:login][:password]) && user.role==0
          session[:user_id] = user.id.to_s
          redirect_to users_welcome_path, notice: 'Successfully logged in! as User'
        elsif user && user.authenticate(params[:login][:password]) && user.role==1
          session[:user_id] = user.id.to_s
          redirect_to users_admin_path, notice: 'Successfully logged in! as Admin'
        else
          flash.now.alert = "Incorrect email or password, try again."
          render :new
        end
      end
    
      def destroy
        session.delete(:user_id)
        redirect_to login_path, notice: "Logged out!"
      end
      
    end