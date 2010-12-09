module WikiawarePatch

	module User
		def self.included(base)
		  base.class_eval do
			unloadable
		    has_many :page_comments
		    has_many :section_comments
		    has_many :page_ratings
      	has_many :wiki_pages, :through => :page_ratings
      	has_many :posts, :class_name => 'Post'
        has_many :friendships
        has_many :friends, :through => :friendships, :conditions => ["friendships.accepted = ? AND friendships.blocked = ?", true, false]
        has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
        has_many :inverse_friends, :through => :inverse_friendships, :source => :user
        has_many :subscriptions

		    def self.search(search)
          if search
            find(:all, :conditions => ['login LIKE ? OR firstname LIKE ? OR mail LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
          end
        end
		  end
		end
	end

	module WikiPage
		def self.included(base)
		    base.class_eval do
		        unloadable
		        has_many :page_comments, :class_name => 'PageComment'
		        has_many :page_ratings
            has_many :users, :through => :page_ratings
            has_many :sections, :class_name => 'WikiSection', :foreign_key => 'page_id'
            # grupo 5
            has_many :subscriptions
            # / grupo 5
		#grupo 2
		def is_commentable?
  		    	return commentable
  		    end

  		    def was_ever_commentable?
  			return was_ever_commentable
  		    end
		# / grupo 2
		    end # base.class_eval
		end # self.included
	end

	module WikiHelper
		def self.included(base)
		  base.class_eval do
		    unloadable
		    def hinted_text_area_tag(name, value = nil, hint = "Click and enter text", options={})
    			value = value.nil? ? hint : value
    			options[:class] = 'empty'
    			text_area_tag name, value, {:onclick => "if($(this).value == '#{hint}'){$(this).value = ''; $(this).className='';}", :onblur => "if($(this).value == ''){$(this).value = '#{hint}'; $(this).className='empty';}" }.update(options.stringify_keys)
  		    end
		  end
		end
	end
end


