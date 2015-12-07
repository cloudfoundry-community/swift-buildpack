require 'spec_helper'

describe 'check stack support script' do
  let(:buildpack_dir) { Dir.mktmpdir }
  let(:manifest) do <<-MANIFEST
---
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
  end

  def run_check_stack_support(stack='')
    Open3.capture3(
      { 'CF_STACK'=>stack },
      "#{buildpack_dir}/compile-extensions/bin/check_stack_support"
    )
  end

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

  context 'when stack is unsupported' do
    shared_examples_for :an_unsupported_stack do |stack|
      it 'gives a helpful error message in stderr' do
        stdout, stderr, process = run_check_stack_support(stack)
        expect(stderr).to include(<<-HELPFUL_ERROR_MESSAGE)
It looks like you're deploying on a stack (currently set to *lucid64*) that's not supported by this buildpack.
That could be because you're using a recent buildpack release on a deprecated stack.
If you're using the buildpack installed by your CF admin, please let your admin know you saw this error message.
If you at one point specified a buildpack that's at git URL, please make sure you're pointed at a version that supports this stack.
        HELPFUL_ERROR_MESSAGE
      end

      it 'exits unsucessfully' do
        stdout, stderr, process = run_check_stack_support(stack)

        expect(process.exitstatus).to eq 44
      end
    end

    context 'with the current manifest' do
      it_behaves_like :an_unsupported_stack, 'lucid64'
    end

    context 'and the manifest contains the unsupported stack as text somewhere' do
      let(:manifest) do <<-MANIFEST
---
dependencies:
  -
    name: jruby-lucid64
    version: 1.9.3::1.7.0
    uri: http://another.repo/lucid64/jruby_1.9.3_jdk_1.7.0.tgz
    cf_stacks:
      - cflinuxfs2
        MANIFEST
      end

      context 'ensure that the stack is checked via the cf_stacks' do
        it_behaves_like :an_unsupported_stack, 'lucid64'
      end
    end

    context 'when there\'s no stack provided in the environment' do
      it_behaves_like :an_unsupported_stack, nil
    end
  end

  context 'when the stack is supported' do
    shared_examples_for :a_supported_stack do
      it 'gives no message in stderr' do
        stdout, stderr, process = run_check_stack_support('cflinuxfs2')
        expect(stderr).to eq('')
      end

      it 'exits sucessfully' do
        stdout, stderr, process = run_check_stack_support('cflinuxfs2')

        expect(process).to be_success
      end
    end

    context 'and the manifest only contains that stack' do
      it_behaves_like :a_supported_stack
    end

    context 'and the manifest contains multiple supported stacks' do
      let(:manifest) do <<-MANIFEST
---
dependencies:
  - name: jruby-lucid64
    version: 1.9.3::1.7.0
    uri: http://another.repo/lucid64/jruby_1.9.3_jdk_1.7.0.tgz
    cf_stacks:
      - lucid64
  - name: jruby-cflinuxfs2
    version: 1.9.3::1.7.0
    uri: http://another.repo/cflinuxfs2/jruby_1.9.3_jdk_1.7.0.tgz
    cf_stacks:
      - cflinuxfs2
      MANIFEST
      end

      it_behaves_like :a_supported_stack
    end
  end

end
