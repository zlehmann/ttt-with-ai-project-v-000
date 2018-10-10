class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def token
    @token
  end

  include Players::Human

end
