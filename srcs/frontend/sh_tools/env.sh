#!/bin/bash

# Path to the config.js file
CONFIG_FILE="public/config.js"

# Start writing to the config.js file
echo "export default {" > $CONFIG_FILE

# Loop through all environment variables
for var in $(printenv | awk -F= '{print $1}')
do
  # Retrieve the value of the environment variable
  value=$(printenv $var)

  # Write the variable and its value to config.js
  echo "  $var: \"$value\"," >> $CONFIG_FILE
done

# Finish the config.js file
echo "}" >> $CONFIG_FILE

echo "File $CONFIG_FILE generated successfully."
