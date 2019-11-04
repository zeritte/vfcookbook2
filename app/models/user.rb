class User < ApplicationRecord
  acts_as_token_authenticatable
  after_initialize :set_default_role, :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:member, :editor, :admin]


  def set_default_role
    self.role ||= :member
  end
end
