class Job < ApplicationRecord
  # Direct associations

  belongs_to :contact,
             :counter_cache => true

  # Indirect associations

  # Validations

end
