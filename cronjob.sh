#!/bin/bash
# get env form printenv in container
# test
source /usr/src/redmine/.env
export PATH=/usr/local/bundle/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export GEM_HOME=/usr/local/bundle
export RAILS_ENV=production
export HOME=/home/redmine
export BUNDLE_APP_CONFIG=/usr/local/bundle
if [ ${REDMINE_INBOUND_ENABLED} = true ]; then
    rake -f /usr/src/redmine/Rakefile redmine:email:receive_imap RAILS_ENV=production host=${REDMINE_EMAIL_HOST} username=${REDMINE_EMAIL_ADDRESS} password=${REDMINE_EMAIL_PASSWORD} port=993 ssl=true project=${REDMINE_DEFAULT_PROJECT} unknown_user="create" no_permission_check=1 default_group=${REDMINE_DEFAULT_GROUP}
fi
