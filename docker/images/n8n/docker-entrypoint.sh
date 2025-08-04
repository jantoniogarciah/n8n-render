#!/bin/sh

if [ -d /root/.n8n ] ; then
  chmod o+rx /root
  chown -R node /root/.n8n
  ln -s /root/.n8n /home/node/.n8n
fi

if [ "$#" -gt 0 ]; then
  # Got started with arguments
  exec n8n "$@"
else
  # Got started without arguments
  exec n8n start
fi