module Exercise
  module Fp2
    class MyArray < Array
      def my_each(&func)
        first_element, *rest_elements = self
        rest_elements = MyArray.new(rest_elements)
        func.call(first_element)
        if rest_elements.empty?
          first_element
        else
          [first_element, *rest_elements.my_each(&func)]
        end
      end

      def my_map(&func)
        handler = ->(acc, el) { MyArray.new([*acc, func.call(el)]) }
        my_reduce([], &handler)
      end

      def my_compact
        handler = ->(acc, el) { el.nil? ? acc : MyArray.new([*acc, el]) }
        my_reduce([], &handler)
      end

      def my_reduce(acc = nil, &func)
        first_element, *rest_elements = self
        rest_elements = MyArray.new(rest_elements)
        if rest_elements.empty?
          func.call(acc, first_element)
        else
          acc = acc.nil? ? first_element : func.call(acc, first_element)
          rest_elements.my_reduce(acc, &func)
        end
      end
    end
  end
end
