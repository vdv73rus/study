module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for item in self
          yield(item)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new

        for item in self
          result << yield(item)
        end

        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new

        for item in self
          result << item unless item.nil?
        end

        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        head, *tail = self

        source = acc.nil? ? tail : self
        acc = acc.nil? ? head : acc

        for item in source
          acc = yield(acc, item)
        end

        acc
      end
    end
  end
end
