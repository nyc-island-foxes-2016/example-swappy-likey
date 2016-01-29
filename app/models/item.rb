class Item < ActiveRecord::Base
  belongs_to :user
  has_many :received_swipes, class_name: 'Swipe', foreign_key: :judged_item_id
  has_many :given_swipes, class_name: 'Swipe', foreign_key: :owned_item_id
  has_many :proposed_matches, through: :given_swipes
  has_many :accepted_matches, through: :received_swipes
end