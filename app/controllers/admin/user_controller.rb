class Admin::UserController < ApplicationController
  file = File.read("#{Rails.root}/config/secrets/admin_config.yml")
  ADMIN_CONFIG = YAML.load(file)[Rails.env].symbolize_keys

  before_filter :set_admin
  http_basic_authenticate_with :name => ADMIN_CONFIG[:name], :password => ADMIN_CONFIG[:password]

def index
  @users = User.all
end

def new
  @user = User.new
end




private
  def set_admin
    @admin = true
  end

end