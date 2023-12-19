class Member < ApplicationRecord
  has_secure_token

  belongs_to :school
  has_many :follows, dependent: :destroy

  validates :password, :confirm_password, :token, :school_id, presence: true
  validates :name, uniqueness: { scope: :school_id, message: "当前公司下已有该账号了"}, presence: true
  validates :confirm_password, comparison: { equal_to: :password }
  enum kype: { teacher: 0, student: 1}

  def followers
    Member.where(id: self.follows.pluck(:followable_id))
  end
end
