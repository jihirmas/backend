class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.string :token
      t.references :user, null: false, foreign_key: true
      t.string :coordinates

      t.timestamps
    end
  end
end
