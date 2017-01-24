require_relative '../../app/models/study_datasets'

module Barebones
  module V1
    class Ping < Grape::API
      format :json
      get '/ping' do
        puts "\n DB: #{DB.inspect}"
        study_datasets = DB[:study_datasets]
        puts "\n all: #{study_datasets.all}"
        { ping: study_datasets.all }
      end
    end
  end
end