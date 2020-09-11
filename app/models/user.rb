class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchasers
        
  with_options presence: true do
      validates :nickname
      validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is Full-width characters" }
      validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ , message: 'is Full-width characters' }
      validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ , message: 'is Full-width characters' } 
      validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ , message: 'is Full-width characters' }
      validates :birthday
  end
       
      # validates :email, presence: true, format: { with: /^([a-z -Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/ }
      validates :password, presence: true, length: { minimum: 6 }

      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email, presence: true, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX }

   
end
