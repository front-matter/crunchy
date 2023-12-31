require 'crunchy/search/parameters/storage'

module Crunchy
  module Search
    class Parameters
      # Just a standard boolean storage, nothing to see here.
      #
      # @see Crunchy::Search::Parameters::BoolStorage
      # @see Crunchy::Search::Request#track_total_hits
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/search-your-data.html#track-total-hits
      class TrackTotalHits < Storage
        include BoolStorage
      end
    end
  end
end
