#!/bin/sh
set -e

PDF_NAME="Ashish_Kushwaha.pdf"

# Save PDF to output directory if mounted
if [ -d "/app/output" ]; then
  cp $PDF_NAME output/$PDF_NAME
  echo "PDF saved to output/$PDF_NAME"
fi

# Upload to S3 (requires environment variables)
if [ -n "$S3_BUCKET" ]; then
  aws s3 cp $PDF_NAME s3://$S3_BUCKET/$PDF_NAME
  echo "PDF uploaded to S3 Bucker. "
fi
