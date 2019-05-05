class Post < ApplicationRecord
  validates :title, length: { in: 4..50 }
  validates :text, length: { in: 1..250 }
  after_create do
   self.creation_date = Time.now
  end
  belongs_to :user
end
