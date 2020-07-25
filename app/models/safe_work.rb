class SafeWork < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "created_by"
    belongs_to :extended_user, class_name: "User", foreign_key: "extended_by"


    attr_reader :extended
    attr_reader :requested_by
    attr_reader :approver

    def requested_by
        if !self.creator
            ""
        else
          self.creator.fullname
        end

    end

    def extended
       if !self.extended_user
        ""
       else
        self.extended_user.fullname
       end
    end

    def approver
        if self.created_by
           return  self.creator.supervisor.fullname
        end
        return nil
    end

    def status
        if self.is_approved
            return "Approved"
        elsif self.is_rejected
            return "Rejected"
        end
    end

    def approved_or_rejected_by
        if self.approved_by
            return User.find(self.approved_by).fullname
        end

    end

end
