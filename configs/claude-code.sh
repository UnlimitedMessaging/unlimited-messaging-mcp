#!/bin/sh
# Adds the Unlimited Messaging MCP server to Claude Code.
# The first tool call opens a browser to sign in (Google, GitHub or email) and approve access.
# Add "--scope user" to make it available in every project.
claude mcp add --transport http unlimited-messaging https://mcp.unlimitedmessaging.app
