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
end

package 'logentries'
package 'logentries-daemon'
