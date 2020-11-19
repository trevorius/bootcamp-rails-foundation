class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :registerable
  
  has_many :employees
  def display_name
    "#{email}"
  end
  has_many :customers
  def to_s
    "#{email}"
  end

  #belongs_to :quote

  # Assign admin role if user is an Employee and not a tchnician
  def admin?
    if Employee.where(email: email).take != nil
      if Employee.where(email: email).take[:title] != "technician"
        employees = Employee.where(["email = ?", email])
        if employees.size > 0
          true
        else
        end
      end
    end
  end

  # Assign customer role if user is a Customer
  def customer?
    
    customers = Customer.where(email_company_contact: email)
    #customer_id = Customer.find()
    if customers.size > 0
      true
    else
    end
  end

  # Assign a technician role
  def technician?
    if Employee.where(email: email).take != nil
      if Employee.where(email: email).take[:title] == "technician"
        true
      end
    end
  end


end
