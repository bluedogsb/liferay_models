require 'spec_helper'

describe TagVocabulary do
  
  before (:each) do
    ClassName.new(:value => TagVocabulary.class_name).save!
    ClassName.find_tag_vocabulary.should_not be_nil
    
    ClassName.new(:value => User.class_name).save!
    ClassName.find_user.should_not be_nil
  end
  
  it 'should be saved' do
    user = create_user(:firstname => 'Túlio')
  	user.save.should be_true
  	
  	group = create_group(user)
  	group.save.should be_true
  	
  	user.groups << group
  	user.save.should be_true
  	
  	vocabulary = create_tag_vocabulary(user)
  	vocabulary.save.should be_true
  end
    
end