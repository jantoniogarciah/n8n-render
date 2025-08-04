# Use the official n8n image directly
FROM n8nio/n8n:1.24.0

# Set environment variables
ENV NODE_ENV=production
ENV N8N_PORT=5678

# Expose the default n8n port
EXPOSE 5678