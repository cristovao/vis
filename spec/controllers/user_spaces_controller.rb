require 'spec_helper'

describe UserSpacesController do
  context "GET participation" do
    context "when format is NOT json" do
      before do
        @params = { :users_id => ["1"," 2"],
                    :space_id => 1,
                    :date_start => "2012-02-10",
                    :date_end => "2012-02-11",
                    :format => :html,
                    :locale => "pt-BR" }
      end

      it "should return status code 406" do
        get :participation, @params

        response.status.should eq(406)
      end

      it "should return any data" do
        get :participation, @params

        response.body.should eq(" ")
      end
    end

    context "when format is json" do
      before do
        @params = { :users_id => ["1"," 2"],
                    :space_id => 1,
                    :date_start => "2012-02-10",
                    :date_end => "2012-02-11",
                    :format => :json,
                    :locale => "pt-BR" }
      end

      it "should return status code 200" do
        get :participation, @params

        response.status.should eq(200)
      end

      it "should have 'users_participation as a key'" do
        get :participation, @params
        body = JSON.parse(response.body)

        body.should have_key("users_participation")
      end
    end
  end
end
