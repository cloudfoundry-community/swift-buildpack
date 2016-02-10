#!/usr/bin/env ruby

require "yaml"
require "fileutils"

release_notes_path = ARGV.shift
uncached_manifest_path = ARGV.shift
cached_manifest_path = ARGV.shift
unless cached_manifest_path && File.exists?(uncached_manifest_path) && File.exists?(cached_manifest_path)
  $stderr.puts "USAGE: release-notes.rb notes.md path/to/manifest.yml path/to/manifest-cached.yml"
  exit 1
end

FileUtils.mkdir_p(File.dirname(release_notes_path))

uncached_manifest = YAML.load_file(uncached_manifest_path)
cached_manifest = YAML.load_file(cached_manifest_path)

File.open(release_notes_path, "w") do |f|
  f.puts "## Uncached buildpack package\n"
  f.puts "| name | version |"
  f.puts "| --- | --- |"
  uncached_manifest["dependencies"].each do |dep|
    f.puts "| #{dep['name']} | #{dep['version']} |"
  end
  f.puts
  f.puts "## Cached buildpack package\n"
  f.puts "| name | version |"
  f.puts "| --- | --- |"
  cached_manifest["dependencies"].each do |dep|
    f.puts "| #{dep['name']} | #{dep['version']} |"
  end
end
