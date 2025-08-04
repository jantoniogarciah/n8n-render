# Use the official n8n image as base
FROM docker.io/n8nio/n8n:1.24.0

# Switch to root to install additional dependencies
USER root

# Install any additional dependencies if needed
RUN apk update && \
    apk add --no-cache \
    python3 \
    build-base && \
    rm -rf /var/cache/apk/*

# Create required directories and set permissions
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node

# Ensure n8n is properly installed and available
RUN npm install -g n8n@1.24.0 && \
    npm cache clean --force

# Switch back to node user
USER node

# Set environment variables
ENV NODE_ENV=production
ENV N8N_PORT=5678
ENV PATH="/usr/local/lib/node_modules/n8n/bin:${PATH}"

# Verify n8n installation
RUN n8n --version

# Expose the default n8n port
EXPOSE 5678

# Use the default n8n entrypoint and command
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD ["n8n", "start"]