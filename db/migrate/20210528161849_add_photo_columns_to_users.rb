class AddPhotoColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_attachment :users, :photo
  end
end
