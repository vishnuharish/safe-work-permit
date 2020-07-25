class User < ApplicationRecord
    has_secure_password

    validates_presence_of :firstname
    validates_presence_of :lastname
    validates_presence_of :email
    validates_presence_of :username
end
