#
# Author:: Joe Heung <joe.heung@logentries.com>
# Library:: follow_logs
#
# Copyright 2014 Logentries, JLizard
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module FollowLogs

  # Follow a list of logs from the JSON config file
  def follow_logs()
    # do we have a hash or an array defining the logs to follow?
    if node['le']['logs_to_follow'].instance_of? Chef::Node::ImmutableArray
      node['le']['logs_to_follow'].each do |glob|
        log = Dir.glob(glob)
        log.each do |l|
          follow(l, nil)
        end
      end
    elsif node['le']['logs_to_follow'].instance_of? Chef::Node::ImmutableMash
      node['le']['logs_to_follow'].each do |log_name, glob|
        log = Dir.glob(glob)
        log.each do |l|
          follow(l, log_name)
        end
      end
    else
      raise TypeError, "An array or a hash is needed to provide the log files to follow."
    end
  end

  # Script to follow a log
  def follow(log, log_name)
    if not log_name
      execute "le follow #{log}" do
        not_if "le followed #{log}"
        notifies :restart, 'service[logentries]'
      end
    else
      execute "le follow #{log} --name=#{log_name}" do
        not_if "le followed #{log}"
        notifies :restart, 'service[logentries]'
      end
    end
  end

end # module
