class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null:false
      t.string :address, null:false
      t.integer :user_id, null:false
      t.string :url, null:true
      t.string :category, null:true
      t.string :image_uri, null:true
      t.decimal :rating, default:0
      t.integer :down_votes, default:0
      t.integer :status, default:1
      t.timestamps
    end
    add_index :companies, :name, unique: true
    add_index :companies, :user_id
  end
end
