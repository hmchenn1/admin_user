class SessionsController < ApplicationController
  include SessionsHelper  # better?
  def new
      @title = "Sign in"
    end

    def create
        user = User.authenticate(params[:session][:email],
                                 params[:session][:password])
        if user.nil?
          flash.now[:error] = "Invalid email/password combination."
          @title = "Sign in"
          render 'new'
        elsif user.admin?
          redirect_to users_path
           
        else 
           sign_in user
           redirect_to user
        end
      end

      def destroy
          sign_out
          redirect_to root_path
      end
  end