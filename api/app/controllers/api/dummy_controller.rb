module Api 
  class DummyController < ApplicationController
    def test 
      sample_data = {
        "first_name" => "test first",
        "last_name" => "test last"
      }

      render json: {status: 'SUCCESS', msg: 'Loaded test data', data: sample_data}, status: :ok
    end
  end
end