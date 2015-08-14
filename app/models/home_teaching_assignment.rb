class HomeTeachingAssignment < ActiveRecord::Base
  has_one :companionship
  has_many :families
end
