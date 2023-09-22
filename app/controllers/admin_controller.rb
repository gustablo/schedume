class AdminController < ApplicationController
  include Session
  include Flash

  before_action :require_login

  def index
  end
end
