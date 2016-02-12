#!/usr/bin/env ruby

require "yaml"
require "fileutils"

buildpack_dir = File.expand_path(File.join(File.dirname(File.expand_path(__FILE__)), "../.."))

release_notes_dir = File.expand_path("release-notes-output")
uncached_manifest_path = File.join(buildpack_dir, "manifest.yml")
cached_manifest_path = File.join(buildpack_dir, "manifest-cached.yml")

FileUtils.mkdir_p(release_notes_dir)
release_name_path = File.join(release_notes_dir, "name")
release_notes_path = File.join(release_notes_dir, "notes.md")

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

buildpack_version = File.read(File.join(buildpack_dir, "VERSION")).strip
swift_version = cached_manifest["dependencies"].find {|d| d['name'] == 'swift'}['version']

File.open(release_name_path, "w") do |f|
  f << "v#{buildpack_version} - Swift #{swift_version}"
end
