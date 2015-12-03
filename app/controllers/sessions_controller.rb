class SessionsController < ApplicationController
  def create
    user = User.omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    if (user.phonenumber == nil)
      redirect_to '/customer/customer_add_phonenumber_to_account'
    else
      redirect_to '/customer/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def business_new
  end
  
  def business_create
    @business = Business.find_by_email(params[:session][:email])
    if @business && @business.authenticate(params[:session][:password])
      session[:business_id] = @business.id
      redirect_to '/business_options'
    else
      redirect_to 'business_login'
    end 
  end
  
  def business_destroy
    session[:business_id] = nil
    redirect_to root_url
  end
  
end
