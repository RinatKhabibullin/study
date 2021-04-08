module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce { |acc, el| acc > el ? acc : el }
        array.map { |el| el.positive? ? max : el }
      end

      def search(array, query)
        compared_element_index = (array.length - 1) / 2
        if array[compared_element_index] == query
          compared_element_index
        elsif array.length == 1 || array[compared_element_index].nil?
          -1
        elsif array[compared_element_index] > query
          search(array[0, compared_element_index], query)
        elsif array[compared_element_index] < query
          nextstep = search(array[compared_element_index + 1, array.length - 1], query)
          nextstep == -1 ? -1 : compared_element_index + 1 + nextstep
        else
          -1
        end
      end
    end
  end
end
