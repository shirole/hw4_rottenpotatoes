require 'spec_helper'

describe Movie do
	
  it 'Movie should receive find method and return movies' do
	   m = mock('Movie',:director=>"Lucas",:title=>'test')
	   Movie.should_receive(:where).with("director = ?", "Lucas").and_return(m)
	   Movie.find_all_by_director("Lucas")	  
  end 

end
