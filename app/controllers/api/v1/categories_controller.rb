class Api::V1::CategoriesController < Nerdify::ApplicationController
  authenticate User, auth_path: 'users/sign_in'
  template "nerdify/templates/onepet_application"
end