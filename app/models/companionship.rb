class Companionship < ActiveRecord::Base
  has_many :home_teachers, foreign_key: :companionship_id, class_name: "Member"
  has_many :companions, foreign_key: :companionship_id, class_name: "Member"
  has_many :families
end
