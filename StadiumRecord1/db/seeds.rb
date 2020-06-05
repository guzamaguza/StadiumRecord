
@stadiums = {
  "Angel_Stadium" => {
    :name => "Angel Stadium",
    :location => "Anaheim CA",
    :team => "Angels"
  },
  "Busch_Stadium" => {
    :name => "Busch Stadium",
    :location => "St Louis MO",
    :team => "Cardinals"
  },
  "Chase_Field" => {
    :name => "Chase Field",
    :location => "Phoenix AZ",
    :team => "Diamondbacks"
  },
  "Citi_Field" => {
    :name => "Citi Field",
    :location => "Queens NY",
    :team => "Mets"
  },
  "Citizens_Bank_Park" => {
    :name => "Citizens Bank Park",
    :location => "Philadelphia PA",
    :team => "Phillies"
  },
  "Comerica_Park" => {
    :name => "Comerica Park",
    :location => "Detroit MI",
    :team => "Tigers"
  },
  "Coors_Field" => {
    :name => "Coors Field",
    :location => "Denver CO",
    :team => "Rockies"
  },
  "Dodger_Stadium" => {
    :name => "Dodger Stadium",
    :location => "Los Angeles CA",
    :team => "Dodgers"
  },
  "Fenway_Park" => {
    :name => "Fenway Park",
    :location => "Boston MA",
    :team => "Red Sox"
  },
  "Globe_Life_Field" => {
    :name => "Globe Life Field",
    :location => "Arlington TX",
    :team => "Rangers"
  },
  "Great_American_Ball_Park" => {
    :name => "Great American Ball Park",
    :location => "Cincinnati OH",
    :team => "Reds"
  },
  "Guaranteed_Rate_Field" => {
    :name => "Guaranteed Rate Field",
    :location => "Chicago IL",
    :team => "White Sox"
  },
  "Kauffman_Stadium" => {
    :name => "Kauffman Stadium",
    :location => "Kansas City MO",
    :team => "Royals"
  },
  "Marlins_Park" => {
    :name => "Marlins Park",
    :location => "Miami FL",
    :team => "Marlins"
  },
  "Miller_Park" => {
    :name => "Miller Park",
    :location => "Milwaukee WI",
    :team => "Brewers"
  },
  "Minute_Maid_Park" => {
    :name => "Minute Maid Park",
    :location => "Houston TX",
    :team => "Astros"
  },
  "Nationals_Park" => {
    :name => "Nationals Park",
    :location => "Washington DC",
    :team => "Nationals"
  },
  "Oakland_Coliseum" => {
    :name => "Oakland Coliseum",
    :location => "Oakland CA",
    :team => "Athletics"
  },
  "Oracle_Park" => {
    :name => "Oracle Park",
    :location => "San Francisco CA",
    :team => "Giants"
  },
  "Oriole_Park_at_Camden_Yards" => {
    :name => "Oriole Park at Camden Yards",
    :location => "Baltimore MD",
    :team => "Orioles"
  },
  "Petco_Park" => {
    :name => "Petco Park",
    :location => "San Diego CA",
    :team => "Padres"
  },
  "PNC_Park" => {
    :name => "PNC Park",
    :location => "Pittsburgh PA",
    :team => "Pirates"
  },
  "Progressive_Field" => {
    :name => "Progressive Field",
    :location => "Cleveland OH",
    :team => "Indians"
  },
  "Rogers_Centre" => {
    :name => "Rogers Centre",
    :location => "Toronto Ontario",
    :team => "Blue Jays"
  },
  "T-Mobile_Park" => {
    :name => "T-Mobile Park",
    :location => "Seattle WA",
    :team => "Mariners"
  },
  "Target_Field" => {
    :name => "Target Field",
    :location => "Minneapolis MN",
    :team => "Twins"
  },
  "Tropicana_Field" => {
    :name => "Tropicana Field",
    :location => "St Petersburg FL",
    :team => "Rays"
  },
  "Truist_Park" => {
    :name => "Truist Park",
    :location => "Cumberland GA",
    :team => "Braves"
  },
  "Wrigley_Field" => {
    :name => "Wrigley Field",
    :location => "Chicago IL",
    :team => "Cubs"
  },
  "Yankee_Stadium" => {
    :name => "Yankee Stadium",
    :location => "Bronx NY",
    :team => "Yankees"
  }
}

@stadiums.each do |stadium, stadium_hash|
  p = Stadium.new
  p.name = stadium
  stadium_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end
