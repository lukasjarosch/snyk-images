#!/usr/bin/env ruby

require "erb"
require "fileutils"


@images = []
File.open("linux").each do |line|
  base,tag = line.split
  @images.append [base, tag ? tag : base]
end

@seed = @images.shift

templatename = File.join("_templates", "build.yml.erb")
renderer = ERB.new(File.read(templatename))
File.open(".github/workflows/build.yml", "w") { |file| file.puts renderer.result() }