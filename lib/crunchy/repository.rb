module Crunchy
  class Repository
    include Singleton

    attr_reader :analyzers, :tokenizers, :filters, :char_filters

    def self.delegated
      public_instance_methods - superclass.public_instance_methods - Singleton.public_instance_methods
    end

    def self.repository(name)
      plural_name = name.to_s.pluralize

      class_eval <<-METHOD, __FILE__, __LINE__ + 1
        def #{name}(name, options = nil)
          options ? #{plural_name}[name.to_sym] = options : #{plural_name}[name.to_sym]
        end
      METHOD
    end

    # Analysers repository:
    #
    #   Crunchy.analyzer :my_analyzer2, {
    #     type: custom,
    #     tokenizer: 'my_tokenizer1',
    #     filter : ['my_token_filter1', 'my_token_filter2']
    #     char_filter : ['my_html']
    #   }
    #   Crunchy.analyzer(:my_analyzer2) # => {type: 'custom', tokenizer: ...}
    #
    repository :analyzer

    # Tokenizers repository:
    #
    #   Crunchy.tokenizer :my_tokenizer1, {type: standard, max_token_length: 900}
    #   Crunchy.tokenizer(:my_tokenizer1) # => {type: standard, max_token_length: 900}
    #
    repository :tokenizer

    # Token filters repository:
    #
    #   Crunchy.filter :my_token_filter1, {type: stop, stopwords: [stop1, stop2, stop3, stop4]}
    #   Crunchy.filter(:my_token_filter1) # => {type: stop, stopwords: [stop1, stop2, stop3, stop4]}
    #
    repository :filter

    # Char filters repository:
    #
    #   Crunchy.char_filter :my_html, {type: html_strip, escaped_tags: [xxx, yyy], read_ahead: 1024}
    #   Crunchy.char_filter(:my_html) # => {type: html_strip, escaped_tags: [xxx, yyy], read_ahead: 1024}
    #
    repository :char_filter

    def initialize
      @analyzers = {}
      @tokenizers = {}
      @filters = {}
      @char_filters = {}
    end
  end
end
