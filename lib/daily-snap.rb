#!/usr/bin/env ruby

require 'fileutils'

class DailySnap

  def initialize(location="#{ENV['HOME']}/Pictures/dailysnaps")
    @location = location
    # make dest path
    FileUtils.mkdir_p @location
  end

  def next_file_name  
    today = Time.now.strftime('%Y-%m-%d')
    index = 0
    begin
      dest = File.join(@location, "#{today}-#{index}.jpg")
      index += 1
    end until !File.file?(dest)
    dest 
  end

  def snap
    puts `imagesnap -q -w 3 #{next_file_name}`
  end
end

DailySnap.new.snap
