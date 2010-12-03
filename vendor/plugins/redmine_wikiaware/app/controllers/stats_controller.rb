class StatsController < ActionController::Base
	#before_filter :authorize(:wiki, :index)

	@list_size = 3

	def self.get_stats_prefs
		stats_prefs = User.current.pref[:stats]
		return stats_prefs.nil? ? @@DEFAULT_ATTRS : stats_prefs
	end

	def update_stats
		set_locals
		get_stats_list
		respond_to { |format| format.js }
	end
	
private
	@@QUERY_PARAMS = {	:user_id => ["author_id", "- TODO -", "user_id"],
				:func => ["count", "max"],
				:to_count => [	["*", "updated_on"],
						["- TODO -", "- TODO -"],
						["*", "created_at"] ],
				:value => [	["version", "updated_on"],
						["- TODO -", "- TODO -"],
						["version_id", "created_at"] ]
			}

	@@ACT_IDX = {"E" => 0, "R" => 1, "C" => 2}
	@@CRIT_IDX = {"+" => 0, "+R" => 1}
	
	@@DEFAULT_ATTRS = {:act => "E", :crit => "+"}

	def set_locals
		@page = WikiPage.find(params[:page])
		@user_prefs = User.current.pref
		@attrs = @user_prefs[:stats]

		if @attrs.nil? || params[:st_act] || params[:st_crit]
			update_user_preferences(params[:st_act], params[:st_crit])
		end
	end
	
	def get_stats_list
		#unless params[:st_act] || params[:st_crit]
		#	return false
		#end

		act = @@ACT_IDX[@attrs[:act]]
		crit = @@CRIT_IDX[@attrs[:crit]]

		user_column = @@QUERY_PARAMS[:user_id][act]
		value_column = @@QUERY_PARAMS[:value][act][crit]

		list_tmp = get_query_model(act).find 	:all,
							:conditions => get_query_conditions(act),
							:select => get_query_select(act, crit),
							:group => user_column,
							:order => value_column + " DESC",
							:limit => @list_size
										
		@list = Array.new(list_tmp.size) { |i| {:user => list_tmp[i].send(user_column[0..user_column.length - 4]),
							:value => (value_format list_tmp[i].send(value_column)) } }
		return true
	end

	def update_user_preferences(act = nil, crit = nil)
		if @attrs.nil?
			@attrs = @@DEFAULT_ATTRS
		end
		@attrs[:act] = act unless act.nil?
		@attrs[:crit] = crit unless crit.nil?
		@user_prefs[:stats] = @attrs
		@user_prefs.save
	end

	def get_query_conditions(act)
		return [["page_id = ? AND version <> 1", @page.id],
				{},
				{:wiki_page_id => @page.id, :version_id => @page.content.version}][act]
	end

	def get_query_select(act, crit)
		return @@QUERY_PARAMS[:user_id][act] + ", " + @@QUERY_PARAMS[:func][crit] +
			"(" + @@QUERY_PARAMS[:to_count][act][crit] + ") as " + @@QUERY_PARAMS[:value][act][crit]
	end

	def get_query_model(act)
		return [WikiContent::Version, nil, PageComment][act]
	end

	def value_format(value)
		return value if value.class != Time

		if value.to_date == Date.today
			return value.strftime "%H:%M"
		elsif value.year == Date.today.year
			return value.strftime "%d %b"
		else
			return value.strftime "%d %b %Y"
		end
	end
end
