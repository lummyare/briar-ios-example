#!/usr/bin/env ruby

# runs xtc job + local simulator tests
# see Briar/jenkins-calabash.sh

require File.expand_path(File.join(File.dirname(__FILE__), 'ci-helpers'))
require File.expand_path(File.join(File.dirname(__FILE__), 'run-masters'))

# Same as toolchain-released.
xtc_device_set = ARGV[0] || '22107146'
xtc_profile = ARGV[1] || 'default'
# accept 2 additional cucumber args for -t < tags >
cucumber_args = ''
if ARGV.count == 4
  cucumber_args = "#{ARGV[2]} #{ARGV[3]}"
end

run_masters xtc_device_set, xtc_profile, 'toolchain-masters'

working_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'Briar'))

Dir.chdir working_dir do

  # sometimes json 1.8.1 cannot be found
  install_gem 'json'

  do_system("./jenkins-calabash.sh #{cucumber_args}")
end
