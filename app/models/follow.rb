class Follow < ApplicationRecord
  belongs_to :member

  validates :member_id, :followable_id, :followable_type, presence: true
end
