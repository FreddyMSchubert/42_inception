#!/bin/bash
if [ ! -f ".env" ]; then
  echo "❌ .env file not found in the current directory."
  exit 1
fi

echo "ℹ️ Sourcing the .env file..."
set -o allexport
source .env
set +o allexport

vars=(
  "MARIA_DB_ROOT_USER"
  "MARIA_DB_ROOT_PASSWORD"
  "MARIA_DB_DATABASE_NAME"
  "WORDPRESS_ADMIN_USER"
  "WORDPRESS_ADMIN_PASSWORD"
  "WORDPRESS_ADMIN_EMAIL"
  "WORDPRESS_TEST_USER"
  "WORDPRESS_TEST_USER_PASSWORD"
  "WORDPRESS_TEST_USER_EMAIL"
)

issues_found=false

for var in "${vars[@]}"; do
  value=$(printenv "$var")
  if [ -z "$value" ]; then
    echo "❌ The variable $var is not set!"
    issues_found=true
  elif [[ "$value" == *admin* ]]; then
    echo "⚠️ The variable $var contains 'admin' which is not allowed: $value"
    issues_found=true
  else
    echo "✅ $var is set correctly."
  fi
done

if [ "$issues_found" = true ]; then
  echo "❗ Issues were found with your environment variables."
  exit 1
else
  echo "🎉 All environment variables are set and valid!"
  exit 0
fi
