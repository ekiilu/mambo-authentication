class CreateUserRoles < ActiveRecord::Migration
  #
  def change
    create_table(:authentication_user_roles) do |t|
      t.integer(:user_id, :null => false)
      t.integer(:role_id, :null => false)
      t.timestamps
    end
    add_index(:authentication_user_roles, [:user_id, :role_id], :unique => true)
  end
end
