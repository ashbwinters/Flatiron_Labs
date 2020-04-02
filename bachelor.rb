require 'pry'

def get_first_name_of_season_winner(data, season)
  winning_lady = data[season].find { |lady| lady['status'] == "Winner" }
  winning_lady["name"].split.first
end

def get_all_the_ladies data
  ladies = []

  data.each do |season|
    binding.pry
    season[1].each do |lady|
      ladies << lady
    end
  end
  ladies
end

def get_contestant_name(data, occupation)
  ladies_info = get_all_the_ladies data
  whos_that_lady = ladies_info.find { |her_info| her_info['occupation'] == occupation }
  whos_that_lady['name']
end

def count_contestants_by_hometown(data, hometown)
  ladies_info = get_all_the_ladies data
  how_many_are_from_there = ladies_info.select { |her_info| her_info['hometown'] == hometown}
  how_many_are_from_there.length  
end

def get_occupation(data, hometown)
  ladies_info = get_all_the_ladies data
  what_does_she_do = ladies_info.find { |her_info| her_info['hometown'] == hometown}
  what_does_she_do['occupation']
end

def get_average_age_for_season(data, season)
  total_age = 0 
  data[season].each do |lady|
    total_age += lady['age'].to_i
  end
  (total_age.to_f / (data[season].length)).round
end
