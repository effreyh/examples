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

require 'rinda/rinda'
require 'sentiments'

URI = ARGV[0] || "druby://0.0.0.0:61676"
DRb.start_service
ts = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, URI))

loop do
  _, tweet = ts.take([:tweet, String])
  sentiment = 0
  SENTIMENTS.each do |s, val|
    if tweet.include? s then
      sentiment += val
    end
  end
  ts.write([:sentiment, sentiment])
end