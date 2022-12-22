# GitLab scripts

- Reset 2fa for a user remotely
````
#!/bin/bash

HOST="example.gitlab.com"
USER="myusername"
SCRIPT="localscript.sh"

echo "Please enter the username of the GitLab user:"
read username

# Reset 2FA
echo "Resetting 2FA for user $username..."
gitlab-rails runner "user = User.where(username: '$username').first; user.reset_two_factor!"
echo "2FA reset for user $username"

# Execute the script remotely
ssh "$USER@$HOST" "bash -s" < "$SCRIPT"
````

