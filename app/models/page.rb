class Page < ApplicationRecord
  validates :title, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}

  def user
    return user.find_by(id: self.user_id)
  end
end
