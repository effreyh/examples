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

PROJECTS_COLUMNS = {"_projectid" => :id,
                    "_teacher_acctid" => :id,
                    "_schoolid" => :id,
                    "school_ncesid" => :id,
                    "school_latitude" => :float,
                    "school_longitude" => :float,
                    "school_city" => :string,
                    "school_state" => :string,
                    "school_zip" => :string,
                    #                    "school_metro" => %w[urban suburban rural],
                    "school_metro" => :string,
                    "school_district" => :string,
                    "school_county" => :string,
                    "school_charter" => :boolean,
                    "school_magnet" => :boolean,
                    "school_year_round" => :boolean,
                    "school_nlns" => :boolean,
                    "school_kipp" => :boolean,
                    "school_charter_ready_promise" => :boolean,
                    "teacher_prefix" => :string,
                    "teacher_teach_for_america" => :boolean,
                    "teacher_ny_teaching_fellow" => :boolean,
                    "primary_focus_subject" => :string,
                    "primary_focus_area" => :string,
                    "secondary_focus_subject" => :string,
                    "secondary_focus_area" => :string,
                    # "resource_type" => %w[Books Technology Supplies Trips Visitors Other],
                    "resource_type" => :string,
#                    "poverty_level" => %w[high low minimal unknown],
                    "poverty_level" => :string,
                    "grade_level" => :string,
                    "vendor_shipping_charges" => :float,
                    "sales_tax" => :float,
                    "payment_processing_charges" => :float,
                    "fulfillment_labor_materials" => :float,
                    "total_price_excluding_opt_donation" => :float,
                    "total_price_including_opt_donation" => :float,
                    "students_reached" => :integer,
                    "total_donations" => :float,
                    "num_donors" => :integer,
                    "eligible_double_your_impact_match" => :boolean,
                    "eligible_almost_home_match" => :boolean,
                    "funding_status" => :string,
                    "date_posted" => :timestamp,
                    "date_completed" => :timestamp,
                    "date_thank_you_packet_mailed" => :timestamp,
                    "date_expiration" => :timestamp,
                    "total_price_excluding_optional_support" => :float,
                    "total_price_including_optional_support" => :float
                   }
