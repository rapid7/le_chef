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
		logs = node['le']['logs_to_follow']
		logs.each do |log|
			follow(log)
		end
	end
	
	# Script to follow a log
	def follow(log)
		execute "le follow #{log}"
	end
end