class Post < ApplicationRecord
  validates :title, length: { in: 1..50 }
  validates :text, length: { in: 1..250 }
  after_create do
   self.creation_date = Time.now
  end
  belongs_to :user
  has_many_attached :images
  has_one_attached :file_attachment
end
