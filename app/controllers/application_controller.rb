class ApplicationController < ActionController::Base
	require "nokogiri"
	require "open-uri"
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  prepend_before_filter :authenticate_user!

	def g5_profile
		img_and_name = []
		page = Nokogiri::HTML(open('http://www.getg5.com/about/g5-team/'))
		page.css("div.row.team-directory li").each do |elem|
			next if elem.children[1].children[1].attributes["src"].value.include?("avatar-")
			img_and_name << [elem.children[1].children[3].children[0].children.text, elem.children[1].children[1].attributes["src"].value]
		end
		img_and_name
	end

	def find_g5_image(fname, lname)
		full_name = "#{fname} " + "#{lname}"
		name_list = g5_profile
		profile_image = ""
		name_list.each do |name|
			if name[0] == full_name
				profile_image = name[1]
			end
		end
		profile_image
	end
end
