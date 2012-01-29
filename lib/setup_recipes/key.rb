Capistrano::Configuration.instance(:must_exist).load do |c|
  namespace :setup do
    desc "setup auth key"
    task :key do
      c.roles.values.map(&:servers).flatten.uniq.each do |host|
        run_locally "cat ~/.ssh/id_dsa.pub | ssh -i #{c[:pem_key]} #{user}@#{host} 'cat >> /home/#{user}/.ssh/authorized_keys2'"
      end
    end
  end
end