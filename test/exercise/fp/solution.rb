module Exercise
  module Fp
    class << self
      def rating(array)
        ratings = array.reject { |el| el['country'].nil? || el['country'].split(',').length < 2 }
                       .reject { |el| el['rating_kinopoisk'].to_f.nil? || el['rating_kinopoisk'].to_f.zero? }
                       .map { |el| el['rating_kinopoisk'].to_f }
        sum = ratings.reduce(:+)
        sum / ratings.length
      end

      def chars_count(films, threshold)
        films.select { |el| el['rating_kinopoisk'].to_f.nil? || el['rating_kinopoisk'].to_f >= threshold }
             .map { |el| el['name'] }
             .reduce(0) { |acc, el| acc + el.count('и') }
      end
    end
  end
end
