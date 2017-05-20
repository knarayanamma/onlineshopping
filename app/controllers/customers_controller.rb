class CustomersController < ApplicationController
	skip_before_action:authenticate_customer,only: [:signin,:signup,:new,:create,:recoverypassword,:forget_password]
  def edit
  	@customer=Customer.find params[:id]
  end
  def recoverypassword
    @customer=Customer.where(email:params[:email]).last
    if @customer 
      @customer.update({password:params[:password],confirmpassword:params[:confirmpassword]})
      flash[:notice]="new password has been set successfully try login!"
      redirect_to root_path
    else
      flash[:notice]="user not found with given email id"
      redirect_to root_path
    end

  end

  def update
  	@customer=Customer.find params[:id]
  	if@customer.update(customer_params)
  		redirect_to customers_path
  	else
  		render :edit
  	end
  end
  def logout
    session[:customer_id] = nil
    redirect_to signin_customers_path
  end

  def new
  	@customer=Customer.new
  end
  def create
  	@customer=Customer.new(customer_params)
  	if@customer.save
  		redirect_to customers_path
  	else
  		render :new
  	end
  end
  def destroy
  	@customer=Customer.find params[:id]
  	@customer.destroy
  	redirect_to customers_path
  end
  def signup
  	@customer=Customer.authenticate(params[:email],params[:password])
  	if @customer
  		session[:customer_id]=@customer.id
  		redirect_to customers_path
  	else
  		redirect_to signin_customers_path
  	end
  end

  def show
  	@customer=Customer.find params[:id]
  end

  def index
  	@customers=Customer.all
  end
  private
   def customer_params
    params.require(:customer).permit!
   end
end
