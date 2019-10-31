# Location by IP

## Overview

This is a small Ruby on Rails application built to find location information for a given IP address using the [AccuWeather service](https://developer.accuweather.com/).

## Setup

1. Clone the repo from GitHub: ```$ git clone git@github.com:csvlewis/location-by-ip.git```

2. Enter the newly cloned repo: ```$ cd location-by-ip/```

3. Run bundle to download any necessary Ruby gems: ```$ bundle```

4. I kept the AccuWeather API key that I used out of the code I pushed to GitHub using the [figaro](https://github.com/laserlemon/figaro) gem to avoid the key being published publicly. Because of this, the application will run into an error if you do not add your own AccuWeather API key. To do so, you can either run ```$ bundle exec figaro install```, which will create a file called `/config/application.yml` and add it to your `.gitignore`. You can then add the line: `accuweather_key: 'your_API_key_goes_here'` inside of the new `application.yml` file. Otherwise, you can simply go to the file `/app/services/accuweather_service.rb` and replace `ENV['accuweather_key']` on line 4 with your AccuWeather API key as a string.

5. Once you have added your API key, you can start the server locally with ```$ rails s```

6. You can then go to http://localhost:3000/locationByIp?ip= followed by an ip address (ex. 76.25.168.96) and JSON information about the location will be displayed on the page.

7. To run the test suite, you can use the command ```$ bundle exec rspec```, which will run the test suite and log the results to the console.

## File Summary

### /app/config/routes.rb

This file contains the route that sends users to the search controller.

### /app/controllers/search_controller.rb

This file contains the controller action that creates a new instace of the AccuWeatherService class and runs the .get_location_by_ip method which is rendered as JSON in the browser. I did not use a view to display the information because I wanted to keep things as simple as possible.

### /app/services/accuweather_service.rb

This file contains the majority of the logic for accessing the AccuWeather service and returning the necessary information. The .get_location_by_ip method uses the [faraday](https://lostisland.github.io/faraday/) gem to make an HTTP connection to AccuWeather, passing my API key (which is hidden using an environment variable) and the desired IP address. It then takes the JSON response and passes it to a helper method called .format, which formats the information into the desired output. That output is then returned and displayed in the controller.

### /spec/features/location_by_ip_spec.rb

This file contains the tests that I created for this project. Testing is pretty minimal at the moment, as I decided to focus on just integration testing to make sure the whole application is working as intended for the sake of time and simplicity. The test visits two different addresses and tests to make sure the proper location information is displayed in the browser. If I were to expand this test suite, I would add more unit tests to test smaller pieces of functionality such as the .format instance method in the AccuWeatherService class.

### Gems Used

- [rspec-rails](https://github.com/rspec/rspec-rails)
- [pry](https://github.com/pry/pry)
- [faraday](https://github.com/lostisland/faraday)
- [capybara](https://github.com/teamcapybara/capybara)
- [figaro](https://github.com/rspec/rspec-rails)

### Author Information

- Linkedin: https://www.linkedin.com/in/csvlewis/
- GitHub: https://github.com/csvlewis
- Portfolio: https://alumni.turing.io/alumni/christopher-lewis
