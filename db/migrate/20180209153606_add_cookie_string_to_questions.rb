
class AddCookieStringToUsers < ActiveRecord::Migration[5.0]

  def change
  	add_column :users, :cookiestring, :string 
  	remove_column :questions, :cookiestring, :string 
  end

end


