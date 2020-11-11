
Check allowed ciphers, macs, and key algorithms
``` sshd -T | grep "\(ciphers\|macs\|kexalgorithms\)" ```

# Example output:
chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com
macs umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
kexalgorithms curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group14-sha256,diffie-hellman-group14-sha1


#Check only ciphers
``` sshd -T | grep ciphers ```

# Secure ciphers:
# chacha20-poly1305@openssh.com
# aes128-ctr
# aes192-ctr
# aes256-ctr
# aes128-gcm@openssh.com
# aes256-gcm@openssh.com

# Check only Key Exchange Algorithms
```sshd -T | grep kexalgorithms ```

#Example output:
curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group14-sha256,diffie-hellman-group14-sha1

# Possible Insecure Key Exchange Algorithms
# ecdh-sha2-nistp256          - Possible NSA backdoor
# ecdh-sha2-nistp384          - Possible NSA backdoor
# ecdh-sha2-nistp521          - Possible NSA backdoor
# diffie-hellman-group14-sha1 - SHA-1 is becoming obsolete, consider using SHA-256 version

# Server Host Key Algorithms
# ecdsa-sha2-nistp256 - Possible NSA backdoor

# MAC Algorithms
# umac-64-etm@openssh.com   - WEAK: 64-bit UMAC is no longer considered secure enough. Recommended tag size should be at least 128 bits.
# hmac-sha1-etm@openssh.com - WEAK: SHA-1 is becoming deprecated - consider replacing with SHA-256 or SHA-512. 
# umac-64@openssh.com       - WEAK: 64-bit UMAC is no longer considered secure enough. 
# hmac-sha1                 - WEAK: SHA-1 is becoming deprecated - consider replacing with SHA-256 or SHA-512. 

#edit: nano /etc/ssh/sshd_config
ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc
macs hmac-sha1,umac-64@openssh.com,hmac-sha2-256,hmac-sha2-512

Restart SSH service
``` service sshd restart ```

