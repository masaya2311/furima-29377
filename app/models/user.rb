class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchasers
        
  with_options presence: true do
      validates :nickname
      
      VALID_FAMILY_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
      validates :family_name, format: { with: VALID_FAMILY_NAME_REGEX, message: "is Full-width characters" }

      VALID_FIRST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
      validates :first_name, format: { with: VALID_FIRST_NAME_REGEX , message: 'is Full-width characters' }

      VALID_FAMILY_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
      validates :family_name_kana, format: { with: VALID_FAMILY_NAME_KANA_REGEX , message: 'is Full-width characters' } 

      VALID_FIRST_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
      validates :first_name_kana, format: { with: VALID_FIRST_NAME_KANA_REGEX , message: 'is Full-width characters' }

      validates :birthday

      validates :password length: { minimum: 6 }

      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX }
  end
end
      
      
      
      
