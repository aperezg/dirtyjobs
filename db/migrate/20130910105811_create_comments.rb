class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment, null:false
      t.integer :user_id, null:false
      t.integer :company_id, null:false
      t.integer :based_opinion, default:1
      t.integer :down_votes, default:0
      t.integer :status, default:1, null:false
    end
    add_index :comments, :user_id
    add_index :comments, :company_id
    
  end
end
