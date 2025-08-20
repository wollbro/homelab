# homelab-config

## Description

TBA...

## Useful commands

### See when ansible-pull will run

Sometime you want to know when the next ansible-pull will be executed, this can
be done by running the following command on the specific VM.

```bash
systemctl list-timers --all | grep ansible-pull
```

### Diagnose problems

If you suspect that something is wrong the first thing you can do is to check
the status of the service to see if it it passing or not by running the
following command on the specific VM.

```bash
systemctl status ansible-pull.service
```

If the status is failed then you can run the following command and scroll to
the bottom to see what has gone wrong.

```bash
sudo journalctl -u ansible-pull.service
```

