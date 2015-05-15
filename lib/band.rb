class Band < ActiveRecord::Base
  has_and_belongs_to_many:venues
  validates(:description, :presence => true)
  before_save(:capitalize_name)

  private
  
  define_method(:capitalize_name) do
    self.description=(description().titleize())
  end

end
