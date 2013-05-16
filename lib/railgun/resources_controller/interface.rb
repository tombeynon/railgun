module Railgun
	class ResourcesController < RailgunController
		
		module Interface
		
			def self.included(base)
	    	base.extend(ClassMethods)
				base.instance_eval do
				
					before_filter :prepare_layout
					helper 'railgun/resource'
					
					helper_method :columns
					helper_method :viewable_columns
					helper_method :editable_columns
					
				end
	    end
	  
		  module ClassMethods
		  	
		  end
		  
		protected
		
			def columns
				@columns ||= railgun_resource.columns
			end
		
			def viewable_columns
				@viewable_columns ||= railgun_resource.viewable_columns
			end
			
			def editable_columns
				@editable_columns ||= railgun_resource.editable_columns
			end
		  
		private
		
			def prepare_layout
				if railgun_resource.nil? 
					raise "Not found" # Should be not_found
				end
				Railgun.interface.add_crumb(:title => railgun_resource.name.pluralize, :path => [railgun_resource.resource_class])
			end
			
		end
	end
end