# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  description     :text
#  dob             :date
#  email           :string           not null
#  first_name      :string
#  last_name       :string
#  password_digest :string           not null
#  phone           :string
#  raw             :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  has_many :api_keys, as: :bearer
  has_secure_password
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  # Asociaciones para amistad en User
  
  has_many :friendships
  has_many :friends, through: :friendships
  
  has_many :trips
  has_many :posts, through: :trips
  has_many :destinations, through: :posts
  has_many :users, through: :posts
  has_many :invitations

end



