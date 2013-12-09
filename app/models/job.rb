class Job
  include MongoMapper::Document         

  #keys
  key :title
  key :job_description, String
  #look at money gem for decimals not integer
  key :pay, Integer
  # If we just want to validate numeric:
  # key :age, Integer, :numeric => true
  key :age, Integer
  key :required_experience, String
  key :hours_needed, String
  key :benefits, String
  key :employer_id, ObjectId
  
# Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::
 validates_presence_of :title
  validates_presence_of :age
  # The code below checks to see if the job title already exists for the employer.
  #  We can add the same job title for 2 different employers.
 validates_uniqueness_of :title, :scope => :employer_id
  validates_numericality_of :age, greater_than: 15
# Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
 belongs_to :employer

# Callbacks ::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# before_create :your_model_method
# after_create :your_model_method
# before_update :your_model_method 

# Attribute options extras ::::::::::::::::::::::::::::::::::::::::
# attr_accessible :first_name, :last_name, :email

# Validations
# key :name, :required =>  true      

# Defaults
# key :done, :default => false

# Typecast
# key :user_ids, Array, :typecast => 'ObjectId'     
end
