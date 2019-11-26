module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |item| item.positive? ? max : item }
      end

      def search(array, query)
        return -1 if array.empty?

        iter = lambda do |start, finish|
          if start == finish
            return array[start] == query ? start : -1
          end

          center = (start + finish) / 2
          center_element = array[center]

          if query > center_element
            iter.call(center + 1, finish)
          elsif query < center_element
            iter.call(start, center - 1)
          else
            center
          end
        end

        iter.call(0, array.size - 1)
      end
    end
  end
end
