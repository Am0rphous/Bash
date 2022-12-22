# GitLab scripts

- Reset 2fa for a user remotely. Not a good solution because of the password has to be sent with an echo command :(
````
#!/bin/bash

echo "Please enter the username of the GitLab user:"
read username

echo "Resetting 2FA for user $username..."
echo MYPASSWORD_CHANGE_THIS | sudo -S gitlab-rails runner "user = User.where(username: '$username').first; user.reset_two_factor!"
echo "2FA reset for user $username"

cat script.sh | ssh -T USER@$HOST
````

