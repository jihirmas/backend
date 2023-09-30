# == Schema Information
#
# Table name: invitations
#
#  id          :integer          not null, primary key
#  coordinates :string
#  token       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_invitations_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Invitation < ApplicationRecord
    belongs_to :user
  end
  