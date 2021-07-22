#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'open-uri/cached'
require 'pry'

class MemberList
  # details for an individual member
  class Member < Scraped::HTML
    field :name do
      noko.parent.css('.pTitle').text.tidy
    end

    field :position do
      noko.text.tidy
    end
  end

  # The page listing all the members
  class Members < Scraped::HTML
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

url = 'https://www.gov.je/Government/HowGovernmentWorks/CouncilMinisters/Pages/CouncilofMinisters.aspx'
puts EveryPoliticianScraper::ScraperData.new(url).csv
