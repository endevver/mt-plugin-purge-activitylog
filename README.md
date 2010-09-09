# Purge Activity Log Plugin for Movable Type

This single serving plugin solves the one simple problem of keeping 
activity logs from getting too large by automatically deleting 
log entries older than n days. 

The Movable Type activity log is a record of all the events that 
occur inside of an installation. It records login events, search
keywords, user creation, comment creation, errors, as well as 
debug messages from plugins. If left untended and unmonitored one's
activity log can easily balloon in size and take up precious 
space in your database. 

This plugin addresses this problem by allowing admins to specify
how long activity log entries should be stored. Once a log entry
passes a certain age threshold this plugin will delete it.

## Installation ##

To install this plugin follow the instructions found here:

http://tinyurl.com/easy-plugin-install

## Usage ##

To specify the number of days you would like to keep activity log
entries around, navigate to "Tools" > "Plugins" from the System
Dashboard or System Overview menu. Find "Purge Activity Log" in the
list of plugins, click the "Settings" tab, and then enter the 
desired number of days and click Save Changes. And you are done.

## Help, Bugs and Feature Requests ##

If you are having problems installing or using the plugin, please check out our general knowledge base and help ticket system at [help.endevver.com](http://help.endevver.com).

## Copyright ##

Copyright 2010, Endevver, LLC. All rights reserved.

## License ##

This plugin is licensed under the same terms as Perl itself.

# About Endevver #

We design and develop web sites, products and services with a focus on 
simplicity, sound design, ease of use and community. We specialize in 
Movable Type and offer numerous services and packages to help customers 
make the most of this powerful publishing platform.

http://endevver.com/
