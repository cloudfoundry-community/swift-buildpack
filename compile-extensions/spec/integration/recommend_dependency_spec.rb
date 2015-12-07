require 'spec_helper'

describe 'recommend_dependency' do
  def run_translate
    Open3.capture3("#{buildpack_dir}/compile-extensions/bin/recommend_dependency #{original_url}")
  end

  let(:buildpack_dir) { Dir.mktmpdir }

  let(:manifest) {
    <<-MANIFEST
---
url_to_dependency_map:
  -
    match: \/(ruby)-(\\d+\\.\\d+\\.\\d+).tgz
    version: $2
    name: $1
  -
    match: !ruby/regexp /\/jruby_(\\d+\\.\\d+\\.\\d+)_jdk_(\\d+\\.\\d+\\.\\d+).tgz/
    version: $1::$2
    name: jruby

dependencies:
  -
    name: ruby
    version: 1.9.3
    uri: http://thong.co.nz/file.tgz
    cf_stacks:
      - cflinuxfs2
  -
    name: ruby
    version: 2.1.1
    uri: http://some.other.repo/ruby-two-one-one.tgz
    cf_stacks:
      - cflinuxfs2
  -
    name: jruby
    version: 1.9.3::1.7.0
    uri: http://another.repo/jruby_1.9.3_jdk_1.7.0.tgz
    cf_stacks:
      - cflinuxfs2
    MANIFEST
  }

  before do
    File.open(File.join(buildpack_dir, 'manifest.yml'), 'w') do |file|
      file.puts manifest
    end
    base_dir = File.expand_path(File.join(File.dirname(__FILE__), "..", ".."))
    `cd #{buildpack_dir} && cp -r #{base_dir} compile-extensions`
  end

  after do
    FileUtils.remove_entry buildpack_dir
  end

  context 'the url does not have a matcher in the manifest' do
    let(:original_url) { 'http://i_r.not/here' }

    specify do
      translated_url, _, status = run_translate

      expect(translated_url).to eq "DEPENDENCY MISSING IN MANIFEST:

Unfortunately, we are unable to resolve the dependency into
a binary and version number. Please replace this URL with a valid link.\n"
      expect(status).to be_success
    end
  end
  context 'the url has a matcher in the manifest, but no URI for the version' do
    let(:original_url) { 'https://original.com/ruby-2.1.0.tgz' }

    specify do
      translated_url, _, status = run_translate

      expect(translated_url).to eq "DEPENDENCY MISSING IN MANIFEST: ruby 2.1.0

It looks like you're trying to use ruby 2.1.0.

Unfortunately, that version of ruby is not supported by this buildpack.

The versions of ruby supported in this buildpack are:
- 2.1.1
- 1.9.3

If you need further help, start by reading: http://github.com/cloudfoundry/ruby-buildpack/releases.\n"
      expect(status).to be_success
    end
  end
end
