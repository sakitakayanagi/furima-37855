class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: true
  validates :last_name,            format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "を入力してください" } 
  validates :last_name_kana,       format: {with: /\A[ァ-ヶー－]+\z/, message: "を入力してください"  } 
  validates :first_name,           format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "を入力してください"  } 
  validates :first_name_kana,      format: {with: /\A[ァ-ヶー－]+\z/, message: "を入力してください"  }
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }
end