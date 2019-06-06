class Contact < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  has_many   :tasks,
             :dependent => :destroy

  has_many   :jobs,
             :dependent => :destroy

  has_many   :activities,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
