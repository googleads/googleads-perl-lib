#!/usr/bin/perl
#
# Copyright 2014, Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Unit tests for the Google::Ads::AdWords::Reports::ReportingConfiguration
# module.
#
# Author: Josh Radcliff <api.jradcliff@gmail.com>

use strict;
use lib qw(lib t t/util);

use Test::More (tests => 9);
use TestClientUtils qw(get_test_client_no_auth);

use_ok("Google::Ads::AdWords::Reports::ReportingConfiguration");

my $client = get_test_client_no_auth();
ok($client->get_reporting_config(), "reporting configuration present");

is($client->get_reporting_config()->get_skip_header(), undef,
    "skip_header should be undef");
is($client->get_reporting_config()->get_skip_summary(), undef,
    "skip_summary should be undef");

# Construct a new reporting config.
my $reporting_config =
    Google::Ads::AdWords::Reports::ReportingConfiguration->new({
        skip_header => 1,
        skip_summary => 0
    });

$client->set_reporting_config($reporting_config);

is($client->get_reporting_config()->get_skip_header(), 1,
    "skip_header should be set by constructor");
is($client->get_reporting_config()->get_skip_summary(), 0,
    "skip_summary should be set by constructor");

# Mutate the reporting config
$client->get_reporting_config->set_skip_header(0);
is($client->get_reporting_config()->get_skip_header(), 0,
    "skip_header should be set to false");

$client->get_reporting_config->set_skip_summary(1);
is($client->get_reporting_config()->get_skip_summary(), 1,
    "skip_summary should be set to true");

ok($client->get_reporting_config()->as_string(),
    "as_string");
