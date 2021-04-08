module Exercise
  module Fp
    class << self
      def rating(array)
        ratings = array.reduce([]) { |acc, el| el['country'].nil? || el['country'].split(',').length < 2 ? acc : [*acc, el] }
                       .reduce([]) { |acc, el| el['rating_kinopoisk'].to_f.nil? || el['rating_kinopoisk'].to_f.zero? ? acc : [*acc, el] }
                       .map { |el| el['rating_kinopoisk'].to_f }

        sum = ratings.reduce(:+)
        sum / ratings.length
      end

      def chars_count(films, threshold)
        films.reduce([]) { |acc, el| el['rating_kinopoisk'].to_f.nil? || el['rating_kinopoisk'].to_f >= threshold ? [*acc, el] : acc }
             .map { |el| el['name'] }
             .reduce(0) { |acc, el| acc + el.count('и') }
      end
    end
  end
end
