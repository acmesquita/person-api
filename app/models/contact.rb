class Contact < ApplicationRecord
  belongs_to :person

  enum :kind, { phone: "phone", email: "email" }
end
