module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        result = { scores: 0, count: 0 }

        take_film = lambda do |acc, film|
          if film_in_rating?(film)
            acc[:scores] += film['rating_kinopoisk'].to_f
            acc[:count] += 1
          end
          acc
        end

        films.reduce(result, &take_film)

        if result[:count].zero?
          puts 'There are no films that matched the selected criteria'
        else
          result[:scores] / result[:count]
        end
      end

      def film_in_rating?(film)
        rating = film['rating_kinopoisk']
        return false if rating.nil? || rating.to_f.zero?

        film_has_two_or_more_countries?(film)
      end

      def film_has_two_or_more_countries?(film)
        country = film['country']
        return false if country.nil?

        total_countries = country.split(',').length
        total_countries >= 2
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
