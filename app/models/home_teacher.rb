class HomeTeacher < Member
  has_one :companion, class_name: "Member", foreign_key: "companion_id"
  belongs_to :companion, class_name: "Member", foreign_key: "companion_id"
  belongs_to :companionship

  def full_name
    "#{firstname} #{lastname}"
  end

  def set_companion(new_companion)
    # first, nullify current companionship
    self.companion.companion_id = ""
    self.companion.save!
    self.companion_id = ""
    self.save!

    # next, nullify new companion current companionship
    new_companion.companion.companion_id = ""
    new_companion.companion.save!
    new_companion.companion_id = ""
    new_companion.save!

    # last, link self and new companion together
    self.companion_id = new_companion.id
    self.save!
    new_companion.companion_id = self.id
    new_companion.save!
  end
end
