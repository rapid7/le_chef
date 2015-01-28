if platform_family?('rhel')
  yum_repository 'logentries' do
    description 'Logentries repo'
    baseurl 'http://rep.logentries.com/rh/\$basearch'
    gpgkey 'http://rep.logentries.com/RPM-GPG-KEY-logentries'
    action :create
  end
end

if platform_family?('debian')
  apt_repository 'logentries' do
    uri          'http://rep.logentries.com/'
    distribution node['lsb']['codename']
    components   ['main']
    keyserver    'pgp.mit.edu'
    key          'C43C79AD'
  end

  # we don't want installing logentries-daemon to start it if we don't have a
  # config ready; if we want it to start, chef will handle it once its configed
  policy_rc_d = <<EOF
#!/bin/bash
while [ $# -gt 3 ]; do
  shift
done

if [ $1 = logentries ]; then
  exit 101
fi

exit 0
EOF

  file '/usr/sbin/policy-rc.d' do
    content policy_rc_d
    mode '0755'
    owner 'root'
    group 'root'

    action :create_if_missing
    notifies :delete, 'file[/usr/sbin/policy-rc.d]'
  end
end

package 'logentries'


package 'logentries-daemon'
