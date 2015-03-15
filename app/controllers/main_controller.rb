require 'uri'

class MainController < ApplicationController
	@@root_url = "http://syurl.net/"

	def index
		
	end

	def convert
		@user_input = params[:long_url]
		uri = URI(@user_input)
		if !URI.scheme_list[uri.scheme.upcase]
			@user_input = "http://" + @user_input
		end
		m = Mapping.create!(:url => @user_input)
		@short_url = @@root_url + Base62.to_base62(m.id)
		@show_result = true
		render 'index'
	end

	def do_redirect
		long_url = Mapping.find_by_id(Base62.to_base10(params[:short_url]))
		if long_url
			redirect_to long_url.url
			return	
		end
		@not_found = true
		render 'index' 
	end
end
