service 'logentries' do
  supports :stop => true, :start => true, :restart => true
  action :nothing
end

execute 'le register' do
  command(lazy do
    le = node['le']
    cmd = "le register"

    cmd += " --user-key #{le['account_key']}"
    cmd += " --name='#{le['hostname']}'"

    datahub = le['datahub']
    if datahub['enable']
      cmd += ' --suppress-ssl' unless datahub['ssl']
      cmd += " --datahub=#{datahub['server_ip']}:#{datahub['port']}"
    end

    cmd
  end)

  not_if 'le whoami'

  notifies :restart, 'service[logentries]'
end

class Chef::Recipe
  include FollowLogs
end

# Follow logs from the JSON config
follow_logs()
