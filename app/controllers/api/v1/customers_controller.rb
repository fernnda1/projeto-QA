class Api::V1::CustomersController < Nerdify::ApplicationController
  authenticate Customer, auth_path: 'customers/sign_in'
  template "app/V1/controllers/templates/sessions_controller.rb.tt"
end
