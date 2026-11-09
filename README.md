<!-- um-header:start (shared across UnlimitedMessaging repos, keep in sync) -->
<p align="center">
  <a href="https://unlimitedmessaging.app?utm_source=github&utm_medium=readme&utm_campaign=unlimited-messaging-mcp"><img src="https://unlimitedmessaging.app/assets/favicon/android-chrome-512x512.png" width="72" height="72" alt="Unlimited Messaging logo"></a>
</p>

<h1 align="center">Unlimited Messaging · MCP server</h1>

<p align="center">
  <b>WhatsApp, email and SMS from your own number, mailbox and Android phone, in one API request.</b><br>
  Free plan, unlimited messages. REST API, SDKs, n8n and an MCP server for Claude, ChatGPT and Cursor.
</p>

<p align="center">
  <a href="https://unlimitedmessaging.app?utm_source=github&utm_medium=readme&utm_campaign=unlimited-messaging-mcp"><img alt="Website" src="https://img.shields.io/badge/Website-0D1F16?style=flat-square"></a>
  <a href="https://app.unlimitedmessaging.app?utm_source=github&utm_medium=readme&utm_campaign=unlimited-messaging-mcp"><img alt="App" src="https://img.shields.io/badge/App-075E54?style=flat-square"></a>
  <a href="https://docs.unlimitedmessaging.app"><img alt="Docs" src="https://img.shields.io/badge/Docs-128C7E?style=flat-square"></a>
  <a href="https://unlimitedmessaging.app/mcp?utm_source=github&utm_medium=readme&utm_campaign=unlimited-messaging-mcp"><img alt="MCP" src="https://img.shields.io/badge/MCP-128C7E?style=flat-square"></a>
  <a href="https://unlimitedmessaging.app/pricing?utm_source=github&utm_medium=readme&utm_campaign=unlimited-messaging-mcp"><img alt="Pricing" src="https://img.shields.io/badge/Pricing-128C7E?style=flat-square"></a>
  <a href="https://www.npmjs.com/package/@unlimited-messaging/sdk"><img alt="npm" src="https://img.shields.io/badge/npm-cb0000?style=flat-square&logo=npm&logoColor=white"></a>
  <a href="https://pypi.org/project/unlimited-messaging"><img alt="PyPI" src="https://img.shields.io/badge/PyPI-3775a9?style=flat-square&logo=pypi&logoColor=white"></a>
  <a href="https://discord.gg/danrEJV5Xx"><img alt="Discord" src="https://img.shields.io/badge/Discord-5865F2?style=flat-square&logo=discord&logoColor=white"></a>
  <a href="https://x.com/unlimitedmess"><img alt="X" src="https://img.shields.io/badge/X-000000?style=flat-square&logo=x&logoColor=white"></a>
</p>

**Unlimited Messaging projects**

