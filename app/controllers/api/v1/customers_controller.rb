class Api::V1::CustomersController < Nerdify::ApplicationController
  authenticate Customer, auth_path: 'customers/sign_in'
  template "app/V1/controllers/templates/sessions_controller.rb.tt"
end

class CustomersController < ApplicationController
  def new
    @customer = Customer.new

  end

  def creat
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to root_path, notice: 'Customer was successfully created.'
    else
      render :new
    end
    
    
  end
end
