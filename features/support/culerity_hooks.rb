# from http://rvm.beginrescueend.com/integration/culerty/
Before("@culerity,@celerity") do |scenario|
  unless @env_rvm_jruby
    require 'yaml'
    rvm_info = YAML::load(`bash -l -c 'source ~/.rvm/scripts/rvm; rvm jruby ; rvm info'`).values.first
    @env_rvm_jruby = rvm_info['environment']
    @env_jruby_path = rvm_info['binaries']['ruby'].gsub(%r{^(.*)/ruby$}, '\1')
  end
  @env_defaults = {}
  @env_rvm_jruby.each do |k, v|
    @env_defaults[k] = ENV[k]
    ENV[k] = v
  end
  @env_path = ENV['PATH']
  ENV['PATH'] = ENV['PATH'] + ":#{@env_jruby_path}"
end

After("@culerity,@celerity") do |scenario|
  @env_defaults.each do |k, v|
    ENV[k] = v
  end
  ENV["PATH"] = @env_path
end