case node['platform']
  when 'debian', 'ubuntu'
    apt_repository 'logentries' do
      uri 'http://rep.logentries.com/'
      distribution node['lsb']['codename']
      components ['main']
      keyserver 'pgp.mit.edu'
      key 'C43C79AD'
    end
  when 'centos', 'redhat', 'amazon', 'scientific'
    yum_repository 'logentries' do
      description 'Logentries repo'
      baseurl 'http://rep.logentries.com/rh/\$basearch'
      gpgkey 'http://rep.logentries.com/RPM-GPG-KEY-logentries'
      action :create
    end
end

#TODO: do something different (or nothing?) for Red Hat?
# I imagine its at least a different path; I don't have
# any RPM machines around to look at.
dont_run_file = '/etc/default/logentries_not_to_be_run'
file dont_run_file do
  action :nothing
end

package 'logentries'
deamon_package_resource = package 'logentries-daemon' do
  notifies :delete, "file[#{dont_run_file}]", :immediately
end

# if logentries-daemon package is not already installed during compile phase
# of this chef run, we want to create the init script's "dont_run" file long
# enough to install it (to prevent it from auto-starting with no config)
if deamon_package_resource.provider_for_action(:install).load_current_resource.version.nil?
  resources("file[#{dont_run_file}]").action(:create)
end
