#!/usr/bin/env bash
# https://developers.cloudflare.com/ai-gateway/configuration/authentication/

__main() {
  _sh_path=$(realpath "${BASH_SOURCE[0]}") && cd "${_sh_path%/*}" || exit 1

  curl -X POST "$CF_AIG_BASE_URL/v1/chat/completions" \
    --header 'content-type: application/json' \
    --header "Authorization: Bearer $OPENROUTER_TOKEN" \
    --data '{
      "model": "openai/gpt-4.1-nano",
      "messages": [
          {
              "role": "user",
              "content": "What is Cloudflare?"
          }
      ]
  }' | jq

}
__main "$@"
