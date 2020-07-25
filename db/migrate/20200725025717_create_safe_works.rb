class CreateSafeWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :safe_works do |t|
      t.integer :company_id
      t.string :company_name
      t.integer :crew_size
      t.boolean :is_snv_lavalin
      t.boolean :is_sub_contractor
      t.datetime :issued_datetime
      t.datetime :expired_datetime
      t.datetime :extended_datetime
      t.integer :extended_by
      t.text :emergency_meeting_point
      t.text :location
      t.text :description_of_work
      t.integer :approved_by
      t.datetime :approved_datetime
      t.integer :created_by
      t.datetime :updated_by
      t.timestamps
    end
  end
end
