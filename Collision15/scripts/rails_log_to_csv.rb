# Copyright 2015 Google
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#      http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# encoding: UTF-8

require 'csv'

filename, outfile, * = ARGV

abort "Specify outfile" unless outfile

IP_REGEX = /(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/
TIMESTAMP_REGEX = /\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/
RESOURCE_REGEX = /Started (GET|POST|PUT|DELETE) "(.*?)"/
STATUS_REGEX = /Completed (\d{3})/
PROCESSING_TIME = / (\d+)ms/

Record = Struct.new(:body, :timestamp, :ip_address, :verb,
                    :resource, :status, :processing_time)

CSV.open(outfile, "wb:UTF-8") do |csv|
  csv << Record.members

  File.open(filename, "r:UTF-8").each_line do |line|
    line.chomp!
    next if line.empty?
    r = Record.new

    r.body             = line
    r.ip_address       = line[IP_REGEX]
    r.timestamp        = line[TIMESTAMP_REGEX]
    r.status           = line[STATUS_REGEX, 1]
    r.processing_time  = line[PROCESSING_TIME, 1]
    _, r.verb, r.resource = line.match(RESOURCE_REGEX).to_a

    csv << r.to_a
  end
end
