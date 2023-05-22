#!/bin/bash
set -e

echo "Iniciando script..."

mongosh -u admin -p test --authenticationDatabase admin <<EOF
use sample_airbnb
db.createUser({
  user:  'import_airbnb',
  pwd: 'test',
  roles: [{
    role: 'readWrite',
    db: 'sample_airbnb'
  }]
})
EOF

mongosh -u import_airbnb -p test --authenticationDatabase sample_airbnb <<EOF
use sample_airbnb
EOF

mongoimport --username import_airbnb --password test --authenticationDatabase sample_airbnb --db sample_airbnb --collection listingsAndReviews --file /data/listingsAndReview.json --jsonArray

mongosh -u admin -p test --authenticationDatabase admin <<EOF
use sample_supplies
db.createUser({
  user:  'import_supplies',
  pwd: 'test',
  roles: [{
    role: 'readWrite',
    db: 'sample_supplies'
  }]
})
EOF

mongosh -u import_supplies -p test --authenticationDatabase sample_supplies <<EOF
use sample_supplies
EOF

mongoimport --username import_supplies --password test --authenticationDatabase sample_supplies --db sample_supplies --collection sales --file /data/sales.json --jsonArray

mongosh -u admin -p test --authenticationDatabase admin <<EOF
use sample_analytics
db.createUser({
  user:  'import_accounts',
  pwd: 'test',
  roles: [{
    role: 'readWrite',
    db: 'sample_analytics'
  }]
})
EOF

mongosh -u import_accounts -p test --authenticationDatabase sample_analytics <<EOF
use sample_analytics
EOF

mongoimport --username import_accounts --password test --authenticationDatabase sample_analytics --db sample_analytics --collection accounts --file /data/accounts.json --jsonArray

mongosh -u admin -p test --authenticationDatabase admin <<EOF
use sample_analytics
db.createUser({
  user:  'import_customers',
  pwd: 'test',
  roles: [{
    role: 'readWrite',
    db: 'sample_analytics'
  }]
})
EOF

mongosh -u import_customers -p test --authenticationDatabase sample_analytics <<EOF
use sample_analytics
EOF

mongoimport --username import_customers --password test --authenticationDatabase sample_analytics --db sample_analytics --collection customers --file /data/customers.json --jsonArray

mongosh -u admin -p test --authenticationDatabase admin <<EOF
use sample_analytics
db.createUser({
  user:  'import_transactions',
  pwd: 'test',
  roles: [{
    role: 'readWrite',
    db: 'sample_analytics'
  }]
})
EOF

mongosh -u import_transactions -p test --authenticationDatabase sample_analytics <<EOF
use sample_analytics
EOF

mongoimport --username import_transactions --password test --authenticationDatabase sample_analytics --db sample_analytics --collection transactions --file /data/transactions.json --jsonArray

