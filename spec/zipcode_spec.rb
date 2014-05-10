require 'spec_helper'

require_relative '../lib/ally/detector/zipcode'

describe Ally::Detector::Zipcode do
  context 'detect zipcode' do
    it 'by itself' do
      subject.inquiry('02446').detect.should == ['02446']
    end

    it 'in a sentence with puncuation' do
      subject.inquiry('what is the weather like in 00001?')
        .detect.should == ['00001']
    end

    it 'when its faked' do
      subject.inquiry('what is the weather like in 0001?')
        .detect.should == nil
    end

    it 'with a hyphen' do
      subject.inquiry('Boston city hall is in 02201-1020')
        .detect.should == ["02201-1020"]
    end

    it 'when there are multiple' do
      subject.inquiry('Atlanta has a zip of 30303 while new york has 10003')
        .detect.should == ['30303', '10003']
    end
  end
end
