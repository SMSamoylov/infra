**Ansible**

>Создадим inventory.json примерного содержания

```json
> 
> {
> "app": {
>     "hosts": ["35.195.72.130"],
>      "vars": {
>         "ansible_ssh_user": "appuser",
>         "ansible_ssh_private_key_file":"~/.ssh/id.rsa"
>         }
>     },
> 
> "db": {
>     "hosts": ["35.241.237.66"],
>      "vars": {
>         "ansible_ssh_user": "appuser",
>         "ansible_ssh_private_key_file": "~/.ssh/id.rsa"
>         }
>     }
> }
> 

Создаем скрипт который будет читать inventory.json, пример применения 

ansible -i start.py all -m ping

35.205.93.183 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
35.195.72.130 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
