class Family < ActiveRecord::Base
  has_many :members
  belongs_to :companionship
  delegate :home_teachers, :to => :companionship
end
