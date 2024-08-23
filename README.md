# AppBlockerShell
Bash script for kill apps by list

1 Copy bash script and block list to home or other folder

2. Copy monitor.service to /etc/systemd/system

3. Edit username and path to script in monitor.service

4. Reload services, start and enable monitor

```
systemctl daemon-reload
systemctl start monitor.service
systemctl enable monitor.service
```

5. By default time for blocking from 3:00 to 19:00

6. To edit settings or restart service run app_blocker.sh
