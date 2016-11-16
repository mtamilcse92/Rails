
require 'rails_helper'

describe RegisterSchoolsController, type: :controller do 
	it "do some thing" do
		reg =RegisterSchool.create(school_name:'foo')
		get :index
		expect(response).to render_template('index')
	end
end
