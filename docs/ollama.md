# Ollama

```bash
# CPU only mode
docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

## Chat app

This a ChatGPT styled application running in Docker:

```bash
# default setup
docker run -d -p 3000:8080 \
  --add-host=host.docker.internal:host-gateway \
  -v open-webui:/app/backend/data --name open-webui \
  --restart always ghcr.io/open-webui/open-webui:main
```

> [Documentation](https://docs.openwebui.com/getting-started/)
