class AddIsApprovedIsRejectedCommentsToSafeWork < ActiveRecord::Migration[6.0]
  def change
    add_column :safe_works, :is_approved, :boolean
    add_column :safe_works, :is_rejected, :boolean
    add_column :safe_works, :comments, :text
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
