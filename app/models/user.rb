class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :trackable

  has_many :items, inverse_of: :user, dependent: :destroy

  validates :email, presence: true
end
