resource :customer do
  action :index
  action :show, layout: :default
  action :edit, only: %w(show), on: :member, position: :header, layout: :default, click: {redirect_to: "edit"}, submit: {put: "..", data: {:customer => ":resource"}, success: {redirect_to: "..", toast: :success}, error: {toast: :error, update: "components"}}
  action :edit_cancel, only: %w(edit), on: :member, position: :footer, click: {redirect_to: ".."}
  action :update, only: %w(edit), on: :member, position: :footer, click: {submit: "edit_customer"}
  action :new, only: %w(index), on: :collection, position: :header, layout: :default, click: {redirect_to: "new"}, submit: {post: "..", data: {:customer => ":resource"}, success: {redirect_to: "..", toast: :success}, error: {toast: :error, update: "components"}}
  action :new_cancel, only: %w(new), on: :member, position: :footer, click: {redirect_to: ".."}
  action :create, only: %w(new), on: :member, position: :footer, click: {submit: "new_customer"}
  action :destroy, only: %w(show), on: :member, position: :header, layout: :default, click: {delete: ".", confirm: true, success: {redirect_to: "..", toast: :success}, error: {toast: :error}}
end
