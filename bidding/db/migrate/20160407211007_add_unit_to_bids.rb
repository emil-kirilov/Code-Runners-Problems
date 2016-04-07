class AddUnitToBids < ActiveRecord::Migration[5.0]
  #going around this "glich"
    #When adding a table from scratch, you can specify NOT NULL, 
    #However, you can't do this when adding a column. SQLite's 
    #specification says you have to have a default for this 
    #(SQLite would typically choose NUL), which is a poor choice.

  def self.up
    add_column :bids, :unit, :string
    change_column :bids, :unit, :string, :null => false
  end

  def self.down
    remove_column :bids, :unit
  end
end
