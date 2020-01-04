#!/usr/bin/env bash

S3_BUCKET_NAME=$1
CF_ID=$(aws cloudfront list-distributions --query "DistributionList.Items[].{Id:Id,Origin:Origins.Items[0].DomainName}[?contains(Origin,'${S3_BUCKET_NAME}')] | [0]" | awk '{print $1}')

# Sync all files except for service-worker and index
echo "Uploading files to $S3_BUCKET_NAME..."
aws s3 sync dist/ s3://$S3_BUCKET_NAME/ \
  --exclude service-worker.js \
  --exclude index.html \
  --cache-control max-age=31622400,public

# Upload service-worker.js with directive to not cache it
echo "Uploading service-worker.js"
aws s3 cp dist/service-worker.js s3://$S3_BUCKET_NAME/service-worker.js \
  --metadata-directive REPLACE \
  --cache-control max-age=0,no-cache,no-store,must-revalidate \
  --content-type application/javascript

# Upload index.html
echo "Uploading index.html"
aws s3 cp dist/index.html s3://$S3_BUCKET_NAME/index.html \
  --metadata-directive REPLACE \
  --cache-control max-age=0,no-cache,no-store,must-revalidate \
  --content-type text/html

# Purge the cloudfront cache
echo "Purging the cache for CloudFront"
aws cloudfront create-invalidation \
  --distribution-id $CF_ID \
  --paths "/*"
