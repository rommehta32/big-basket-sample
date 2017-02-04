class AdministratorApplicationController < ApplicationController
  skip_before_filter :authenticate_user!
  before_filter :authenticate_administrator!

  def authenticate_administrator!
    if current_user && !current_user.is_admin?
      flash[:error] = 'Information you requested, either does not exist or is not authorized for access.'
      redirect_to root_url
      return
    end
  end
end
