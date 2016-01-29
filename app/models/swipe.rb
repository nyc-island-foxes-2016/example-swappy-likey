class Swipe < ActiveRecord::Base
  belongs_to :owned_item, class_name: 'Item', inverse_of: :received_swipes
  belongs_to :judged_item, class_name: 'Item', inverse_of: :given_swipes
  has_many :proposed_matches, class_name: 'Match', foreign_key: :first_swipe_id
  has_many :accepted_matches, class_name: 'Match', foreign_key: :second_swipe_id

  after_save :make_match_if_second_like

  delegate :user, to: :owned_item, prefix: true
  delegate :user, to: :judged_item, prefix: true

  private

  def make_match_if_second_like
    return unless direction_like
    first_swipe = Swipe.find_by(judged_item: self.owned_item, owned_item: self.judged_item, direction_like: true)
    Match.create!(proposing_swipe: first_swipe, accepting_swipe: self) if first_swipe
  end
end