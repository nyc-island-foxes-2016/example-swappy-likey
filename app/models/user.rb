class User < ActiveRecord::Base
  has_secure_password

  has_many :items
  has_many :given_swipes, through: :items

  has_many :bid_swipe_items, through: :given_swipes, source: :judged_item
  has_many :offered_swipe_items, through: :given_swipes, source: :owned_item

  has_many :bid_item_matches, through: :bid_swipe_items, source: :accepted_matches
  has_many :offered_item_matches, through: :offered_swipe_items, source: :proposed_matches

  def wanted_items
    bid_swipe_items.where('swipes.direction_like = ?', true)
  end

  def rejected_items
    bid_swipe_items.where('swipes.direction_like = ?', false)
  end

end