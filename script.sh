vagrant up
ansible-playbook systemd/tests/test.yml
vagrant ssh
sudo su
sleep 45
tail -f /var/log/messages