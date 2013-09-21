crisply_timesheet
=====================

timesheet integration plugin for redmine with crisply

== Installation and Setup
=== Crisply
1. Login in the Crisply account
2. Create a new  Connection (Setup > Connections > Add new connection)
3. Select Crisply Webhook
4. Set a unique name and check the +Account source+ checkbox
5. Make sure that +Account source+ and +Autocreate project+ checkboxes are checked
6. Copy the Webhook url

=== Redmine
1. Follow the Redmine plugin installation steps at: http://www.redmine.org/wiki/redmine/Plugins  Make sure the plugin is installed to +plugins/crisply_timesheet+
3. Run the plugin migrations +rake db:migrate_plugins+
4. Restart your Redmine web servers (e.g. mongrel, thin, mod_rails)
5. Login and configure the plugin (Administration > Plugins > Configure)


For the best results, every user in Redmine should have an corresponding user in Crisply (for the auto-mapping to work).