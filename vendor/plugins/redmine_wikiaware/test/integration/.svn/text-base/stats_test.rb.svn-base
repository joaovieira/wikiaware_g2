require File.dirname(__FILE__) + '/../test_helper'

class StatsTest < ActionController::IntegrationTest
	fixtures :users, :projects
	fixtures :enabled_modules, :members, :member_roles, :roles
	fixtures :wikis, :wiki_pages, :wiki_contents, :wiki_content_versions

	def setup
		@request = ActionController::TestRequest.new
		@response = ActionController::TestResponse.new
		User.current = nil
		
		@users = Array.new(3) { |i| User.find(i+1) }	# users 1, 2 e 3
		@page = WikiPage.find(5)	# pagina sem qualquer edicao
									# todos os users acima tem permissoes aqui
		
		@stats = StatsController.new		# controlador para obtancao de estatisticas
	end


	def test_us06pta01
	#	_test_most "_edit_page", "E"
	end
	
	def test_us06pta02
		_test_most "_read_page", "R"
	end
	
	def test_us06pta03
		_test_most "_comment_page", "C"
	end
	
	def test_us06pta04
	#	_test_most_recently "_edit_page", "E"
	end
	
	def test_us06pta05
		_test_most_recently "_read_page", "R"
	end
	
	def test_us06pta06
		_test_most_recently "_comment_page", "C"
	end
	
	def test_us06pta07
		_test_stats_list_size
	end
	
private
	def _read_page
		get '/projects/ecookbook/wiki/Child_1'
		assert_response :success
	end
	
	def _edit_page
		version = @page.content.version
		post '/projects/ecookbook/wiki/Child_1/edit',
				'content' => {'comments' => '', 'text' => ('editada' + version.to_s), 'version' => version},
				'attachments' => {'1' => {'description' => ''}},
				'wiki_page' => {'commentable' => 1}
	

		assert_redirected_to '/projects/ecookbook/wiki/Child_1'
		assert_equal (version + 1), @page.content.version
		
	end
	
	def _comment_page
		post '/wiki_page/' + @page.id.to_s + '/page_comments',
				'content_text' => 'comment'
	end
	
	def _test_most(func, act)		
		for i in 3.downto(1) do
			user = @users[i-1]
			post "/login", :username => user.name(:username), :password => user.name(:username)
			assert_equal user, User.current
		
			i.times do |n|
				eval(func)
			end
		end
		
		list = @stats.get_stats_list(@page, {:act => act, :crit => "+"}, 3)	
		for i in 0..2 do
			user = @users[2-i]
			assert_equal(user.id, list[i][:user_id])
			assert_equal(3-i, list[i][:value])
		end
	end
	
	def _test_most_recently(func, act)	
		@users.each do |user|
			post "/login", :username => user.name(:username), :password => user.name(:username)
			assert_equal user, User.current

			eval(func)
			sleep 1
		end

		list = @stats.get_stats_list(@page, {:act => act, :crit => "+R"}, 3)
		for i in 0..2 do
			user = @users[2-i]
			assert_equal(user.id, list[i][:user_id])
		end
	end
	
	def _test_stats_list_size
		admin = @users[0]
		
		post "/login", :username => admin.name(:username), :password => admin.name(:username)
		assert_equal admin, User.current

		post '/stats/edit_stats_list_size', :p => @page.id, :new_list_size => 1
		
		stats_size = @page.wiki.stats_list_size
		assert_equal stats_size, 1
	end
end
