class StatsController < ApplicationController
	before_filter :isAdmin, :only => [:edit_stats_list_size]

	def self.get_stats_prefs
		stats_prefs = User.current.pref[:stats]
		return stats_prefs.nil? ? @@DEFAULT_ATTRS : stats_prefs
	end

	def update_stats
		set_locals
		get_stats_list
		respond_to { |format| format.js }
	end

	def edit_stats_list_size
		@current_page = WikiPage.find(params[:p])
		@list_size = params[:new_list_size]
		@current_page.wiki.stats_list_size = @list_size
		@current_page.wiki.save
		redirect_to :back
	end
	
	def get_stats_list(page = @page, attrs = @attrs, list_size = @list_size)
		act = @@ACT_IDX[attrs[:act]]
		crit = @@CRIT_IDX[attrs[:crit]]

		user_column = @@QUERY_PARAMS[:user_id][act]
		value_column = @@QUERY_PARAMS[:value][act][crit]

		list_tmp = get_query_model(act).find 	:all,
							:select => get_query_select(act, crit),
							:conditions => get_query_conditions(page, act),
							:group => user_column,
							:order => value_column + " DESC",
							:limit => list_size

		@list = Array.new(list_tmp.size) { |i| {:user_id => list_tmp[i].send(user_column),
							:user => list_tmp[i].send(user_column[0..user_column.length - 4]),
							:value => (value_format list_tmp[i].send(value_column)) } }
		return @list
	end

private
	@@QUERY_PARAMS = {	:user_id => ["author_id", "user_id", "user_id"],
				:func => [	["count", "max"],
						["", ""],
						["count", "max"] ],
				:to_count => [	["*", "updated_on"],
						["views", "last_view"],
						["*", "created_at"] ],
				:value => [	["version", "updated_on"],
						["views", "last_view"],
						["version_id", "created_at"] ]
			}

	@@ACT_IDX = {"E" => 0, "R" => 1, "C" => 2}
	@@CRIT_IDX = {"+" => 0, "+R" => 1}

	@@DEFAULT_ATTRS = {:act => "E", :crit => "+"}

	def set_locals
		@page = WikiPage.find(params[:page])
		@user_prefs = User.current.pref
		@attrs = @user_prefs[:stats]
		@list_size = @page.wiki.stats_list_size

		if @attrs.nil? || params[:st_act] || params[:st_crit]
			update_user_preferences(params[:st_act], params[:st_crit])
		end
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

	def get_query_conditions(page, act)
		return [["page_id = ? AND version <> 1", page.id],
				{:wiki_page_id => page.id},
				["wiki_page_id = ? AND version_deleted IS NULL", page.id]][act]
	end

	def get_query_select(act, crit)
		return @@QUERY_PARAMS[:user_id][act] + ", " + @@QUERY_PARAMS[:func][act][crit] +
			"(" + @@QUERY_PARAMS[:to_count][act][crit] + ") as " + @@QUERY_PARAMS[:value][act][crit]
	end

	def get_query_model(act)
		return [WikiContent::Version, PageView, PageComment][act]
	end

	def value_format(value)
		return value.to_i if value.class == String
		return value if value.class != Time

		if value.to_date == Date.today
			return value.strftime "%H:%M"
		elsif value.year == Date.today.year
			return value.strftime "%d %b"
		else
			return value.strftime "%d %b %Y"
		end
	end

	def isAdmin
		render_404 unless User.current.admin
	end
end

