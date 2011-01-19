class UsersController < ApplicationController
  include SessionsHelper  #better?
  
 before_filter :authenticate, :only => [:index, :destroy]
  
  def authenticate
   # deny_access if User.new(params[:user]) && User.new(params[:user]).admin?    
    #deny_access unless self.admin?      
    #not working, why?                
  end
   
   
   def deny_access
      
       redirect_to signin_path, :notice => "Only admin can access this page."
     end
  
  # the above code not working
  
  
  
  def index
    
    @title ="All users"
    @users = User.all
  end
  def show
      @user = User.find(params[:id])
      @title =@user.name
    end
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] = "You have successfully signed up and in!"
        redirect_to @user
      else
        @title = "Sign up"
        render 'new'
      end
    end
    def destroy
      @user = User.find(params[:id])
      
        @user.destroy
       

      respond_to do |format|
        format.html { redirect_to(users_url) }
        format.xml  { head :ok }
      end
    end

end
