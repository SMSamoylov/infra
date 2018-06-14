task list

ssh -t -i ~/.ssh/id.rsa -A samoylov@35.233.3.103 ssh 10.132.0.3

Host internalhost
HostName 10.132.0.3 
IdentityFile ~/.ssh/id.rsa
Port 22
ProxyCommand ssh -t -i ~/.ssh/id.rsa -A samoylov@35.233.3.103 -W %h:%p
