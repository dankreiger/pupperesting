class CreatePups < ActiveRecord::Migration
  def change
    create_table :pups do |t|
      t.string :description

      t.timestamps
    end
  end
end
