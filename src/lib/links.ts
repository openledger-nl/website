// Where things live. Releases: "latest" always has the newest version.
export const ORG = 'https://github.com/openledger-nl';
export const LEDGER_REPO = `${ORG}/ledger`;
export const LEDGER_RELEASE = `${LEDGER_REPO}/releases/latest`;
export const MARGIN_REPO = `${ORG}/margin`;
export const MARGIN_RELEASE = `${MARGIN_REPO}/releases/latest`;
export const BROWSER_REVIEW_SOURCE = `${MARGIN_REPO}/tree/main/browser-review`;
export const MARGIN_GITHUB_SOURCE = `${MARGIN_REPO}/tree/main/github`;
export const MCP_COMMAND = 'claude mcp add --scope user browser-review -- npx -y browser-review-mcp@latest';
