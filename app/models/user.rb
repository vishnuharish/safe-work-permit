class User < ApplicationRecord
    has_secure_password

    has_many :safe_works, :foreign_key => "created_by"
    has_many :extended_safe_works, class_name: "SafeWork", foreign_key: "extended_by"
    has_many :approved_safe_works, class_name: "SafeWork", foreign_key: "approved_by"
    has_many :field_engineers, class_name: "User", foreign_key: "manager_id"
    belongs_to :supervisor, class_name: "User", foreign_key: "manager_id", :optional => true
    validates_presence_of :firstname
    validates_presence_of :lastname
    validates_presence_of :email


    def pending_for_approval
        pending_list = []
            self.field_engineers.each do |fe|
                fe.safe_works.each do |sw|
                    if !sw.is_approved && !sw.is_rejected
                        pending_list.push(sw)
                    end
                end
            end
            return pending_list
    end

    def fullname
        "#{self.firstname.capitalize} #{self.lastname.capitalize}"
    end

end
