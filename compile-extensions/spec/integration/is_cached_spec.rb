require 'spec_helper'

describe 'is_cached command line predicate' do
  let(:buildpack_dir) { Dir.mktmpdir }

  before do
    ENV['BUILDPACK_PATH'] = buildpack_dir
  end

  after do
    FileUtils.remove_entry buildpack_dir
    ENV.delete('BUILDPACK_PATH')
  end

  context 'BUILDPACK_PATH has a dependencies folder' do
    specify do
      `bin/is_cached`
      expect($?).to_not be_success
    end
  end

  context 'BUILDPACK_PATH does not have a dependencies folder' do
    before do
      Dir.mkdir(File.join(buildpack_dir, "dependencies"))
    end

    specify do
      `bin/is_cached`
      expect($?).to be_success
    end
  end
end
