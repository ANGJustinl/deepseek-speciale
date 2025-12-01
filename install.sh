#!/bin/bash
set -e
echo "Installing DeepSeek V3.2-Speciale CLI..."
pip3 install openai --quiet 2>/dev/null || pip install openai --quiet
mkdir -p ~/.local/bin
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp "$SCRIPT_DIR/deepseek_speciale.py" ~/.local/bin/
chmod +x ~/.local/bin/deepseek_speciale.py
cat > ~/.local/bin/deepseeks << 'EOF'
#!/bin/bash
python3 ~/.local/bin/deepseek_speciale.py "$@"
EOF
chmod +x ~/.local/bin/deepseeks
echo "Done! Run: deepseeks"
[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && echo "Add to PATH: export PATH=\"\$HOME/.local/bin:\$PATH\""
