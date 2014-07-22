class AddRememberTokenToSupervisors < ActiveRecord::Migration
  def change
  	add_column :supervisors, :remember_token, :string
    add_index  :supervisors, :remember_token
  end
end
