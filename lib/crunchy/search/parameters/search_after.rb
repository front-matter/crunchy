require 'crunchy/search/parameters/storage'

module Crunchy
  module Search
    class Parameters
      # Almost standard array storage without any typecasting.
      # The value is simply replaced on update.
      #
      # @see Crunchy::Search::Request#search_after
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/5.4/search-request-search-after.html
      class SearchAfter < Storage
      private

        def normalize(value)
          Array.wrap(value) if value
        end
      end
    end
  end
end
