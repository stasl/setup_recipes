Capistrano::Configuration.instance(:must_exist).load do |c|
  namespace :setup do
    desc "init gitosis project"
    task :gitosis do
      gitosis_dir = c[:gitosis_dir] || '~/projects/gitosis-admin'
      gitosis_user = c[:gitosis_user]
      
      # TODO support many app hosts
      host = c.roles[:app].servers.first

      run_locally "ssh #{user}@#{host} 'ssh-keygen -t dsa'"
      run_locally "ssh #{user}@#{host} 'cat /home/#{user}/.ssh/id_dsa.pub' > #{gitosis_dir}/keydir/deploy_#{application}.pub"

      run_locally "cd #{gitosis_dir} && git add keydir/deploy_#{application}.pub"
      run_locally "cd #{gitosis_dir} && echo '[group #{application}]' >> gitosis.conf"
      run_locally "cd #{gitosis_dir} && echo 'writable = #{application}' >> gitosis.conf"
      run_locally "cd #{gitosis_dir} && echo 'members = #{gitosis_user} deploy_#{application}' >> gitosis.conf"
      run_locally "cd #{gitosis_dir} && git commit -a -m 'added #{application}' && git push"
    end
  end
end