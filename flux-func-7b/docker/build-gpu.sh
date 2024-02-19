source ./VERSION

rm model.gguf || true
wget -qO model.gguf \
  https://huggingface.co/TheBloke/NexusRaven-V2-13B-GGUF/resolve/main/nexusraven-v2-13b.Q3_K_S.gguf

# Build GPU image
docker build \
-f Dockerfile.gpu \
--build-arg IMAGE=${IMAGE}-gpu \
-t ghcr.io/open-flux-ai/flux-func-7b:${VERSION}-gpu .

docker push ghcr.io/open-flux-ai/flux-func-7b:${VERSION}-gpu

rm model.gguf || true
