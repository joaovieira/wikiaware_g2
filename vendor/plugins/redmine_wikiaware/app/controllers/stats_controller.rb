class StatsController < ActionController::Base
	before_filter :set_locals, :get_stats_list
	#before_filter :authorize(:wiki, :index)

	def update_stats
		get_editors unless @list
		respond_to { |format| format.js }
	end
	
private
	def set_locals
		@page = WikiPage.find(params[:page])
	end
	
	def get_stats_list
		if params[:st_act] == "E"
			get_editors
		elsif params[:st_act] == "R"
			get_readers
		elsif params[:st_act] == "C"
			get_commenters
		end
	end
	
	def get_editors
		@st_act = "E"
		set_most_frequent_editors
	end
	
	def get_readers
		@st_act = "R"
		@list = []
	end
	
	def get_commenters
		@st_act = "C"
		set_most_frequent_commenters
	end

	def set_most_frequent_editors(num = 3)
		list_tmp = WikiContent::Version.find 	:all,
											:conditions => {:page_id => @page.id},
											:select => "author_id, count(id) as version",
											:group => "author_id",
											:order => "version DESC",
											:limit => num
											
		@list = Array.new(list_tmp.size) { |i| {:user => list_tmp[i].author, :value => list_tmp[i].version} }
	end
	
	def set_most_frequent_commenters(num = 3)
		list_tmp = PageComment.find 	:all,
										:conditions => {:wiki_page_id => @page.id, :version_id => @page.content.version},
										:select => "user_id, count(id) as version_id",
										:group => "user_id",
										:order => "version_id DESC",
										:limit => num
										
		@list = Array.new(list_tmp.size) { |i| {:user => list_tmp[i].user, :value => list_tmp[i].version_id} }
	end	
end
