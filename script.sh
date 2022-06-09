vagrant up
ansible-playbook systemd/tests/test.yml
vagrant ssh
sudo su
tail -f /var/log/messages