# auto-ffmpeg

Watch a directory for new `.ts` file's in any child directory and re-mux them to `.mkv`.

### Get started

```
sudo apt-get install inotify-tools
sudo apt-get install ffmpeg

cp autoffmpeg.sh to /usr/local/bin/autoffmpeg.sh
chmod +x /usr/local/bin/autoffmpeg.sh

sudo cp autoffmpeg.service /etc/systemd/system/autoffmpeg.service
sudo systemctl start autoffmpeg

# To start on boot:
sudo systemctl enable autoffmpeg

# Logs:
journalctl -f -u autoffmpeg

```
