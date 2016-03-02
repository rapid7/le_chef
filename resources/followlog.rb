property :logfile, String, required: true
property :logname, String, required: true, name_property: true

action :create do

  directory '/etc/le/conf.d' do
    action :create
    owner 'root'
    group 'root'
    recursive true
  end

  template "/etc/le/conf.d/#{logname}.conf" do
    action :create
    cookbook 'logentries_agent'
    source 'partial_conf.erb'
    owner 'root'
    group 'root'
    variables({
      :logfile => logfile,
      :logname => logname
    })
  end

end

action :delete do
  file "/etc/le/conf.d/#{logname}.conf" do
    action :delete
  end
end

