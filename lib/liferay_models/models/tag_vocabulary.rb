module Liferay

  class TagVocabulary < Base
    set_table_name :tagsvocabulary
    set_primary_key :vocabularyid
    
    belongs_to :user, :foreign_key => "userid"
    
    # Constructor    
    def initialize(params = {})
      super(params)
      fill_default_values
    end
    
    # Methods
    
    # Class Methods
    
    def self.class_name
      'com.liferay.portlet.tags.model.TagsVocabulary'
    end
    
    # Private methods
    #
    private 
    
    def fill_default_values
    end
    
  end
    
end







