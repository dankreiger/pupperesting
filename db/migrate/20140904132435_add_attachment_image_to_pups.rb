class AddAttachmentImageToPups < ActiveRecord::Migration
  def self.up
    change_table :pups do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :pups, :image
  end

end
