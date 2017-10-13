class DashboardController < ApplicationController
  def index
    @user_info = UserSearch.get_info(current_user)
    @user_commits = UserSearch.get_user_commits(current_user)
    @user_repos = UserSearch.get_user_repos(current_user)
  end
end
