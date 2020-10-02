#!/bin/sh

#set -xe

#phplint_result=$(./vendor/bin/phplint)
phplint_result=$(/root/.composer/vendor/bin/phplint ${INPUT_PATH} ${INPUT_OPTIONS})
phplint_status=$?

if [ $phplint_status = 1 ]; then
  echo 'Syntax errors found.'
elif [ $phplint_status = 2 ]; then
  echo 'Unexpected error.'
else
  echo 'No syntax errors found.'
fi

#phpcs_result=$(./vendor/bin/phpcs .)
phpcs_result=$(/root/.composer/vendor/bin/phpcs ${INPUT_PATH})
phpcs_status=$?

if [ $phpcs_status = 1 ]; then
  echo 'Errors found, but none of them can be fixed by PHPCBF.'
elif [ $phpcs_status = 2 ]; then
  echo 'Errors found, and some can be fixed by PHPCBF.'
else
  echo 'No errors found.'
fi

