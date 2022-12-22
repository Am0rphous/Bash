# GitLab scripts

- Reset 2fa for a user
````
#!/bin/bash
echo "Please enter the username of the GitLab user:"
read username

# Reset 2FA
echo "Resetting 2FA for user $username..."
gitlab-rails runner "user = User.where(username: '$username').first; user.reset_two_factor!"
echo "2FA reset for user $username"
````
