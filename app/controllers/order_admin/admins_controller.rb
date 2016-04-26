class OrderAdmin::AdminsController < ApplicationController
   layout 'order_admin'
   http_basic_authenticate_with(
    name: Rails.application.secrets.admin_name,
    password: Rails.application.secrets.admin_pass
   )
end
