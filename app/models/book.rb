class Book < ApplicationRecord
  validates :name, presence: true
  validates :quantity, presence: true
  belongs_to :faculty
  belongs_to :category
  has_one :image, as: :imageable, dependent: :destroy

 # scope :created_in, -> {
 #  where(created_at: Date.today)
 # }


  after_save  :send_new_notification
  after_create :send_notification
  def send_notification
     puts "Book created successfully"
  end

  def send_new_notification
     puts "Book saved successfully"
  end
end





