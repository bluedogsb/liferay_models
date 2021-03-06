module Liferay

  # Attributes:
  #   String: name
  #   Integer: currentid
  #
  class Counter < ActiveRecord::Base
    set_table_name :counter
    set_primary_key :name

    def self.class_name
      'com.liferay.counter.model.Counter'
    end

    # Increment the Counter table and return the id
    #
    def self.increment_id
			nextid = nil
			
			# Make all the operations in a single transaction with lock to prevent
			# that another user read the same value as the first caller of this method.
			#
			#--
			# Cria uma transacao atomica para que o valor do counter nao seja lido
			# antes de ser atualizado, ocasionando em ids repetidos.
			#
			Counter.transaction do
			  begin
			    # throws ActiveRecord::RecordNotFound if not found
    			counter = Counter.find(Counter.class_name, :lock => true)
    			
				  nextid = counter.currentid
				  counter.currentid += 1
				  counter.save
				
				rescue ActiveRecord::RecordNotFound
				  nextid = 1
				  counter = Counter.new(:currentid => 2)
				  counter.name = Counter.class_name
				  counter.save
				end
			end
			
			nextid
		end

  end
end
