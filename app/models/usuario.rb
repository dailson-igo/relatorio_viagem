# frozen_string_literal: true

class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :registerable, :recoverable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  rails_admin do
    navigation_label  'Administrativo'
    navigation_icon   'fas fa-user'
    weight(-100)

    field(:email)
    field(:created_at) { read_only true }

    edit do
      field(:password, :password)
      field(:password_confirmation, :password)
    end
  end
end
