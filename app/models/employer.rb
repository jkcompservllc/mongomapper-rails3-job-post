class Employer
  include MongoMapper::Document         

  key :name, :presence => true, :length => { :minimum => 3 }
  # add Google map?
  key :location, String
  key :phone_number, String
  key :link, String
  key :email, String
  # add picture of the restaurant?

# Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::
  # Great website for validations:
  # http://api.rubyonrails.org/classes/ActiveModel/Validations/HelperMethods.html
  # http://guides.rubyonrails.org/v3.2.13/active_record_validations_callbacks.html#displaying-validation-errors-in-the-view
 validates_presence_of :name

 validates_uniqueness_of :name


# Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
 many :jobs
end
