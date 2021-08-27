class FindMatch
  def initialize(target, user)
    @target = target
    @user = user
  end

  def search
    @possible_matches = Target.within(@target.radius, origin: @target)
    @possible_matches = @possible_matches.where(topic: @target.topic).where.not(user: @user)
    @possible_matches.each do |item|
      Conversation.create(user1: User.find(item.user.id), user2: @user)
    end
    @possible_matches
  end
end
