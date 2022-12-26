class Group < ApplicationRecord
  has_many :group_users, through: :users
  
  has_one_attached :image
  
  def get_image
    (image.attached?) ? image: 'no_image.jpg'
  end
end
