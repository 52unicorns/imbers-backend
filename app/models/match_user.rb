class MatchUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  def reveal!
    update!(revealed: true)
  end
end
