class DashboardController < ApplicationController
  def index
    @user_info = UserSearch.get_info(current_user)
  end
end
