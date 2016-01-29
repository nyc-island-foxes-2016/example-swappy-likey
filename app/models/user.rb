class User < ActiveRecord::Base
  has_secure_password

  has_many :items
  has_many :given_swipes, through: :items
  has_many :bid_items_swiped, through: :given_swipes, source: :judged_item
  has_many :offered_items_swiped, through: :given_swipes, source: :owned_item

  has_many :bid_item_matches, through: :bid_items_swiped, source: :accepted_matches
  has_many :offered_item_matches, through: :offered_items_swiped, source: :proposed_matches

  def wanted_items
    bid_items_swiped.where('swipes.direction_like = ?', true)
  end

  def rejected_items
    bid_items_swiped.where('swipes.direction_like = ?', false)
  end

end