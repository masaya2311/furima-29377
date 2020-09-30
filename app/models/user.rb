class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname

    VALID_FAMILY_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    validates :family_name, format: { with: VALID_FAMILY_NAME_REGEX, message: 'は全角で入力してください' }

    VALID_FIRST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    validates :first_name, format: { with: VALID_FIRST_NAME_REGEX, message: 'は全角で入力してください' }

    VALID_FAMILY_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :family_name_kana, format: { with: VALID_FAMILY_NAME_KANA_REGEX, message: 'は全角カタカナで入力してください' }

    VALID_FIRST_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :first_name_kana, format: { with: VALID_FIRST_NAME_KANA_REGEX, message: 'は全角カタカナで入力してください' }

    validates :birthday

    validates :password, length: { minimum: 6 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }
  end
end
