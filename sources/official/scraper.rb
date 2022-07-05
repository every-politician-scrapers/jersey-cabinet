#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    field :name do
      noko.parent.css('.pTitle').text.tidy
    end

    field :position do
      noko.text.tidy
    end
  end

  class Members
    field :members do
      member_container.map { |member| fragment(member => Member).to_h }
    end

    private

    # Each 'Minister' node, each of which has an incrementing class id
    def member_container
      noko.css('.pagecontent .col-12.nopadding span').select do |node|
        node.attr('class')[/pText[2-9]/] && node.text.include?('Minister')
      end
    end
  end
end

file = Pathname.new 'official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
