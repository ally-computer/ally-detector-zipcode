require 'ally/detector'
require 'ally/detector/zipcode/version'

module Ally
  module Detector
    class Zipcode
      include Ally::Detector

      def detect
        @datapoints = []
        @inquiry.words_chomp_punc.each do |word|
          if word =~ /^\d{5}(?:[-\s]\d{4})?$/
            @datapoints << word
            @data_detected = true
          end
        end
        @datapoints.length == 0 ? nil : @datapoints
      end
    
    end
  end
end
