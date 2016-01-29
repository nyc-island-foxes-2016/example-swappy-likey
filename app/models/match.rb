class Match < ActiveRecord::Base
  belongs_to :proposing_swipe, class_name: 'Swipe', foreign_key: :first_swipe_id, inverse_of: :proposed_matches
  belongs_to :accepting_swipe, class_name: 'Swipe', foreign_key: :second_swipe_id, inverse_of: :accepted_matches
  has_many :messages
end