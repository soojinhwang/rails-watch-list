class RenameUrlColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :movies, :poster_url_text, :poster_url
  end
end
