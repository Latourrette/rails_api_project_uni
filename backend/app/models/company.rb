class Company < ApplicationRecord
  has_one_attached :image
  acts_as_punchable

end
