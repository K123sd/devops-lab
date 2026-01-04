# Rootless Podman Setup

This container runs as a non-root user (`vamsi`) for enhanced security.

## How it starts on boot:
- A `@reboot` cron job runs:  
  `podman run -d --name my-web -p 8080:80 web-app`

## Why not systemd --user?
- RHEL 10 cloud instances often lack full user session support over SSH
- Cron `@reboot` is a reliable, portable alternative

## To manage:
- Stop: `podman stop my-web`
- Start: `podman start my-web` (or reboot)
- Logs: `podman logs my-web`
