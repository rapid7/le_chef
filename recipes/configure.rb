service 'logentries' do
  supports :stop => true, :start => true, :restart => true
  action :nothing
end

le = node['le']
if not le['pull-server-side-config']
  execute 'logentries datahub from file' do
    command(lazy do

              cmd = "le reinit"
              cmd += ' --pull-server-side-config=False'

              datahub = le['datahub']
              if datahub['enable']
                cmd += ' --suppress-ssl' unless datahub['ssl']
                cmd += " --datahub=#{datahub['server_ip']}:#{datahub['port']}"
              end

              cmd
            end)

    not_if 'grep pull-server-side-config /etc/le/config'
    notifies :restart, 'service[logentries]'
  end
else
  execute 'initialize logentries daemon' do
    command(lazy do
              cmd = "le register"
              cmd += " --user-key #{le['account_key']}"
              cmd += " --name='#{le['hostname']}'"
              cmd
            end)

    not_if 'le whoami'

    notifies :restart, 'service[logentries]'
  end
end

class Chef::Recipe
  include FollowLogs
end

# Follow logs from the JSON config
follow_logs()
