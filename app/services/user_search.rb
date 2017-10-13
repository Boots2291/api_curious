class UserSearch
  def initialize(user)
    @user = user
    @conn = Faraday.new('https://api.github.com/') do |faraday|
      faraday.headers['Authorization'] = "token #{@user.token}"
      # faraday.headers['Accept'] = 'application/vnd.github.cloak-preview'
      faraday.adapter Faraday.default_adapter
    end
  end

  def api_call(endpoint)
    response = @conn.get(endpoint)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_info
    user_info = api_call('/user')
    user_info[:starred_repos] = api_call('/user/starred')
    user_info
  end

  def get_user_commits
    user_commits = api_call("/users/#{@user.nickname}/events")
    user_commits = user_commits[0..4]
  end

  def get_user_repos
    user_repos = api_call('/user/repos')
  end

  def self.get_info(user)
    new(user).get_info
  end

  def self.get_user_commits(user)
    new(user).get_user_commits
  end

  def self.get_user_repos(user)
    new(user).get_user_repos
  end
end