| Project | What it is |
| --- | --- |
| **[unlimited-messaging-mcp](https://github.com/UnlimitedMessaging/unlimited-messaging-mcp)** (this repo) | Hosted MCP server for Claude, ChatGPT, Cursor and any MCP client: setup guide and ready-to-paste configs |
| [unlimited-messaging-sdk](https://github.com/UnlimitedMessaging/unlimited-messaging-sdk) | OpenAPI spec, official TypeScript and Python SDKs, and the n8n node source |
| [unlimited-messaging-android](https://github.com/UnlimitedMessaging/unlimited-messaging-android) | Open source Android app: send and receive SMS from your own phone and SIM |
| [n8n-nodes-unlimited-messaging](https://www.npmjs.com/package/n8n-nodes-unlimited-messaging) | n8n community node for WhatsApp, email and SMS workflows, no code |
| [unlimitedmessaging.app](https://unlimitedmessaging.app?utm_source=github&utm_medium=readme&utm_campaign=unlimited-messaging-mcp) | Website, web app, pricing and guides |

<!-- um-header:end -->


## What this is

A **hosted remote MCP server** that gives Claude, ChatGPT, Cursor, VS Code, Windsurf and any other [Model Context Protocol](https://modelcontextprotocol.io) client the tools to send and read **WhatsApp, email and SMS** from your own accounts:

- **WhatsApp** from your own number, linked as a device by QR code.
- **Email** from your own mailbox, over IMAP/SMTP (Gmail, your own domain).
- **SMS** from your own Android phone's SIM, through the [open source Android app](https://github.com/UnlimitedMessaging/unlimited-messaging-android).

There is **nothing to install or run**: the server is operated by Unlimited Messaging. This repository holds the setup guide, ready-to-paste client configs and the [`server.json`](server.json) published to the official MCP Registry.

| | |
| --- | --- |
| Server URL | `https://mcp.unlimitedmessaging.app` |
| Transport | Streamable HTTP |
| Authorization | OAuth 2.1 with PKCE and dynamic client registration. No API key to copy. |
| MCP Registry name | [`app.unlimitedmessaging/mcp`](https://registry.modelcontextprotocol.io/v0/servers?search=app.unlimitedmessaging) |
| Legacy URL | `https://api.unlimitedmessaging.app/mcp` still works |
| Price | Included in every plan, the free plan too |

## Quick setup

Pick your client. The URL is the same everywhere: `https://mcp.unlimitedmessaging.app`

### Claude.ai and Claude Desktop

1. Open **Settings > Connectors > Add custom connector**.
2. Paste `https://mcp.unlimitedmessaging.app` and save.
3. Connect, sign in and approve access.

Step-by-step guide with screenshots: [unlimitedmessaging.app/articles/mcp-claude](https://unlimitedmessaging.app/articles/mcp-claude)

On a Claude Desktop setup that only reads `claude_desktop_config.json`, [`configs/claude-desktop.json`](configs/claude-desktop.json) bridges to the remote server with [`mcp-remote`](https://www.npmjs.com/package/mcp-remote) (needs Node.js). The connector above is the simpler route.

### ChatGPT

1. Turn on **developer mode** in ChatGPT's connector settings.
2. Create a custom connector with the URL `https://mcp.unlimitedmessaging.app`.
3. Sign in and approve access when ChatGPT asks.

Step-by-step guide: [unlimitedmessaging.app/articles/mcp-chatgpt](https://unlimitedmessaging.app/articles/mcp-chatgpt)

### Claude Code

One command in your terminal ([`configs/claude-code.sh`](configs/claude-code.sh)):

```sh
claude mcp add --transport http unlimited-messaging https://mcp.unlimitedmessaging.app
```

Add `--scope user` to make it available in every project.

### Cursor

Add this block to `~/.cursor/mcp.json` (all projects) or `.cursor/mcp.json` (one project). Copy of [`configs/cursor.json`](configs/cursor.json):

```json
{
  "mcpServers": {
    "unlimited-messaging": {
      "url": "https://mcp.unlimitedmessaging.app"
    }
  }
}
```

### VS Code

Add this to `.vscode/mcp.json` in your workspace, or run **MCP: Add Server** from the command palette and choose HTTP. Copy of [`configs/vscode.json`](configs/vscode.json):

```json
{
  "servers": {
    "unlimited-messaging": {
      "type": "http",
      "url": "https://mcp.unlimitedmessaging.app"
    }
  }
}
```

### Windsurf

Add this to `~/.codeium/windsurf/mcp_config.json`, then refresh the MCP servers list. Copy of [`configs/windsurf.json`](configs/windsurf.json):

```json
{
  "mcpServers": {
    "unlimited-messaging": {
      "serverUrl": "https://mcp.unlimitedmessaging.app"
    }
  }
}
```

### Any other MCP client

Add a remote server of type **Streamable HTTP** with the URL `https://mcp.unlimitedmessaging.app`. The client discovers the OAuth endpoints and registers itself. A client that only runs local (stdio) servers can use the `mcp-remote` bridge, as in [`configs/claude-desktop.json`](configs/claude-desktop.json).

## Sign-in and authorization

1. On the first tool call, your client opens the Unlimited Messaging sign-in page in your browser.
2. Sign in with **Google, GitHub or your email address**. No account yet? It is created in the same step, on the free plan, with no credit card.
3. A consent screen shows what the assistant will be able to do. You approve.
4. Your client stores the token and the tools appear. Nothing to copy or paste.

Under the hood: OAuth 2.1 authorization code flow with PKCE, dynamic client registration and the standard discovery documents, so compliant clients configure themselves from the URL alone. The assistant acts only on the accounts of the user who approved it.

## Tools

| Tool | What it does | Parameters |
| --- | --- | --- |
| `list-accounts` | Lists your linked accounts: WhatsApp numbers, email addresses (channel `EMAIL`) and SMS phones (channel `SMS`, one per SIM). | none |
| `get-account` | Details and status of one account, for example to check that a WhatsApp number is `ACTIVE` after scanning the QR code. | `accountId` (required) |
| `add-account` | Starts linking a WhatsApp number. Returns a QR code to scan from WhatsApp, **Settings > Linked devices > Link a device**. The QR code refreshes about every 20 seconds. | `mode` (optional, `stable` or `beta`, both use the same transport, kept for backwards compatibility) |
| `add-email-account` | Connects your own mailbox. Returns the page of the web app where you enter your address and password (or a Gmail app password); the server settings are filled in for you. Your password is never asked for in the chat. | none |
| `list-messages` | Browses your WhatsApp, email and SMS messages, with sender, channel and status. | `page`, `limit` (max 100), `accountId`, `channel` (`WHATSAPP`, `EMAIL`, `SMS`), `status`, `search` (all optional) |
| `send-message` | Sends a message by WhatsApp, email or SMS, or on several channels at once. | see below |

SMS accounts are added from the [Android app](https://github.com/UnlimitedMessaging/unlimited-messaging-android), not through MCP.

### `send-message` parameters

| Parameter | Description |
| --- | --- |
| `recipient` | Single-channel send: a phone number in international format (`+33612345678`), a WhatsApp group id, or an email address (sends by email). A phone number goes by WhatsApp unless `accountId` names an SMS account. |
| `to` | Multi-channel recipient: `{ "phone": "...", "email": "..." }`, used with `channels`. |
| `channels` | 1 to 3 entries of `{ "channel": "WHATSAPP" \| "SMS" \| "EMAIL", "accountId"?, "text"?, "html"?, "subject"? }`. One message goes out per channel. Requires `to`. |
| `text` | Message content. WhatsApp limits it to 1600 characters, SMS to 1530. |
| `html` | Rich email body. WhatsApp gets it as plain text when no `text` is given. |
| `subject` | Email subject. Required for email. |
| `accountId` | Account to send from, optional. Without it, Unlimited Messaging uses your account on that channel. |
| `replyToMessageId` | Reply to a message from `list-messages` instead of naming a recipient. Works on WhatsApp and email. |

The server instructs the assistant to ask for your confirmation before every send.

## Example prompts

- "Connect my WhatsApp" (shows the QR code to scan)
- "Connect my mailbox"
- "Send a WhatsApp to +33 6 12 34 56 78 saying the order shipped"
- "Email client@example.com that the order shipped, subject: Your order"
- "Text Lea by SMS and WhatsApp: the meeting moves to 3 pm"
- "List my latest messages"
- "Show me today's WhatsApp replies and draft answers"
- "Reply to the last email from Paul: Friday 2 pm works"

## Pricing

The MCP server is included in every plan. Messages are never billed one by one.

| | Free | Medium | Max |
| --- | :---: | :---: | :---: |
| Price | 0 EUR, no credit card | 19 EUR / month | 29 EUR / month |
| Unlimited messages | yes | yes | yes |
| MCP server, API, web app | yes | yes | yes |
| WhatsApp, email and SMS | yes | yes | yes |
| "Sent with UnlimitedMessaging.app" footer | yes | no | no |

Full comparison: [unlimitedmessaging.app/pricing](https://unlimitedmessaging.app/pricing)

## Good to know

- **WhatsApp is unofficial.** Your number is linked as a device on your normal WhatsApp account, not through Meta's official Business API. That means no template approval and no per-message fee, but sending spam can get the number banned by WhatsApp. Use it for your own conversations and opted-in contacts.
- **Email** works with IMAP/SMTP mailboxes. Outlook, Hotmail and Microsoft 365 are not supported yet.
- **SMS** goes out from your phone's SIM on your own carrier plan. The phone has to stay online with the app running. SMS is text only, and Android asks for confirmation above 30 SMS in 30 minutes, so the API spaces them out.
- **Hosted service.** The server runs on Unlimited Messaging's infrastructure, hosted in the EU. It is not self-hostable, and the server code is not in this repository.
- **Status.** Incidents are posted on [status.unlimitedmessaging.app](https://status.unlimitedmessaging.app).

## FAQ

**Which assistants work with it?**
Any client that accepts a remote MCP server: Claude.ai, Claude Desktop, Claude Code, ChatGPT, Cursor, VS Code, Windsurf and others. The URL is the same for all of them.

**Do I need an API key?**
No. Sign-in goes through OAuth: your assistant opens the sign-in page, you approve, done. API keys are only for the [REST API and SDKs](https://github.com/UnlimitedMessaging/unlimited-messaging-sdk).

**Is it free?**
Yes. The MCP server is in every plan, including the free plan, with no credit card and unlimited messages.

**Can the AI send a message without asking me?**
The server tells the assistant to have you confirm every send before it goes out.

**Do I need a Meta Business account or WhatsApp templates?**
No. You link your own WhatsApp number by QR code, like WhatsApp Web.

**Can I add an SMS phone from the assistant?**
No. Install the [Android app](https://github.com/UnlimitedMessaging/unlimited-messaging-android) and sign in: each SIM shows up as an SMS account that the assistant can use.

**How do I revoke access?**
Remove the connector or server from your client. Your accounts and messages stay in your Unlimited Messaging account.

**Something does not work?**
Check [status.unlimitedmessaging.app](https://status.unlimitedmessaging.app), ask on [Discord](https://discord.gg/danrEJV5Xx), or [open an issue](https://github.com/UnlimitedMessaging/unlimited-messaging-mcp/issues/new/choose).

## Links

- MCP page: [unlimitedmessaging.app/mcp](https://unlimitedmessaging.app/mcp)
- Guides: [MCP server overview](https://unlimitedmessaging.app/articles/mcp), [Claude](https://unlimitedmessaging.app/articles/mcp-claude), [ChatGPT](https://unlimitedmessaging.app/articles/mcp-chatgpt)
- Web app: [app.unlimitedmessaging.app](https://app.unlimitedmessaging.app)
- API docs: [docs.unlimitedmessaging.app](https://docs.unlimitedmessaging.app)
- Official MCP Registry: [`app.unlimitedmessaging/mcp`](https://registry.modelcontextprotocol.io/v0/servers?search=app.unlimitedmessaging)
- SDKs: [npm](https://www.npmjs.com/package/@unlimited-messaging/sdk), [PyPI](https://pypi.org/project/unlimited-messaging), [n8n node](https://www.npmjs.com/package/n8n-nodes-unlimited-messaging)
- Community: [Discord](https://discord.gg/danrEJV5Xx), [X](https://x.com/unlimitedmess), [Product Hunt](https://www.producthunt.com/products/unlimited-messaging)
- Contact: contact@unlimitedmessaging.app

## License

The documentation and configs in this repository are under the [MIT license](LICENSE). The hosted service is covered by the [Unlimited Messaging legal terms](https://unlimitedmessaging.app/legal).
