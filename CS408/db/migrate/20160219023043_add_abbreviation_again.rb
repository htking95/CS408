class AddAbbreviationAgain < ActiveRecord::Migration
  def change
  	add_column :departments, :abbreviation, :string 
  end
end
