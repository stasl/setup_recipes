Capistrano::Configuration.instance(:must_exist).load do |c|
  namespace :setup do
    desc "git init and do first commit"
    task :git do
      run_locally "git init"
      run_locally "git remote add origin #{repository}"

      run_locally "git add ."
      run_locally "git commit -a -m 'initial commit'"

      run_locally "git push origin master:refs/heads/master"
    end
  end
end