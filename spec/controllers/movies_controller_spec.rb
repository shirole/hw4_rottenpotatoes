require 'spec_helper'

describe MoviesController do

	describe 'Find Similar Movies' do
	   it 'should call the Model method that finds similar movies' do
	   	  m1 = mock(:id => '1', :director => "Ridley")
	   	  m2 = mock(:id => '2', :director => "Ridley")

	   	  Movie.should_receive(:find_by_id).with(m1.id).and_return(m1)
	   	  Movie.should_receive(:find_all_by_director).with(m1.director).and_return(m2)
	   	  post :similar, {:id => 1}
	   	end
	end

	describe 'delete a movie' do
		it 'should find and destroy the movie by calling the model method' do
      		fake_result = mock('Movie', :id => 5, :title => "Fake movie")
      		Movie.should_receive(:find).with('5').and_return(fake_result)
      		fake_result.should_receive(:destroy)
      		delete :destroy, :id => "5"
    	end
 	end
end