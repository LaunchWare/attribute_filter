guard 'rspec', 
  :version => 2,
  :all_after_pass => false, # run all specs after changed specs pass, default: true
  :all_on_start => false, # run all the specs at startup, default: true
  :keep_failed => false do

  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

