class Company < ApplicationRecord
  include ActiveModel::Serialization
  acts_as_punchable

end
