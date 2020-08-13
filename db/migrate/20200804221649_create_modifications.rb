class CreateModifications < ActiveRecord::Migration
  def change
    create_table :modifications do |m|
      m.string :name
    end
  end
end
